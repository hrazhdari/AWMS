﻿using AWMS.dapper.Repositories;
using AWMS.dto;
using Dapper;
using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Configuration;
using System.Data;


namespace AWMS.dapper
{
    public class MrvDapperRepository : IMrvDapperRepository
    {
        private readonly string _connectionString;

        public MrvDapperRepository(IConfiguration configuration)
        {
            _connectionString = configuration.GetConnectionString("DefaultConnection")!;
        }

        private IDbConnection CreateConnection()
        {
            return new SqlConnection(_connectionString);
        }
        public async Task<IEnumerable<MrvAbleDto>> GetAllMaterialMrvableAsync(int companyId)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                await connection.OpenAsync();
                var result = await connection.QueryAsync<MrvAbleDto>(
                    "AllMaterialMrvable2",
                    new { CompanyID = companyId },
                    commandType: CommandType.StoredProcedure);
                return result;
            }
        }
        public async Task<bool> CheckMrvConditionAsync(int locItemId, int companyId)
        {
            using (var connection = CreateConnection())
            {
                var parameters = new { LocItemID = locItemId, CompanyID = companyId };
                var result = await connection.QuerySingleAsync<int>("CheckMrvCondition", parameters, commandType: CommandType.StoredProcedure);
                return result == 1;
            }
        }
        public class InsertMRVResult
        {
            public string NewMRVNumber { get; set; }
            public string Status { get; set; }
        }

        public async Task<string> InsertMrvBatchAsync(int companyId, int contractId, string mrvNo, int areaUnitId, int issuedBy, DateTime delDate, IEnumerable<NewMrvDto> requestMrvs)
        {
            using (var connection = CreateConnection())
            {
                var parameters = new DynamicParameters();
                parameters.Add("@CompanyID", companyId);
                parameters.Add("@ContractId", contractId);
                parameters.Add("@MRVNO", mrvNo);
                parameters.Add("@AreaUnitID", areaUnitId);
                parameters.Add("@IssuedBy", issuedBy);
                parameters.Add("@DelDate", delDate);

                // Create a DataTable to pass to the table-valued parameter
                var mrvTable = new DataTable();
                mrvTable.Columns.Add("ReqMrvQty", typeof(decimal));
                mrvTable.Columns.Add("DelMrvQty", typeof(decimal));
                mrvTable.Columns.Add("DelMrvRejQty", typeof(decimal));
                mrvTable.Columns.Add("LocItemID", typeof(int));
                mrvTable.Columns.Add("Remark", typeof(string));
                mrvTable.Columns.Add("SelectedLocation", typeof(int));

                foreach (var mrv in requestMrvs)
                {
                    mrvTable.Rows.Add(mrv.ReqMrvQty, mrv.DelMrvQty, mrv.DelMrvRejQty, mrv.LocItemID, mrv.Remark, mrv.SelectedLocation);
                }

                parameters.Add("@RequestMrvs", mrvTable.AsTableValuedParameter("dbo.NewMRVDtoType"));

                try
                {
                    var result = await connection.QueryFirstOrDefaultAsync<InsertMRVResult>(
                    "[dbo].[InsertMRVBatch5]",
                    parameters,
                    commandType: CommandType.StoredProcedure);

                    // بازگرداندن شماره MRV جدید و وضعیت
                    if (result != null)
                    {
                        return result.NewMRVNumber; // شماره MRV جدید
                    }
                    else
                    {
                        return null; // در صورتی که نتیجه‌ای وجود نداشته باشد
                    }
                }
                catch (SqlException ex)
                {
                    // Handling exceptions such as duplicate MRV number
                    throw new Exception($"Error inserting MRV: {ex.Message}", ex);
                }

            }
        }
    }
}
