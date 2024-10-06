using AWMS.dapper.Repositories;
using AWMS.dto;
using AWMS.dto.AWMS.datalayer.Entities;
using Dapper;
using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Configuration;
using System.Data;


public class RequestDapperRepository : IRequestDapperRepository
{
    private readonly string _connectionString;

    public RequestDapperRepository(IConfiguration configuration)
    {
        _connectionString = configuration.GetConnectionString("DefaultConnection")!;
    }

    private IDbConnection CreateConnection()
    {
        return new SqlConnection(_connectionString);
    }

    public async Task<string> NextMivNumber()
    {
        using (var connection = CreateConnection())
        {
            var latestRequestNo = await connection.ExecuteScalarAsync<int?>(
                "GetLatestRequestNoByTypeId",
                commandType: CommandType.StoredProcedure);

            int nextRequestNo = (latestRequestNo ?? 0);

            return nextRequestNo.ToString("D6");
        }
    }

    public async Task<int> GetTotalRecordCount()
    {
        using (var connection = CreateConnection())
        {
            return await connection.ExecuteScalarAsync<int>(
                "GetTotalIssueRecordCount",
                commandType: CommandType.StoredProcedure);
        }
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
    public async Task<List<MaterialIssueVoucherDto>> MaterialIssueVoucherFillGrid(int pageNumber, int pageSize)
    {
        using (var connection = CreateConnection())
        {
            connection.Open();

            var commandDefinition = new CommandDefinition(
                "Search_Material_Issue_Voucher6",
                parameters: new { PageNumber = pageNumber, PageSize = pageSize },
                commandType: CommandType.StoredProcedure,
                commandTimeout: 600
            );

            var materialIssue = await connection.QueryAsync<MaterialIssueVoucherDto>(commandDefinition);

            return materialIssue.ToList();
        }
    }
    public async Task<List<MaterialIssueVoucherDto>> MaterialIssueVoucherFillGrid2(int pageNumber, int pageSize)
    {
        var materialIssueList = new List<MaterialIssueVoucherDto>();

        using (var connection = CreateConnection())
        {
            using (var command = new SqlCommand("Search_Material_Issue_Voucher5", (SqlConnection)connection))
            {
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@PageNumber", pageNumber);
                command.Parameters.AddWithValue("@PageSize", pageSize);
                command.CommandTimeout = 600;

                connection.Open();

                using (var reader = await command.ExecuteReaderAsync())
                {
                    while (await reader.ReadAsync())
                    {
                        var materialIssue = new MaterialIssueVoucherDto
                        {
                            ArrivalDate = reader["ArrivalDate"] as DateTime?,
                            Project = reader["Project"] as string,
                            Po = reader["Po"] as string,
                            VendorId = reader.GetInt32(reader.GetOrdinal("VendorId")),
                            ItemId = reader.GetInt32(reader.GetOrdinal("ItemId")),
                            PLName = reader["PLName"] as string,
                            PK = reader.GetInt32(reader.GetOrdinal("PK")),
                            ItemOfPk = reader["ItemOfPk"] as string,
                            Tag = reader["Tag"] as string,
                            Description = reader["Description"] as string,
                            Unit = reader["Unit"] as string,
                            QtyPL = reader.GetDecimal(reader.GetOrdinal("QtyPL")),
                            QtyInLoc = reader.GetDecimal(reader.GetOrdinal("QtyInLoc")),
                            Balance = reader.GetDecimal(reader.GetOrdinal("Balance")),
                            Inventory = reader.GetDecimal(reader.GetOrdinal("Inventory")),
                            Discipline = reader["Discipline"] as string,
                            Scope = reader["Scope"] as string,
                            HeatNo = reader["HeatNo"] as string,
                            BatchNo = reader["BatchNo"] as string,
                            Remark = reader["Remark"] as string,
                            Hold = reader.GetBoolean(reader.GetOrdinal("Hold"))
                        };

                        materialIssueList.Add(materialIssue);
                    }
                }
            }
        }

        return materialIssueList;
    }
    public async Task<DataTable> GetLocItemOFSelectedItemID_FOR_ISSUE_VOUCHER(List<int> itemIds)
    {
        using (var connection = CreateConnection())
        {
            var parameters = new DynamicParameters();
            parameters.Add("@ItemIds", string.Join(",", itemIds));

            var locItems = await connection.QueryAsync<LocItemBalanceDto>(
                "GetLocItemOFSelectedItemID_FOR_ISSUE_VOUCHER2",
                parameters,
                commandType: CommandType.StoredProcedure
            );

            DataTable dataTable = new DataTable();
            dataTable.Columns.Add("ItemId", typeof(int));
            dataTable.Columns.Add("LocItemID", typeof(int));
            dataTable.Columns.Add("Tag", typeof(string));
            dataTable.Columns.Add("Description", typeof(string));
            dataTable.Columns.Add("Balance", typeof(decimal));
            dataTable.Columns.Add("PL", typeof(string));
            dataTable.Columns.Add("Po", typeof(string));
            dataTable.Columns.Add("PK", typeof(string));
            dataTable.Columns.Add("Discipline", typeof(string));
            dataTable.Columns.Add("BatchNo", typeof(string));
            dataTable.Columns.Add("HeatNo", typeof(string));
            dataTable.Columns.Add("Location", typeof(string));
            dataTable.Columns.Add("QtyinLoc", typeof(decimal));
            dataTable.Columns.Add("Unit", typeof(string));
            dataTable.Columns.Add("Scope", typeof(string));
            dataTable.Columns.Add("Project", typeof(string));
            dataTable.Columns.Add("Remark", typeof(string));
            dataTable.Columns.Add("QtyIssue", typeof(decimal));

            foreach (var item in locItems)
            {
                DataRow row = dataTable.NewRow();
                row["ItemId"] = item.ItemId;
                row["LocItemID"] = item.LocItemID;
                row["Tag"] = item.Tag;
                row["Description"] = item.Description;
                row["Balance"] = item.Balance;
                row["PL"] = item.PL;
                row["Po"] = item.Po;
                row["PK"] = item.PK;
                row["Discipline"] = item.Discipline;
                row["BatchNo"] = item.BatchNo;
                row["HeatNo"] = item.HeatNo;
                row["Location"] = item.Location;
                row["QtyinLoc"] = item.QtyinLoc;
                row["Unit"] = item.Units;
                row["Scope"] = item.Scope;
                row["Project"] = item.Project;
                row["Remark"] = item.Remark;
                row["QtyIssue"] = 0;

                dataTable.Rows.Add(row);
            }

            return dataTable;
        }
    }

    public async Task AddRequests(List<RequestDto> requestMivs)
    {
        using (var connection = CreateConnection())
        {
            var dataTable = new DataTable();
            dataTable.Columns.Add("CompanyID", typeof(int));
            dataTable.Columns.Add("ContractId", typeof(int));
            dataTable.Columns.Add("MRCNO", typeof(string));
            dataTable.Columns.Add("AreaUnitID", typeof(int));
            dataTable.Columns.Add("ReqMivQty", typeof(decimal));
            dataTable.Columns.Add("ReserveMivQty", typeof(decimal));
            dataTable.Columns.Add("LocItemID", typeof(int));
            dataTable.Columns.Add("RequestNO", typeof(string));

            foreach (var requestMiv in requestMivs)
            {
                string formattedRequestNo = requestMiv.RequestNO.PadLeft(6, '0');

                dataTable.Rows.Add(
                    requestMiv.CompanyID,
                    requestMiv.ContractId,
                    requestMiv.MRCNO,
                    requestMiv.AreaUnitID,
                    requestMiv.ReqMivQty,
                    requestMiv.ReserveMivQty,
                    requestMiv.LocItemID,
                    formattedRequestNo
                );
            }

            var parameters = new DynamicParameters();
            parameters.Add("@RequestMivs", dataTable.AsTableValuedParameter("RequestMivTableType"));

            await connection.ExecuteAsync(
                "InsertRequestMivsBatch",
                parameters,
                commandType: CommandType.StoredProcedure);
        }
    }
    public async Task InsertRequestBatchAsync(List<RequestDto> requestMivs)
    {
        using (var connection = CreateConnection())
        {
            // ایجاد یک DataTable برای پارامتر TVP
            var dataTable = new DataTable();
            dataTable.Columns.Add("CompanyID", typeof(int));
            dataTable.Columns.Add("ContractId", typeof(int));
            dataTable.Columns.Add("MRCNO", typeof(string));
            dataTable.Columns.Add("AreaUnitID", typeof(int));
            dataTable.Columns.Add("ReqMivQty", typeof(decimal));
            dataTable.Columns.Add("ReserveMivQty", typeof(decimal));
            dataTable.Columns.Add("LocItemID", typeof(int));
            dataTable.Columns.Add("RequestNO", typeof(string));

            foreach (var requestMiv in requestMivs)
            {
                string formattedRequestNo = requestMiv.RequestNO.PadLeft(6, '0');

                dataTable.Rows.Add(
                    requestMiv.CompanyID,
                    requestMiv.ContractId,
                    requestMiv.MRCNO,
                    requestMiv.AreaUnitID,
                    requestMiv.ReqMivQty,
                    requestMiv.ReserveMivQty,
                    requestMiv.LocItemID,
                    formattedRequestNo
                );
            }

            // اضافه کردن DataTable به پارامترهای Dynamic
            var parameters = new DynamicParameters();
            parameters.Add("@CompanyID", requestMivs.FirstOrDefault()?.CompanyID ?? 0); // Assuming you have a way to get these values
            parameters.Add("@ContractId", requestMivs.FirstOrDefault()?.ContractId ?? 0); // Assuming you have a way to get these values
            parameters.Add("@MRCNO", requestMivs.FirstOrDefault()?.MRCNO ?? string.Empty); // Assuming you have a way to get these values
            parameters.Add("@AreaUnitID", requestMivs.FirstOrDefault()?.AreaUnitID ?? 0); // Assuming you have a way to get these values
            parameters.Add("@RequestMivs", dataTable.AsTableValuedParameter("RequestDtoType"));

            // اجرای stored procedure برای وارد کردن دسته‌ای داده‌ها
            await connection.ExecuteAsync(
                "InsertRequestBatch",
                parameters,
                commandType: CommandType.StoredProcedure);
        }
    }
    public async Task<List<string>> InsertRequestBatchWithReturnMivNumberAsync(List<RequestDto> requestMivs, int issuedBy)
    {
        using (var connection = CreateConnection())
        {
            // Create DataTable for TVP parameter
            var dataTable = new DataTable();
            dataTable.Columns.Add("ReqMivQty", typeof(decimal));
            dataTable.Columns.Add("ReserveMivQty", typeof(decimal));
            dataTable.Columns.Add("LocItemID", typeof(int));

            foreach (var requestMiv in requestMivs)
            {
                dataTable.Rows.Add(
                    requestMiv.ReqMivQty,
                    requestMiv.ReserveMivQty,
                    requestMiv.LocItemID
                );
            }

            // Add DataTable to parameters
            var parameters = new DynamicParameters();
            parameters.Add("@CompanyID", requestMivs.FirstOrDefault()?.CompanyID ?? 0);
            parameters.Add("@ContractId", requestMivs.FirstOrDefault()?.ContractId ?? 0);
            parameters.Add("@MRCNO", requestMivs.FirstOrDefault()?.MRCNO ?? string.Empty);
            parameters.Add("@AreaUnitID", requestMivs.FirstOrDefault()?.AreaUnitID ?? 0);
            parameters.Add("@IssuedBy", issuedBy);  // اضافه کردن IssuedBy
            parameters.Add("@RequestMivs", dataTable.AsTableValuedParameter("NewRequestDtoType"));

            // Execute stored procedure and get new MIV numbers
            var newMIVNumbers = await connection.QueryAsync<string>(
                "InsertRequestBatch",
                parameters,
                commandType: CommandType.StoredProcedure
            );

            return newMIVNumbers.ToList();
        }
    }

    public async Task<DataTable> GetDataFromDatabaseAsync(string mivNumber)
    {
        DataTable dataTable = new DataTable();

        using (var connection = CreateConnection())
        {
            string storedProcedure = "[dbo].[GetMivDataByRequestNO]";

            using (SqlCommand command = new SqlCommand(storedProcedure, (SqlConnection)connection))
            {
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@MivNumber", mivNumber);

                SqlDataAdapter adapter = new SqlDataAdapter(command);

                await Task.Run(() => adapter.Fill(dataTable));
            }
        }

        return dataTable;
    }
    public async Task<DataTable> GetDataFromDatabaseREARAsync(string mivNumber)
    {
        DataTable dataTable = new DataTable();

        using (var connection = CreateConnection())
        {
            string storedProcedure = "[dbo].[GetMivDataByRequestNO_REAR]";

            using (SqlCommand command = new SqlCommand(storedProcedure, (SqlConnection)connection))
            {
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@MivNumber", mivNumber);

                SqlDataAdapter adapter = new SqlDataAdapter(command);

                await Task.Run(() => adapter.Fill(dataTable));
            }
        }

        return dataTable;
    }

    public async Task<bool> CheckMrcDuplicate(int companyid, string mrc)
    {
        using (var connection = CreateConnection())
        {
            var parameters = new DynamicParameters();
            parameters.Add("@CompanyID", companyid);
            parameters.Add("@MRCNO", mrc);
            parameters.Add("@IsDuplicate", dbType: DbType.Boolean, direction: ParameterDirection.Output);

            await connection.ExecuteAsync(
                "CheckMrcDuplicate",
                parameters,
                commandType: CommandType.StoredProcedure
            );

            return parameters.Get<bool>("@IsDuplicate");
        }
    }

}
