using AWMS.dapper.Repositories;
using AWMS.dto;
using Dapper;
using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Configuration;
using System.Data;


public class SearchDapperRepository : ISearchDapperRepository
{
    private readonly string _connectionString;

    public SearchDapperRepository(IConfiguration configuration)
    {
        _connectionString = configuration.GetConnectionString("DefaultConnection")!;
    }

    private IDbConnection CreateConnection()
    {
        return new SqlConnection(_connectionString);
    }

    public async Task<int> GetTotalItemRecordCount()
    {
        using (var connection = CreateConnection())
        {
            return await connection.ExecuteScalarAsync<int>(
                "GetTotalItemsRecordCount",
                commandType: CommandType.StoredProcedure);
        }
    }

    public async Task<List<SearchItemDto>> SearchItemFillGrid(int pageNumber, int pageSize)
    {
        using (var connection = CreateConnection())
        {
            connection.Open();

            var commandDefinition = new CommandDefinition(
                "Search_Item",
                parameters: new { PageNumber = pageNumber, PageSize = pageSize },
                commandType: CommandType.StoredProcedure,
                commandTimeout: 600
            );

            var materialIssue = await connection.QueryAsync<SearchItemDto>(commandDefinition);

            return materialIssue.ToList();
        }
    }
    public async Task<List<SearchItemDto>> SearchItemFillGrid2()
    {
        using (var connection = CreateConnection())
        {
            connection.Open();

            var commandDefinition = new CommandDefinition(
                "Search_Item2",
                commandType: CommandType.StoredProcedure,
                commandTimeout: 600
            );

            var materialIssue = await connection.QueryAsync<SearchItemDto>(commandDefinition);

            return materialIssue.ToList();
        }
    }
    public List<SearchItemDto> SearchItemFillGrid3()
    {
        using (var connection = CreateConnection())
        {
            connection.Open();

            var commandDefinition = new CommandDefinition(
                "Search_Item2",
                commandType: CommandType.StoredProcedure,
                commandTimeout: 600
            );

            var materialIssue = connection.Query<SearchItemDto>(commandDefinition);

            return materialIssue.ToList();
        }
    }

    public List<SearchItemDto> SearchItemFillGridWithDataReader()
    {
        var results = new List<SearchItemDto>();

        using (var connection = CreateConnection())
        {
            connection.Open();

            using (var command = new SqlCommand("Search_Item2", (SqlConnection)connection))
            {
                command.CommandType = CommandType.StoredProcedure;
                command.CommandTimeout = 600;

                using (var reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        var item = new SearchItemDto
                        {
                            ArrivalDate = reader.IsDBNull(reader.GetOrdinal("ArrivalDate")) ? (DateTime?)null : reader.GetDateTime(reader.GetOrdinal("ArrivalDate")),
                            Project = Convert.ToString(reader["Project"]),
                            PoName = Convert.ToString(reader["PoName"]),
                            Vendor = Convert.ToString(reader["Vendor"]),
                            ItemId = reader.IsDBNull(reader.GetOrdinal("ItemId")) ? 0 : reader.GetInt32(reader.GetOrdinal("ItemId")),
                            PLName = Convert.ToString(reader["PLName"]),
                            PK = reader.IsDBNull(reader.GetOrdinal("PK")) ? 0 : reader.GetInt32(reader.GetOrdinal("PK")),
                            ItemOfPk = Convert.ToString(reader["ItemOfPk"]),
                            Tag = Convert.ToString(reader["Tag"]),
                            Description = Convert.ToString(reader["Description"]),
                            UnitName = Convert.ToString(reader["UnitName"]),
                            QtyPL = reader.IsDBNull(reader.GetOrdinal("QtyPL")) ? 0 : reader.GetDecimal(reader.GetOrdinal("QtyPL")),
                            QtyInLoc = reader.IsDBNull(reader.GetOrdinal("QtyInLoc")) ? 0 : reader.GetDecimal(reader.GetOrdinal("QtyInLoc")),
                            Balance = reader.IsDBNull(reader.GetOrdinal("Balance")) ? 0 : reader.GetDecimal(reader.GetOrdinal("Balance")),
                            Inventory = reader.IsDBNull(reader.GetOrdinal("Inventory")) ? 0 : reader.GetDecimal(reader.GetOrdinal("Inventory")),
                            TotalReturnAcceptQty = reader.IsDBNull(reader.GetOrdinal("TotalReturnAcceptQty")) ? 0 : reader.GetDecimal(reader.GetOrdinal("TotalReturnAcceptQty")),
                            ReqMivQty = reader.IsDBNull(reader.GetOrdinal("ReqMivQty")) ? 0 : reader.GetDecimal(reader.GetOrdinal("ReqMivQty")),
                            DelMivQty = reader.IsDBNull(reader.GetOrdinal("DelMivQty")) ? 0 : reader.GetDecimal(reader.GetOrdinal("DelMivQty")),
                            ReserveMivQty = reader.IsDBNull(reader.GetOrdinal("ReserveMivQty")) ? 0 : reader.GetDecimal(reader.GetOrdinal("ReserveMivQty")),
                            NISQty = reader.IsDBNull(reader.GetOrdinal("NISQty")) ? 0 : reader.GetDecimal(reader.GetOrdinal("NISQty")),
                            RejectQty = reader.IsDBNull(reader.GetOrdinal("RejectQty")) ? 0 : reader.GetDecimal(reader.GetOrdinal("RejectQty")),
                            Discipline = Convert.ToString(reader["Discipline"]),
                            Scope = Convert.ToString(reader["Scope"]),
                            HeatNo = Convert.ToString(reader["HeatNo"]),
                            Supplier = Convert.ToString(reader["Supplier"]),
                            BatchNo = Convert.ToString(reader["BatchNo"]),
                            Remark = Convert.ToString(reader["Remark"]),
                            ArchiveNO = Convert.ToString(reader["ArchiveNO"]),
                            Hold = reader.IsDBNull(reader.GetOrdinal("Hold")) ? false : reader.GetBoolean(reader.GetOrdinal("Hold"))
                        };
                        results.Add(item);
                    }
                }
            }
        }

