using AWMS.dapper.Repositories;
using AWMS.dto;
using Dapper;
using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Configuration;
using System.Data;

namespace AWMS.dapper
{
    public class InspectionDapperRepository : IInspectionDapperRepository
    {
        private readonly string _connectionString;

        public InspectionDapperRepository(IConfiguration configuration)
        {
            _connectionString = configuration.GetConnectionString("DefaultConnection")!;
        }

        private IDbConnection CreateConnection()
        {
            return new SqlConnection(_connectionString);
        }
   

        public async Task<List<InspectionDetailsDto>> GetInspectionDetails()
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                string storedProcedure = "GetInspectionDetails";

                // استفاده از await برای اجرای عملیات به صورت غیرهمزمان
                var result = await connection.QueryAsync<InspectionDetailsDto>(
                    storedProcedure,
                    commandType: System.Data.CommandType.StoredProcedure
                );

                // تبدیل نتیجه به لیست و بازگرداندن آن
                return result.ToList();
            }
        }

        public async Task UpdateInspectionDetailsAsync(UpdateInspectionDetailsDto updatedRow)
        {
            using (var connection = CreateConnection())
            {
                string storedProcedure = "UpdateInspectionDetails";

                // اگر PLId وجود نداشت، باید داده جدیدی وارد کنید
                var parameters = new DynamicParameters();
                parameters.Add("@PLId", updatedRow.PLId);
                parameters.Add("@IrnId", updatedRow.IrnId);
                parameters.Add("@IRN_Conflict", updatedRow.IRN_Conflict);
                parameters.Add("@IVR_NO", updatedRow.IVR_NO);
                parameters.Add("@IVR_IFR", updatedRow.IVR_IFR);
                parameters.Add("@OrderStatus", updatedRow.OrderStatus);
                parameters.Add("@ThirdParty", updatedRow.ThirdParty);
                parameters.Add("@OPI", updatedRow.OPI);
                parameters.Add("@Description", updatedRow.Description);
                parameters.Add("@IcNo", updatedRow.IcNo);
                parameters.Add("@SubProject", updatedRow.SubProject);
                parameters.Add("@Site", updatedRow.Site);
                parameters.Add("@Laydown", updatedRow.Laydown);
                parameters.Add("@Warehouse", updatedRow.Warehouse);
                parameters.Add("@OSBL", updatedRow.OSBL);
                parameters.Add("@VisualInspection", updatedRow.VisualInspection);
                parameters.Add("@QuantityCheck", updatedRow.QuantityCheck);
                parameters.Add("@Marking", updatedRow.Marking);
                parameters.Add("@Unloading", updatedRow.Unloading);
                parameters.Add("@EditedBy", updatedRow.EditedBy);
                parameters.Add("@EditedDate", updatedRow.EditedDate);

                // اجرای پروسیجر برای آپدیت
                await connection.ExecuteAsync(storedProcedure, parameters, commandType: CommandType.StoredProcedure);
            }
        }
        public async Task<IEnumerable<InspectionNotHaveMsrDto>> GetInspectionDetailsWithEmptyMSRAsync()
        {
            using (var connection = CreateConnection())
            {
                string storedProcedure = "GetInspectionWithEmptyMSRNO2025"; // نام استور پروسیجر را وارد کنید

                // اجرای استور پروسیجر و دریافت داده‌ها
                var result = await connection.QueryAsync<InspectionNotHaveMsrDto>(
                    storedProcedure,
                    commandType: CommandType.StoredProcedure
                );

                return result;
            }
        }

        public async Task<string> RegisterMsrAsync(int plId, int userID)
        {
            using (var connection = CreateConnection())
            {
                var parameters = new DynamicParameters();
                parameters.Add("@PLId", plId);
                parameters.Add("@userID", userID);
                parameters.Add("@NewMSRNo", dbType: DbType.String, size: 10, direction: ParameterDirection.Output);

                await connection.ExecuteAsync("RegisterMSR", parameters, commandType: CommandType.StoredProcedure);

                // دریافت شماره جدید MSR از پارامتر خروجی
                return parameters.Get<string>("@NewMSRNo");
            }
        }

        public async Task<IEnumerable<InspectionMsrRevDto>> GetInspectionDetailsWithMSRAsync()
        {
            using (var connection = CreateConnection())
            {
                string storedProcedure = "GetInspectionWithMSRNO2025"; // نام استور پروسیجر را وارد کنید

                // اجرای استور پروسیجر و دریافت داده‌ها
                var result = await connection.QueryAsync<InspectionMsrRevDto>(
                    storedProcedure,
                    commandType: CommandType.StoredProcedure
                );

                return result;
            }
        }

        public async Task<string> UpdateMsrRevAsync(int plId, int msrRev, int userID)
        {
            try
            {
                using (var connection = new SqlConnection(_connectionString))
                {
                    await connection.OpenAsync();

                    var parameters = new DynamicParameters();
                    parameters.Add("@PLId", plId, DbType.Int32);
                    parameters.Add("@MSRRev", msrRev, DbType.Int32);
                    parameters.Add("@UserID", userID, DbType.Int32);
                    parameters.Add("@NewMsrNo", dbType: DbType.String, direction: ParameterDirection.Output, size: 50);

                    await connection.ExecuteAsync("UpdateMsrRev2025", parameters, commandType: CommandType.StoredProcedure);

                    // مقدار خروجی را دریافت کنید
                    return parameters.Get<string>("@NewMsrNo");
                }
            }
            catch (Exception ex)
            {
                // مدیریت خطاها
                throw new Exception($"Error in UpdateMsrRevAsync: {ex.Message}", ex);
            }
        }
        public async Task<bool> ClearMsrAsync(int plId)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                var parameters = new DynamicParameters();
                parameters.Add("@PLId", plId);

                var result = await connection.ExecuteAsync("ClearMsrData", parameters, commandType: CommandType.StoredProcedure);
                return result > 0;
            }
        }




        public async Task<List<GetAllMSRDto>> GetAllMsrNoAsync()
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                var result = await connection.QueryAsync<GetAllMSRDto>(
                    "[dbo].[GetAllMsrNo]",
                    commandType: CommandType.StoredProcedure);
                return result.ToList();
            }
        }

        public async Task<List<MsrHeaderDetailsDto>> GetMsrHeaderDetailsPLIdAsync(int plId)
        {
            try
            {
                using var connection = new SqlConnection(_connectionString);
                await connection.OpenAsync(); // Open the connection asynchronously

                var result = await connection.QueryAsync<MsrHeaderDetailsDto>(
                    "[dbo].[GetMsrHeaderDetailsByPLId]",
                    new { PLId = plId },
                    commandType: CommandType.StoredProcedure,
                    commandTimeout: 120 // 120 seconds
                );

                return result.ToList(); // Convert the result to a list
            }
            catch (SqlException ex) when (ex.Number == -2) // SQL timeout exception
            {
                throw new Exception("The operation timed out. Please try again later.");
            }
            catch (Exception ex)
            {
                throw new Exception($"An error occurred while fetching data: {ex.Message}");
            }
        }

        public async Task<List<MsrDetailDetailsDto>> GetMsrDetailDetailsByPLIdAsync(int plId)
        {
            try
            {
                using var connection = new SqlConnection(_connectionString);
                await connection.OpenAsync(); // Open the connection asynchronously

                var result = await connection.QueryAsync<MsrDetailDetailsDto>(
                    "[dbo].[GetMsrDetailDetailsByPLId]",
                    new { PLId = plId },
                    commandType: CommandType.StoredProcedure,
                    commandTimeout: 120 // 120 seconds
                );

                return result.ToList(); // Convert the result to a list
            }
            catch (SqlException ex) when (ex.Number == -2) // SQL timeout exception
            {
                throw new Exception("The operation timed out. Please try again later.");
            }
            catch (Exception ex)
            {
                throw new Exception($"An error occurred while fetching data: {ex.Message}");
            }
        }
    }
}
