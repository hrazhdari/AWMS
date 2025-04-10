using AWMS.dapper.Repositories;
using AWMS.dto;
using Dapper;
using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Configuration;
using System.Data;

namespace AWMS.dapper
{
    public class UserDapperRepository : IUserDapperRepository
    {
        private readonly string _connectionString;

        public UserDapperRepository(IConfiguration configuration)
        {
            _connectionString = configuration.GetConnectionString("DefaultConnection")!;
        }

        private IDbConnection CreateConnection()
        {
            return new SqlConnection(_connectionString);
        }

        public async Task<int> AddUserAsync(UserDto user)
        {
            const string spName = "sp_AddUser2025";
            var parameters = new DynamicParameters();
            parameters.Add("@Username", user.Username);
            parameters.Add("@PasswordHash", user.PasswordHash);
            parameters.Add("@RoleID", user.RoleID);

            using (var connection = CreateConnection())
            {
                try
                {
                    // مقدار UserID برگشتی را دریافت کنید
                    int userId = await connection.QuerySingleAsync<int>(spName, parameters, commandType: CommandType.StoredProcedure);
                    //Console.WriteLine($"UserID returned: {userId}");
                    return userId;
                }
                catch (Exception ex)
                {
                    //Console.WriteLine($"Error: {ex.Message}");
                    throw;
                }
            }
        }


        public async Task<int> DeleteUserAsync(int userId)
        {
            const string spName = "sp_DeleteUser";
            var parameters = new { UserID = userId };

            using (var connection = CreateConnection())
            {
                return await connection.ExecuteAsync(spName, parameters, commandType: CommandType.StoredProcedure);
            }
        }

        public async Task<IEnumerable<UserDto>> GetAllUsersAsync()
        {
            const string spName = "sp_GetAllUsers";

            using (var connection = CreateConnection())
            {
                return await connection.QueryAsync<UserDto>(spName, commandType: CommandType.StoredProcedure);
            }
        }
        public async Task<IEnumerable<RoleDto>> GetAllRolesAsync()
        {
            const string spName = "sp_GetAllRoles";

            using (var connection = CreateConnection())
            {
                return await connection.QueryAsync<RoleDto>(spName, commandType: CommandType.StoredProcedure);
            }
        }

        public IEnumerable<UserDto> GetAllUsers()
        {
            const string spName = "sp_GetAllUsers";

            using (var connection = CreateConnection())
            {
                return connection.Query<UserDto>(spName, commandType: CommandType.StoredProcedure);
            }
        }

        public async Task<UserDto> GetUserByIdAsync(int userId)
        {
            const string spName = "sp_GetUserById";
            var parameters = new { UserID = userId };

            using (var connection = CreateConnection())
            {
                return await connection.QuerySingleOrDefaultAsync<UserDto>(spName, parameters, commandType: CommandType.StoredProcedure);
            }
        }

        public async Task<UserDto> GetUserByUsernameAsync(string username)
        {
            const string spName = "sp_GetUserByUsername";
            var parameters = new { Username = username };

            using (var connection = CreateConnection())
            {
                return await connection.QuerySingleOrDefaultAsync<UserDto>(spName, parameters, commandType: CommandType.StoredProcedure);
            }
        }

        public async Task<int> UpdateUserAsync(UserDto user)
        {
            const string spName = "sp_UpdateUser";
            var parameters = new
            {
                user.UserID,
                user.Username,
                user.PasswordHash,
                user.RoleID
            };

            using (var connection = CreateConnection())
            {
                return await connection.ExecuteAsync(spName, parameters, commandType: CommandType.StoredProcedure);
            }
        }



        public async Task<IEnumerable<ApplicationPermissionDto>> GetPermissionsByRoleIdAsync(int roleId)
        {
            const string spName = "sp_GetPermissionsByRoleId";
            var parameters = new { RoleID = roleId };

            using (var connection = CreateConnection())
            {
                return await connection.QueryAsync<ApplicationPermissionDto>(spName, parameters, commandType: CommandType.StoredProcedure);
            }
        }
        public async Task<bool> UpdatePermissionsUsingStoredProcedureAsync(int roleId, List<dynamic> permissions)
        {
            using (var connection = CreateConnection())
            {
                try
                {
                    // تبدیل داده‌ها به DataTable
                    var dataTable = new DataTable();
                    dataTable.Columns.Add("RoleID", typeof(int));
                    dataTable.Columns.Add("RibbonPageName", typeof(string));
                    dataTable.Columns.Add("IsEnabled", typeof(bool));

                    foreach (var permission in permissions)
                    {
                        dataTable.Rows.Add(permission.RoleID, permission.RibbonPageName, permission.IsEnabled);
                    }

                    // تنظیم پارامترها
                    var parameters = new DynamicParameters();
                    parameters.Add("@RoleID", roleId, DbType.Int32);
                    parameters.Add("@Permissions", dataTable.AsTableValuedParameter("dbo.AWMSPermissionType2"));

                    // اجرای Stored Procedure
                    await connection.ExecuteAsync("[dbo].[sp_UpdateRolePermissions]", parameters, commandType: CommandType.StoredProcedure);

                    return true;
                }
                catch (Exception ex)
                {
                    // چاپ جزئیات خطا
                    Console.WriteLine($"Error: {ex.Message}");
                    Console.WriteLine($"Stack Trace: {ex.StackTrace}");
                    return false;
                }
            }
        }

        public async Task<bool> UpdatePermissionsUsingJsonAsync(int roleId, string jsonPermissions)
        {
            using (var connection = CreateConnection())
            {
                try
                {
                    // تنظیم پارامترها
                    var parameters = new DynamicParameters();
                    parameters.Add("@RoleID", roleId, DbType.Int32);
                    parameters.Add("@PermissionsJson", jsonPermissions, DbType.String);

                    // اجرای Stored Procedure
                    await connection.ExecuteAsync("sp_UpdateRolePermissionsJson", parameters, commandType: CommandType.StoredProcedure);

                    return true;
                }
                catch
                {
                    return false;
                }
            }
        }
        public async Task<int> UpdateUserPasswordAsync(UserDto user)
        {
            const string spName = "sp_UpdateUserPasswordAd"; // نام Stored Procedure جدید برای فقط تغییر پسورد
            var parameters = new
            {
                user.UserID,
                user.PasswordHash
            };

            using (var connection = CreateConnection())
            {
                return await connection.ExecuteAsync(spName, parameters, commandType: CommandType.StoredProcedure);
            }
        }


    }
}
