using AWMS.dapper.Repositories;
using AWMS.dto;
using Dapper;
using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Configuration;
using System.Data;

namespace AWMS.dapper
{
    public class ChangeDapperRepository : IChangeDapperRepository
    {
        private readonly string _connectionString;

        public ChangeDapperRepository(IConfiguration configuration)
        {
            _connectionString = configuration.GetConnectionString("DefaultConnection")!;
        }

        private IDbConnection CreateConnection()
        {
            return new SqlConnection(_connectionString);
        }
        public List<ChangeLocDto> SearchFillLocChange()
        {
            using (var connection = CreateConnection())
            {
                connection.Open();

                var commandDefinition = new CommandDefinition(
                    "Search_ChangeLocitem3",
                    commandType: CommandType.StoredProcedure,
                    commandTimeout: 600
                );

                var materialIssue = connection.Query<ChangeLocDto>(commandDefinition);

                return materialIssue.ToList();
            }
        }
        public async Task<string> UpdateLocItemsLocationAsync(List<int> locItemIds, int newLocationId)
        {
            using (var connection = CreateConnection())
            {
                var parameters = new DynamicParameters();

                // Convert the locItemIds list to a DataTable to pass as TVP
                var locItemIdsTable = new DataTable();
                locItemIdsTable.Columns.Add("Value", typeof(int));
                foreach (var id in locItemIds)
                {
                    locItemIdsTable.Rows.Add(id);
                }

                parameters.Add("@LocItemIds", locItemIdsTable.AsTableValuedParameter("dbo.IntLocItemsList"));
                parameters.Add("@NewLocationId", newLocationId);

                // Execute stored procedure and retrieve the result (status message)
                var result = await connection.QueryFirstOrDefaultAsync<string>(
                    "spUpdateLocItemsLocation",
                    parameters,
                    commandType: CommandType.StoredProcedure
                );

                // Return the result message to the caller
                return result;
            }
        }
        public async Task<string> UpdateBalanceAndAddLocItem(int ItemId, int LocItemID, decimal Qty, int LocationID, decimal CurrentBalance, int EnteredBy)
        {
            using (var connection = CreateConnection())
            {
                var parameters = new DynamicParameters();
                parameters.Add("ItemId", ItemId);
                parameters.Add("LocItemID", LocItemID);
                parameters.Add("Qty", Qty);
                parameters.Add("LocationID", LocationID);
                parameters.Add("CurrentBalance", CurrentBalance);
                parameters.Add("EnteredBy", EnteredBy);

                // اجرای دستور و گرفتن نتیجه
                var result = await connection.QuerySingleAsync<string>("dbo.spUpdateBalanceAndInsertLocItem2", parameters, commandType: CommandType.StoredProcedure);

                // بررسی نتیجه
                if (result == "Success")
                {
                    return result; // عملیات موفقیت‌آمیز
                }
                else
                {
                    //MessageBox.Show(result); // نمایش پیغام خطا
                    return result; // عملیات ناموفق
                }
            }
        }

        public async Task UpdateNisQtyAsync(int locItemId, decimal nisQty, decimal balance)
        {
            using (var connection = CreateConnection())
            {
                var parameters = new DynamicParameters();
                parameters.Add("@LocItemID", locItemId);
                parameters.Add("@NisQty", nisQty);
                parameters.Add("@Balance", balance);

                try
                {
                    // اجرای Stored Procedure
                    await connection.ExecuteAsync("spUpdateNISQty", parameters, commandType: CommandType.StoredProcedure);
                }
                catch (SqlException ex)
                {
                    // مدیریت خطای ناشی از RAISERROR در SQL Server
                    if (ex.Number == 50000) // خطایی که از RAISERROR در SQL Server می‌آید
                    {
                        throw new ApplicationException(ex.Message); // ارسال پیام خطا به لایه بالاتر
                    }
                    else
                    {
                        throw; // ارسال سایر خطاها به لایه بالاتر
                    }
                }
            }
        }
        public async Task UpdateExpireDateAsync(List<int> itemIds, DateTime expireDate)
        {
            using (var connection = CreateConnection())
            {
                var parameters = new DynamicParameters();

                // تبدیل لیست itemIds به DataTable برای ارسال به عنوان TVP
                var itemIdsTable = new DataTable();
                itemIdsTable.Columns.Add("Value", typeof(int));
                foreach (var id in itemIds)
                {
                    itemIdsTable.Rows.Add(id);
                }

                // اضافه کردن پارامترها
                parameters.Add("@ItemIds", itemIdsTable.AsTableValuedParameter("dbo.IntItemIdList"));
                parameters.Add("@ExpireDate", expireDate);

                try
                {
                    // اجرای Stored Procedure
                    await connection.ExecuteAsync("spUpdateExpireDate", parameters, commandType: CommandType.StoredProcedure);
                }
                catch (SqlException ex)
                {
                    if (ex.Number == 50000)
                    {
                        throw new ApplicationException(ex.Message);
                    }
                    else
                    {
                        throw;
                    }
                }
            }
        }
        public async Task<IEnumerable<MivListDto>> GetRequestsByLocItemIdAsync(int locItemId)
        {
            using (var connection = CreateConnection())
            {
                var parameters = new DynamicParameters();
                parameters.Add("@LocItemId", locItemId);

                var result = await connection.QueryAsync<MivListDto>("spGetRequestsByLocItemId", parameters, commandType: CommandType.StoredProcedure);
                return result.ToList();
            }

        }

    }
}