        return results;
    }
    public List<SearchLocItemDto> SearchLocItemFillGridWithDataReader()
    {
        var results = new List<SearchLocItemDto>();

        using (var connection = CreateConnection())
        {
            connection.Open();

            using (var command = new SqlCommand("Search_LocItem", (SqlConnection)connection))
            {
                command.CommandType = CommandType.StoredProcedure;
                command.CommandTimeout = 600;

                using (var reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        var item = new SearchLocItemDto
                        {
                            ArrivalDate = reader.IsDBNull(reader.GetOrdinal("ArrivalDate")) ? (DateTime?)null : reader.GetDateTime(reader.GetOrdinal("ArrivalDate")),
                            Project = Convert.ToString(reader["Project"]),
                            PoName = Convert.ToString(reader["PoName"]),
                            Vendor = Convert.ToString(reader["Vendor"]),
                            ItemId = reader.IsDBNull(reader.GetOrdinal("ItemId")) ? 0 : reader.GetInt32(reader.GetOrdinal("ItemId")),
                            LocItemID = reader.IsDBNull(reader.GetOrdinal("LocItemID")) ? 0 : reader.GetInt32(reader.GetOrdinal("LocItemID")),
                            PLName = Convert.ToString(reader["PLName"]),
                            LocationName = Convert.ToString(reader["LocationName"]),
                            PK = reader.IsDBNull(reader.GetOrdinal("PK")) ? 0 : reader.GetInt32(reader.GetOrdinal("PK")),
                            ItemOfPk = Convert.ToString(reader["ItemOfPk"]),
                            Tag = Convert.ToString(reader["Tag"]),
                            Description = Convert.ToString(reader["Description"]),
                            UnitName = Convert.ToString(reader["UnitName"]),
                            QtyPL = reader.IsDBNull(reader.GetOrdinal("QtyPL")) ? 0 : reader.GetDecimal(reader.GetOrdinal("QtyPL")),
                            QtyInLoc = reader.IsDBNull(reader.GetOrdinal("QtyInLoc")) ? 0 : reader.GetDecimal(reader.GetOrdinal("QtyInLoc")),
                            Balance = reader.IsDBNull(reader.GetOrdinal("Balance")) ? 0 : reader.GetDecimal(reader.GetOrdinal("Balance")),
                            Inventory = reader.IsDBNull(reader.GetOrdinal("Inventory")) ? 0 : reader.GetDecimal(reader.GetOrdinal("Inventory")),
                            TotalReturnAcceptQty = reader.IsDBNull(reader.GetOrdinal("TotalReturnAcceptQty")) ? 0 : reader.GetDecimal(reader.GetOrdinal("TotalReturnAcceptQty")),
                            ReqMivQty = reader.IsDBNull(reader.GetOrdinal("ReqMivQty")) ? 0 : reader.GetDecimal(reader.GetOrdinal("ReqMivQty")),
                            DelMivQty = reader.IsDBNull(reader.GetOrdinal("DelMivQty")) ? 0 : reader.GetDecimal(reader.GetOrdinal("DelMivQty")),
                            ReserveMivQty = reader.IsDBNull(reader.GetOrdinal("ReserveMivQty")) ? 0 : reader.GetDecimal(reader.GetOrdinal("ReserveMivQty")),
                            NISQty = reader.IsDBNull(reader.GetOrdinal("NISQty")) ? 0 : reader.GetDecimal(reader.GetOrdinal("NISQty")),
                            RejectQty = reader.IsDBNull(reader.GetOrdinal("RejectQty")) ? 0 : reader.GetDecimal(reader.GetOrdinal("RejectQty")),
                            Discipline = Convert.ToString(reader["Discipline"]),
                            Scope = Convert.ToString(reader["Scope"]),
                            HeatNo = Convert.ToString(reader["HeatNo"]),
                            Supplier = Convert.ToString(reader["Supplier"]),
                            BatchNo = Convert.ToString(reader["BatchNo"]),
                            Remark = Convert.ToString(reader["Remark"]),
                            ArchiveNO = Convert.ToString(reader["ArchiveNO"]),
                            Hold = reader.IsDBNull(reader.GetOrdinal("Hold")) ? false : reader.GetBoolean(reader.GetOrdinal("Hold"))
                        };
                        results.Add(item);
                    }
                }
            }
        }

        return results;
    }

    public DataTable SearchMivFillGrid()
    {
        using (var connection = new SqlConnection(_connectionString))
        {
            var dt = new DataTable();

            connection.Open();
            using (var command = new SqlCommand("[dbo].[Search_Miv]", connection))
            {
                command.CommandType = CommandType.StoredProcedure;
                //command.CommandTimeout = 600;

                using (var reader = command.ExecuteReader())
                {
                    dt.Load(reader);
                }
            }

            return dt;
        }
    }
    public List<SearchMivDto> SearchMivFillGrid2()
    {
        using (var connection = CreateConnection())
        {
            connection.Open();

            var commandDefinition = new CommandDefinition(
                "Search_Miv",
                commandType: CommandType.StoredProcedure,
                commandTimeout: 600
            );

            var materialIssue = connection.Query<SearchMivDto>(commandDefinition);

            return materialIssue.ToList();
        }
    }

}
