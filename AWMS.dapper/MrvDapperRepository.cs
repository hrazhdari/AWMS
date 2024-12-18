using AWMS.dapper.Repositories;
using AWMS.dto;
using Azure.Core;
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
                    "AllMaterialMrvHmvable2025",//"AllMaterialMrvable4",
                    new { CompanyID = companyId },
                    commandType: CommandType.StoredProcedure);
                return result;
            }
        }
        public async Task<bool> CheckMrvConditionAsync(int locItemId, int companyId, string requestNO)
        {
            using (var connection = CreateConnection())
            {
                var parameters = new { LocItemID = locItemId, CompanyID = companyId, RequestNO = requestNO };
                var result = await connection.QuerySingleAsync<int>("CheckMrvHmvCondition", parameters, commandType: CommandType.StoredProcedure);
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
                mrvTable.Columns.Add("MrcNo", typeof(string)); // اضافه کردن فیلد Request برای اینکه فضا اشغال نشه ریختم توی این فیلد
                mrvTable.Columns.Add("SelectedLocation", typeof(int));
                mrvTable.Columns.Add("TypeName", typeof(string));

                foreach (var mrv in requestMrvs)
                {
                    mrvTable.Rows.Add(mrv.ReqMrvQty, mrv.DelMrvQty, mrv.DelMrvRejQty, mrv.LocItemID, mrv.Remark, mrv.RequestNO, mrv.SelectedLocation, mrv.typeName);
                }

                parameters.Add("@RequestMrvs", mrvTable.AsTableValuedParameter("dbo.NewMRVDtoType5"));

                try
                {
                    var result = await connection.QueryFirstOrDefaultAsync<InsertMRVResult>(
                    "[dbo].[spInsertMrv2025]",
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

        public async Task<bool> CheckMrvNameAsync(int companyId, string mrvNo)
        {
            using (var connection = CreateConnection())
            {
                var parameters = new { CompanyID = companyId, MrvNo = mrvNo };
                var result = await connection.QuerySingleAsync<int>("CheckMrvNameCondition", parameters, commandType: CommandType.StoredProcedure);
                return result == 1;
            }

        }





        public async Task<List<string>> GetMrvsAsync()
        {
            using (var connection = CreateConnection())
            {
                // اجرای کوئری و بازگرداندن نتیجه به صورت List<string>
                var requestNos = await connection.QueryAsync<string>("ALLMrvs", commandType: CommandType.StoredProcedure);
                return requestNos.ToList();
            }
        }

        public async Task<MrvInfoDto> GetMrvsInfoAsync(string req)
        {
            using (var connection = CreateConnection())
            {

                var parameters = new { RequestNO = req };
                // استفاده از QueryFirstOrDefaultAsync به جای QueryAsync برای بازگرداندن یک شیء منفرد از نوع MrvInfoDto
                var requestInfo = await connection.QueryFirstOrDefaultAsync<MrvInfoDto>(
                    "ALLMrvInfo",
                    parameters,
                    commandType: CommandType.StoredProcedure
                );

                return requestInfo;
            }
        }

        public async Task<IEnumerable<MrvUpdateDto>> GetMrvByMrvNoAsync(string req)
        {
            using (var connection = CreateConnection())
            {

                var parameters = new { RequestNO = req };
                // استفاده از QueryFirstOrDefaultAsync به جای QueryAsync برای بازگرداندن یک شیء منفرد از نوع MrvInfoDto
                var requestInfo = await connection.QueryAsync<MrvUpdateDto>(
                    "GetInfoMrv",
                    parameters,
                    commandType: CommandType.StoredProcedure
                );

                return requestInfo;
            }
        }

        public async Task<bool> UpdateMrvNameAsync(string req, string mrvName)
        {
            using (var connection = CreateConnection())
            {
                var parameters = new DynamicParameters();
                parameters.Add("RequestNO", req, DbType.String);
                parameters.Add("MrvNo", mrvName, DbType.String);
                parameters.Add("Success", dbType: DbType.Boolean, direction: ParameterDirection.Output);

                // Execute the stored procedure
                await connection.ExecuteAsync("updateMrvName", parameters, commandType: CommandType.StoredProcedure);

                // Get the output parameter value
                bool success = parameters.Get<bool>("Success");
                return success;
            }
        }

        public async Task<bool> UpdateMrvCompanyAsync(string mrvno, int mrvcopany)
        {
            using (var connection = CreateConnection())
            {
                var parameters = new DynamicParameters();
                parameters.Add("RequestNO", mrvno, DbType.String);
                parameters.Add("MrvCompany", mrvcopany, DbType.Int32);
                parameters.Add("Success", dbType: DbType.Boolean, direction: ParameterDirection.Output);

                // Execute the stored procedure
                await connection.ExecuteAsync("updateMrvCompany", parameters, commandType: CommandType.StoredProcedure);

                // Get the output parameter value
                bool success = parameters.Get<bool>("Success");
                return success;
            }
        }

        public async Task UpdateMrvRemarksAsync(List<UpdateMrvRemarkDto> updateDtos)
        {
            using (var connection = CreateConnection())
            {
                var dataTable = new DataTable();
                dataTable.Columns.Add("LocItemID", typeof(int));
                dataTable.Columns.Add("RemarkRequests", typeof(string));
                dataTable.Columns.Add("MRVRequest", typeof(string));
                dataTable.Columns.Add("EditedBy", typeof(string));
                dataTable.Columns.Add("EditedDate", typeof(DateTime));

                foreach (var dto in updateDtos)
                {
                    dataTable.Rows.Add(dto.LocItemID, dto.RemarkRequests,dto.MRVRequest, dto.EditedBy, dto.EditedDate);
                }

                var parameters = new DynamicParameters();
                parameters.Add("@UpdateMrvRemarkTVP", dataTable.AsTableValuedParameter("dbo.UpdateMrvRemarkType"));

                try
                {
                    await connection.ExecuteAsync("UpdateMRVRemark", parameters, commandType: CommandType.StoredProcedure);
                }
                catch (Exception ex)
                {
                    // ثبت خطا برای اشکال‌زدایی
                    Console.WriteLine($"Error: {ex.Message}");
                    throw;
                }
            }
        }

        public async Task UpdateMrvQtyAsync(List<UpdateMRVqtiesDto> updateDtos)
        {
            using (var connection = CreateConnection())
            {
                var dataTable = new DataTable();
                dataTable.Columns.Add("LocItemID", typeof(int));
                dataTable.Columns.Add("ReqLocItemID", typeof(int));
                dataTable.Columns.Add("PLocItemIDforMRV", typeof(int));
                dataTable.Columns.Add("ReqMrvQty", typeof(decimal));
                dataTable.Columns.Add("DelMrvQty", typeof(decimal));
                dataTable.Columns.Add("DelMrvRejQty", typeof(decimal));
                dataTable.Columns.Add("MRVRequest", typeof(string));
                dataTable.Columns.Add("EditedBy", typeof(string));
                dataTable.Columns.Add("EditedDate", typeof(DateTime));

                foreach (var dto in updateDtos)
                {
                    dataTable.Rows.Add(dto.LocItemID, dto.ReqLocItemID, dto.PLocItemIDforMRV, dto.ReqMrvQty,dto.DelMrvQty,dto.DelMrvRejQty, dto.MRVRequest, dto.EditedBy, dto.EditedDate);
                }

                var parameters = new DynamicParameters();
                parameters.Add("@UpdateMrvQtyTVP", dataTable.AsTableValuedParameter("dbo.UpdateMrvQtType"));

                try
                {
                    await connection.ExecuteAsync("UpdateMRVQty2025", parameters, commandType: CommandType.StoredProcedure);
                }
                catch (Exception ex)
                {
                    // ثبت خطا برای اشکال‌زدایی
                    //Console.WriteLine($"Error: {ex.Message}");
                    throw;
                }
            }
        }
        public async Task DeleteMrvRowAsync(int ReqLocItemID, string mrvno)
        {
            using (var connection = CreateConnection())
            {
                var parameters = new DynamicParameters();
                parameters.Add("@ReqLocItemID", ReqLocItemID);
                parameters.Add("@RequestNO", mrvno);

                try
                {
                    await connection.ExecuteAsync("DeleteMrvRow", parameters, commandType: CommandType.StoredProcedure);
                }
                catch (Exception ex)
                {
                    Console.WriteLine($"Error: {ex.Message}");
                    throw;
                }
            }
        }

        public async Task DeleteMrvAsync(string mrvno)
        {
            using (var connection = CreateConnection())
            {
                var parameters = new DynamicParameters();
                parameters.Add("@RequestNO", mrvno);

                try
                {
                    await connection.ExecuteAsync("DeleteMRVByMRVNO", parameters, commandType: CommandType.StoredProcedure);
                }
                catch (Exception ex)
                {
                    Console.WriteLine($"Error: {ex.Message}");
                    throw;
                }
            }
        }
    }
}
