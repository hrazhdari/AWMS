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
        public async Task<IEnumerable<MrvAbleDto>> GetAllMaterialHmvableAsync(int companyId)
        {
            try
            {
                using (var connection = new SqlConnection(_connectionString))
                {
                    await connection.OpenAsync();
                    var result = await connection.QueryAsync<MrvAbleDto>(
                        "AllMaterialMrvHmvable2025",//"AllMaterialMrvHmvable3",
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

        public async Task<List<string>> GetHmvsAsync()
        {
            using (var connection = CreateConnection())
            {
                // اجرای کوئری و بازگرداندن نتیجه به صورت List<string>
                var requestNos = await connection.QueryAsync<string>("ALLHmvs", commandType: CommandType.StoredProcedure);
                return requestNos.ToList();
            }
        }

        public async Task<HmvInfoDto> GetHmvsInfoAsync(string req)
        {
            using (var connection = CreateConnection())
            {

                var parameters = new { RequestNO = req };
             
                var requestInfo = await connection.QueryFirstOrDefaultAsync<HmvInfoDto>(
                    "ALLHmvinfo",
                    parameters,
                    commandType: CommandType.StoredProcedure
                );

                return requestInfo;
            }
        }

        public async Task<IEnumerable<HmvUpdateDto>> GetHmvByHmvNoAsync(string req)
        {
            using (var connection = CreateConnection())
            {

                var parameters = new { RequestNO = req };

                var requestInfo = await connection.QueryAsync<HmvUpdateDto>(
                    "GetInfoHmv",
                    parameters,
                    commandType: CommandType.StoredProcedure
                );

                return requestInfo;
            }
        }

        public async Task<bool> UpdateHmvNameAsync(string req, string hmvName)
        {
            using (var connection = CreateConnection())
            {
                var parameters = new DynamicParameters();
                parameters.Add("RequestNO", req, DbType.String);
                parameters.Add("HmvNo", hmvName, DbType.String);
                parameters.Add("Success", dbType: DbType.Boolean, direction: ParameterDirection.Output);

                // Execute the stored procedure
                await connection.ExecuteAsync("updateHmvName", parameters, commandType: CommandType.StoredProcedure);

                // Get the output parameter value
                bool success = parameters.Get<bool>("Success");
                return success;
            }
        }

        public async Task<bool> UpdateHmvCompanyAsync(string hmvno, int hmvcompany)
        {
            using (var connection = CreateConnection())
            {
                var parameters = new DynamicParameters();
                parameters.Add("RequestNO", hmvno, DbType.String);
                parameters.Add("HmvCompany", hmvcompany, DbType.Int32);
                parameters.Add("Success", dbType: DbType.Boolean, direction: ParameterDirection.Output);

                // Execute the stored procedure
                await connection.ExecuteAsync("updateHmvCompany", parameters, commandType: CommandType.StoredProcedure);

                // Get the output parameter value
                bool success = parameters.Get<bool>("Success");
                return success;
            }
        }



        public async Task UpdateHmvRemarksAsync(List<UpdateMrvRemarkDto> updateDtos)
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
                    dataTable.Rows.Add(dto.LocItemID, dto.RemarkRequests, dto.MRVRequest, dto.EditedBy, dto.EditedDate);
                }

                var parameters = new DynamicParameters();
                parameters.Add("@UpdateMrvRemarkTVP", dataTable.AsTableValuedParameter("dbo.UpdateMrvRemarkType"));

                try
                {
                    await connection.ExecuteAsync("UpdateHMVRemark", parameters, commandType: CommandType.StoredProcedure);
                }
                catch (Exception ex)
                {
                    // ثبت خطا برای اشکال‌زدایی
                    Console.WriteLine($"Error: {ex.Message}");
                    throw;
                }
            }
        }

        public async Task UpdateHmvQtyAsync(List<updateHMVqtiesDto> updateDtos)
        {
            using (var connection = CreateConnection())
            {
                var dataTable = new DataTable();
                dataTable.Columns.Add("LocItemID", typeof(int));
                dataTable.Columns.Add("ReqLocItemID", typeof(int));
                dataTable.Columns.Add("PLocItemIDforMRV", typeof(int));
                dataTable.Columns.Add("ReqHmvQty", typeof(decimal));
                dataTable.Columns.Add("DelHmvQty", typeof(decimal));
                dataTable.Columns.Add("DelHmvRejQty", typeof(decimal));
                dataTable.Columns.Add("HMVRequest", typeof(string));
                dataTable.Columns.Add("EditedBy", typeof(string));
                dataTable.Columns.Add("EditedDate", typeof(DateTime));

                foreach (var dto in updateDtos)
                {
                    dataTable.Rows.Add(dto.LocItemID, dto.ReqLocItemID,1,  dto.ReqHmvQty, dto.DelHmvQty, dto.DelHmvRejQty, dto.HMVRequest, dto.EditedBy, dto.EditedDate);
                }

                var parameters = new DynamicParameters();
                parameters.Add("@UpdateMrvQtyTVP", dataTable.AsTableValuedParameter("dbo.UpdateMrvQtType"));

                try
                {
                    await connection.ExecuteAsync("UpdateHMVQty2025", parameters, commandType: CommandType.StoredProcedure);
                }
                catch (Exception ex)
                {
                    // ثبت خطا برای اشکال‌زدایی
                    //Console.WriteLine($"Error: {ex.Message}");
                    throw;
                }
            }
        }

        public async Task DeleteHmvRowAsync(int ReqLocItemID, string hmvno)
        {
            using (var connection = CreateConnection())
            {
                var parameters = new DynamicParameters();
                parameters.Add("@ReqLocItemID", ReqLocItemID);
                parameters.Add("@RequestNO", hmvno);

                try
                {
                    await connection.ExecuteAsync("DeleteHmvRow", parameters, commandType: CommandType.StoredProcedure);
                }
                catch (Exception ex)
                {
                    Console.WriteLine($"Error: {ex.Message}");
                    throw;
                }
            }
        }

        public async Task DeleteHmvAsync(string hmvno)
        {
            using (var connection = CreateConnection())
            {
                var parameters = new DynamicParameters();
                parameters.Add("@RequestNO", hmvno);

                try
                {
                    await connection.ExecuteAsync("DeleteHMVByHMVNO", parameters, commandType: CommandType.StoredProcedure);
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
