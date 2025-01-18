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

    public IEnumerable<SearchLocItemDto> SearchLocItemFillGridWithDataReaderyieldreturn()
    {
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
                        yield return new SearchLocItemDto
                        {
                            ArrivalDate = reader.IsDBNull(reader.GetOrdinal("ArrivalDate")) ? (DateTime?)null : reader.GetDateTime(reader.GetOrdinal("ArrivalDate")),
                            EnteredDate = reader.IsDBNull(reader.GetOrdinal("EnteredDate")) ? (DateTime?)null : reader.GetDateTime(reader.GetOrdinal("EnteredDate")),
                            MARDate = reader.IsDBNull(reader.GetOrdinal("MARDate")) ? (DateTime?)null : reader.GetDateTime(reader.GetOrdinal("MARDate")),
                            Project = Convert.ToString(reader["Project"]),
                            PoName = Convert.ToString(reader["PoName"]),
                            Vendor = Convert.ToString(reader["Vendor"]),
                            Mr = Convert.ToString(reader["Mr"]),
                            MSRNO = Convert.ToString(reader["MSRNO"]),
                            OPINO = Convert.ToString(reader["OPINO"]),
                            IRN = Convert.ToString(reader["IRN"]),
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
                    }
                }
            }
        }
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

    public async Task<List<SearchItemDto>> SearchItemFillGridAsync()
    {
        try
        {
            using var connection = new SqlConnection(_connectionString);
            await connection.OpenAsync(); // Open the connection asynchronously

            var result = await connection.QueryAsync<SearchItemDto>(
                "[dbo].[Search_Item2]",
                commandType: CommandType.StoredProcedure,
                commandTimeout: 300 // 300 seconds
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


        public async Task<List<SearchItemDto>> SearchItemFillGridDataReaderAsync()
        {
            var results = new List<SearchItemDto>();

            try
            {
                using var connection = new SqlConnection(_connectionString);
                using var command = new SqlCommand("[dbo].[Search_Item2]", connection)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 300
                };

                await connection.OpenAsync();

                using var reader = await command.ExecuteReaderAsync();

                while (await reader.ReadAsync())
                {
                    var item = new SearchItemDto
                    {
                        ItemId = reader["ItemId"] as int? ?? 0,
                        Tag = reader["Tag"] as string ?? "",
                        Description = reader["Description"] as string ?? "",
                        QtyPL = reader["QtyPL"] as decimal? ?? 0,
                        QtyInLoc = reader["QtyInLoc"] as decimal? ?? 0,
                        Balance = reader["Balance"] as decimal? ?? 0,
                        Inventory = reader["Inventory"] as decimal? ?? 0,
                        ReqMivQty = reader["ReqMivQty"] as decimal? ?? 0,
                        DelMivQty = reader["DelMivQty"] as decimal? ?? 0,
                        ReserveMivQty = reader["ReserveMivQty"] as decimal? ?? 0,
                        TotalReturnAcceptQty = reader["TotalReturnAcceptQty"] as decimal? ?? 0,
                        NISQty = reader["NISQty"] as decimal? ?? 0,
                        RejectQty = reader["RejectQty"] as decimal? ?? 0,
                        HeatNo = reader["HeatNo"] as string,
                        BatchNo = reader["BatchNo"] as string,
                        Remark = reader["Remark"] as string,
                        Hold = reader["Hold"] as bool? ?? false,
                        ArrivalDate = reader["ArrivalDate"] as DateTime?,
                        ArchiveNO = reader["ArchiveNO"] as string,
                        Project = reader["Project"] as string,
                        PoName = reader["PoName"] as string,
                        Vendor = reader["Vendor"] as string,
                        Discipline = reader["Discipline"] as string,
                        Scope = reader["Scope"] as string,
                        PLName = reader["PLName"] as string,
                        UnitName = reader["UnitName"] as string,
                        Supplier = reader["Supplier"] as string
                    };

                    results.Add(item);
                }
            }
            catch (SqlException ex) when (ex.Number == -2)
            {
                throw new Exception("The operation timed out. Please try again later.");
            }
            catch (Exception ex)
            {
                throw new Exception($"An error occurred while fetching data: {ex.Message}");
            }

            return results;
        }


    public async Task<IEnumerable<SearchItemDto>> SearchItemFillGridIEnumerableAsync()
    {
        try
        {
            using var connection = new SqlConnection(_connectionString);
            await connection.OpenAsync();

            return await connection.QueryAsync<SearchItemDto>(
                "[dbo].[Search_Item2]",
                commandType: CommandType.StoredProcedure,
                commandTimeout: 300
            );
        }
        catch (Exception ex)
        {
            throw new Exception($"An error occurred while fetching data: {ex.Message}");
        }
    }



}
