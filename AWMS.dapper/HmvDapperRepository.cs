using AWMS.dapper.Repositories;
using AWMS.dto;
using Dapper;
using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Configuration;
using System.Data;


namespace AWMS.dapper
{
    public class HmvDapperRepository : IHmvDapperRepository
    {
        private readonly string _connectionString;

        public HmvDapperRepository(IConfiguration configuration)
        {
            _connectionString = configuration.GetConnectionString("DefaultConnection")!;
        }

        private IDbConnection CreateConnection()
        {
            return new SqlConnection(_connectionString);
        }
        public async Task<IEnumerable<HmvAbleDto>> GetAllMaterialHmvableAsync(int companyId)
        {
            try
            {
                using (var connection = new SqlConnection(_connectionString))
                {
                    await connection.OpenAsync();
                    var result = await connection.QueryAsync<HmvAbleDto>(
                        "AllMaterialMrvHmvable3",
                        new { CompanyID = companyId },
                        commandType: CommandType.StoredProcedure);
                    return result;
                }
            }
            catch (Exception ex)
            {
                // لاگ کردن خطا یا مدیریت آن به شکل مناسب
                throw new Exception("خطا در اجرای Stored Procedure", ex);
            }
        }

        public async Task<bool> CheckHmvConditionAsync(int locItemId, int companyId, string requestNO)
        {
            using (var connection = CreateConnection())
            {
                var parameters = new { LocItemID = locItemId, CompanyID = companyId, RequestNO = requestNO };
                var result = await connection.QuerySingleAsync<int>("CheckMrvHmvCondition", parameters, commandType: CommandType.StoredProcedure);
                return result == 1;
            }
        }

        public class InsertHMVResult
        {
            public string NewHMVNumber { get; set; }
            public string Status { get; set; }
        }

        public async Task<string> InsertHmvBatchAsync(int companyId, int companyId2, int contractId, int contractId2, string hmvNo, int areaUnitId, int issuedBy, DateTime delDate, IEnumerable<NewHmvDto> requestHmvs)
        {
            using (var connection = CreateConnection())
            {
                var parameters = new DynamicParameters();
                parameters.Add("@CompanyID", companyId);
                parameters.Add("@CompanyID2", companyId2);
                parameters.Add("@ContractId", contractId);
                parameters.Add("@ContractId2", contractId2);
                parameters.Add("@HMVNO", hmvNo);
                parameters.Add("@AreaUnitID", areaUnitId);
                parameters.Add("@IssuedBy", issuedBy);
                parameters.Add("@DelDate", delDate);

                // Create a DataTable to pass to the table-valued parameter
                var hmvTable = new DataTable();
                hmvTable.Columns.Add("ReqHmvQty", typeof(decimal));
                hmvTable.Columns.Add("DelHmvQty", typeof(decimal));
                hmvTable.Columns.Add("DelHMvRejQty", typeof(decimal));
                hmvTable.Columns.Add("LocItemID", typeof(int));
                hmvTable.Columns.Add("Remark", typeof(string));
                hmvTable.Columns.Add("MRCNo", typeof(string)); // اضافه کردن فیلد Request برای اینکه فضا اشغال نشه ریختم توی این فیلد
                hmvTable.Columns.Add("TypeName", typeof(string));

                foreach (var hmv in requestHmvs)
                {
                    hmvTable.Rows.Add(hmv.HmvQty, hmv.HmvDelQty, hmv.HmvRejQty, hmv.LocItemID, hmv.Remark, hmv.RequestNO,hmv.typeName);
                }

                parameters.Add("@requestHmvs", hmvTable.AsTableValuedParameter("dbo.NewHMVDtoType"));

                try
                {
                    var result = await connection.QueryFirstOrDefaultAsync<InsertHMVResult>(
                    "[dbo].[spInsertHmv2025]",
                    parameters,
                    commandType: CommandType.StoredProcedure);

                    // بازگرداندن شماره HMV جدید و وضعیت
                    if (result != null)
                    {
                        return result.NewHMVNumber; // شماره HMV جدید
                    }
                    else
                    {
                        return null; // در صورتی که نتیجه‌ای وجود نداشته باشد
                    }
                }
                catch (SqlException ex)
                {
                    // Handling exceptions such as duplicate MRV number
                    throw new Exception($"Error inserting HMV: {ex.Message}", ex);
                }

            }
        }

        public async Task<bool> CheckHmvNameAsync(int companyId, string hmvNo)
        {
            using (var connection = CreateConnection())
            {
                var parameters = new {CompanyID = companyId, hmvNo = hmvNo };
                var result = await connection.QuerySingleAsync<int>("CheckHmvNameCondition", parameters, commandType: CommandType.StoredProcedure);
                return result == 1;
            }
        }
    }
}
