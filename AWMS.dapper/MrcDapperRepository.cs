using AWMS.dapper.Repositories;
using AWMS.dto;
using Dapper;
using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Configuration;
using System.Data;

namespace AWMS.dapper
{
    public class MrcDapperRepository : IMrcDapperRepository
    {
        private readonly string _connectionString;

        public MrcDapperRepository(IConfiguration configuration)
        {
            _connectionString = configuration.GetConnectionString("DefaultConnection")!;
        }
        private IDbConnection CreateConnection()
        {
            return new SqlConnection(_connectionString);
        }



        private DataTable ConvertToDataTable2025(IEnumerable<ImportMrcDto> Mrcitems, string MrcName, string MrcDescription, int ToCompany, int userid)
        {
            if (Mrcitems == null)
            {
                throw new ArgumentNullException(nameof(Mrcitems), "The input Mrcitems cannot be null.");
            }

            var table = new DataTable();
            table.Columns.Add("ToCompanyID", typeof(int));
            table.Columns.Add("MrcName", typeof(string));
            table.Columns.Add("MrcDescription", typeof(string));
            table.Columns.Add("PK", typeof(int));
            table.Columns.Add("ItemOfPk", typeof(int));
            table.Columns.Add("Tag", typeof(string));
            table.Columns.Add("Description", typeof(string));
            table.Columns.Add("UnitID", typeof(string));
            table.Columns.Add("Qty", typeof(decimal));
            table.Columns.Add("Size1", typeof(string));
            table.Columns.Add("Size2", typeof(string));
            table.Columns.Add("BatchNo", typeof(string));
            table.Columns.Add("DocNo", typeof(string));
            table.Columns.Add("Remark", typeof(string));
            table.Columns.Add("EnteredBy", typeof(int));
            table.Columns.Add("EnteredDate", typeof(DateTime));

            foreach (var item in Mrcitems)
            {
                table.Rows.Add(
                    ToCompany,
                    MrcName,
                    MrcDescription,
                    item.PK ?? 0,
                    item.ItemOfPk ?? 0,
                    item.Tag ?? string.Empty,
                    item.Description ?? string.Empty,
                    item.UnitID ?? string.Empty,
                    item.Qty ?? 0,
                    item.Size1 ?? string.Empty,
                    item.Size2 ?? string.Empty,
                    item.BatchNo ?? string.Empty,
                    item.DocNo ?? string.Empty,
                    item.Remark ?? string.Empty,
                    userid,
                    DateTime.Now
                );
            }

            return table;
        }

        private void SendDataToStoredProcedure2025(DataTable items)
        {
            if (items == null || items.Rows.Count == 0)
            {
                throw new ArgumentException("The DataTable cannot be null or empty.", nameof(items));
            }

            using (var connection = new SqlConnection(_connectionString))
            {
                connection.Open();

                using (var command = new SqlCommand("AddMrcsFromTempTableWithoutTrigger", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;

                    // تنظیم CommandTimeout به 300 ثانیه
                    command.CommandTimeout = 300;

                    // پارامتر جدول
                    var itemParam = command.Parameters.AddWithValue("@Items", items);
                    itemParam.SqlDbType = SqlDbType.Structured;
                    itemParam.TypeName = "dbo.MrcImportTableType";

                    // اجرای Stored Procedure
                    command.ExecuteNonQuery();
                }
            }
        }

        public void AddMrcs(IEnumerable<ImportMrcDto> Mrcitems, string MrcName, string MrcDescription, int ToCompany, int userid)
        {
            var dataTable = ConvertToDataTable2025(Mrcitems, MrcName, MrcDescription, ToCompany, userid);
            SendDataToStoredProcedure2025(dataTable);
        }

        public async Task<IEnumerable<AllMRCDto>> GetAllMRCAsync()
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                await connection.OpenAsync();
                var result = await connection.QueryAsync<AllMRCDto>(
                    "AllMRCAsync",
                    commandType: CommandType.StoredProcedure);
                return result;
            }
        }
        // Method to fetch unique MrcNames
        public async Task<IEnumerable<string>> GetUniqueMrcNamesAsync()
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                // Open the connection
                await connection.OpenAsync();

                // Execute the stored procedure
                var result = await connection.QueryAsync<string>(
                    "AllMRCnameAsync", // Stored procedure name
                    commandType: CommandType.StoredProcedure
                );

                return result;
            }
        }

        public async Task DeleteMrcByIdAsync(int mrcId)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                await connection.OpenAsync();

                await connection.ExecuteAsync(
                    "DeleteMrcById", // Stored Procedure Name
                    new { MrcId = mrcId }, // Parameters
                    commandType: CommandType.StoredProcedure
                );
            }
        }

        public async Task DeleteMrcsByMrcNameAsync(string mrcName)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                await connection.OpenAsync();

                // Call the stored procedure to delete rows with the same MrcName
                await connection.ExecuteAsync("dbo.DeleteMrcsByMrcName", new { MrcName = mrcName }, commandType: CommandType.StoredProcedure);
            }
        }

        public async Task UpdateMrcFieldAsync(object parameters)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                await connection.OpenAsync();

                // Execute the stored procedure with the provided parameters
                await connection.ExecuteAsync("UpdateMrcField", parameters, commandType: CommandType.StoredProcedure);
            }
        }

        public async Task<IEnumerable<AllMRCDto>> GetMRCDetailDetailsAsync(string mrcName)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                await connection.OpenAsync();
                var result = await connection.QueryAsync<AllMRCDto>(
                    "GetMRCDetailDetails",
                    new { MrcName = mrcName },
                    commandType: CommandType.StoredProcedure);
                return result;
            }
        }
        public async Task<string?> GetMRCReqCompanyAsync(string mrcName)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                await connection.OpenAsync();
                var result = await connection.QueryFirstOrDefaultAsync<string>(
                    "GetMRCReqCompany",
                    new { MrcName = mrcName },
                    commandType: CommandType.StoredProcedure);

                return result;
            }
        }

    }
}
