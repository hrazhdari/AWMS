using AWMS.dapper.Repositories;
using Dapper;
using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Configuration;
using System.Data;

namespace AWMS.dapper
{

    public class ApproveDapperRepository : IApproveDapperRepository
    {
        private readonly string _connectionString;

        public ApproveDapperRepository(IConfiguration configuration)
        {
            _connectionString = configuration.GetConnectionString("DefaultConnection")!;
        }

        private IDbConnection CreateConnection()
        {
            return new SqlConnection(_connectionString);
        }

        public async Task<List<string>> GetNotApprovedMivsAsync()
        {
            using (var connection = CreateConnection())
            {
                // اجرای کوئری و بازگرداندن نتیجه به صورت List<string>
                var requestNos = await connection.QueryAsync<string>("ALLmivNOTapproved", commandType: CommandType.StoredProcedure);
                return requestNos.ToList();
            }
        }

        public async Task<DataTable> GetMivByRequestNoAsync(string requestNo)
        {
            using (var connection = CreateConnection())
            {
                var parameters = new { RequestNO = requestNo };
                var result = await connection.QueryAsync(@"APPROVEmiv",
                    parameters,
                    commandType: CommandType.StoredProcedure);

                // ایجاد DataTable
                var dataTable = new DataTable();

                // بررسی اینکه نتیجه‌ای وجود دارد
                if (result != null && result.Any())
                {
                    // ایجاد ستون‌ها بر اساس خصوصیات اولین سطر
                    var firstRow = result.First();
                    foreach (var property in firstRow)
                    {
                        dataTable.Columns.Add(property.Key, property.Value?.GetType() ?? typeof(string));
                    }

                    // اضافه کردن سطرها به DataTable
                    foreach (var row in result)
                    {
                        var dataRow = dataTable.NewRow();
                        foreach (var property in row)
                        {
                            dataRow[property.Key] = property.Value ?? DBNull.Value;
                        }
                        dataTable.Rows.Add(dataRow);
                    }
                }

                return dataTable;
            }
        }
        public class MivUpdateModel
        {
            public string ReqLocItemID { get; set; }
            public decimal DelMivQty { get; set; }
        }

        private DataTable ToDataTable(IEnumerable<MivUpdateModel> data)
        {
            var dataTable = new DataTable();
            dataTable.Columns.Add("ReqLocItemID", typeof(string));
            dataTable.Columns.Add("DelMivQty", typeof(decimal));

            foreach (var item in data)
            {
                var row = dataTable.NewRow();
                row["ReqLocItemID"] = item.ReqLocItemID;
                row["DelMivQty"] = item.DelMivQty;
                dataTable.Rows.Add(row);
            }

            return dataTable;
        }
        public async Task UpdateMivRequestsBulkAsync(List<MivUpdateModel> updateDataList, int userID)
        {
            using (var connection = CreateConnection())
            {
                var dataTable = ToDataTable(updateDataList);
                var parameters = new DynamicParameters();

                // Add table-valued parameter
                parameters.Add("@UpdateData", dataTable.AsTableValuedParameter("dbo.UpdateMivTableType"));

                // Add userID parameter
                parameters.Add("@UserID", userID, DbType.Int32);

                // Execute the stored procedure
                await connection.ExecuteAsync("UpdateMivRequestsBulk2", parameters, commandType: CommandType.StoredProcedure);
            }
        }


    }
}
