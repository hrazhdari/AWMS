using AWMS.dapper.Repositories;
using AWMS.dto;
using Dapper;
using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Configuration;
using System.Data;

namespace AWMS.dapper
{
    public class PackageDapperRepository : IPackageDapperRepository
    {
        private readonly string _connectionString;
        public PackageDapperRepository(IConfiguration configuration)
        {
            _connectionString = configuration.GetConnectionString("DefaultConnection")!;
        }

        private IDbConnection CreateConnection()
        {
            return new SqlConnection(_connectionString);
        }

        public bool AddPackage(PackageDto package)
        {
            if (package == null)
            {
                throw new ArgumentNullException(nameof(package));
            }

            using (var connection = CreateConnection())
            {
                var parameters = new DynamicParameters();
                parameters.Add("@PLId", package.PLId);
                parameters.Add("@PK", package.PK);
                parameters.Add("@NetW", package.NetW);
                parameters.Add("@GrossW", package.GrossW);
                parameters.Add("@Dimension", package.Dimension);
                parameters.Add("@Volume", package.Volume);
                parameters.Add("@ArrivalDate", package.ArrivalDate);
                parameters.Add("@Desciption", package.Desciption);
                parameters.Add("@Remark", package.Remark);
                parameters.Add("@EnteredBy", package.EnteredBy);
                parameters.Add("@EnteredDate", package.EnteredDate);
                parameters.Add("@EditedBy", package.EditedBy);
                parameters.Add("@EditedDate", package.EditedDate);
                parameters.Add("@MSRNO", package.MSRNO);
                parameters.Add("@MSRPDF", package.MSRPDF);
                parameters.Add("@MSRDate", package.MSRDate);
                parameters.Add("@MSREnteredBy", package.MSREnteredBy);
                parameters.Add("@MSRStatus", package.MSRStatus);
                parameters.Add("@MSRRev", package.MSRRev);
                parameters.Add("@MSRRevEnteredBy", package.MSRRevEnteredBy);
                parameters.Add("@MSRRevDate", package.MSRRevDate);

                var affectedRows = connection.Execute("AddPackage", parameters, commandType: CommandType.StoredProcedure);
                return affectedRows > 0;
            }
        }

        public bool DeletePackage(int packageId)
        {
            using (var connection = CreateConnection())
            {
                var parameters = new DynamicParameters();
                parameters.Add("@PackageId", packageId);

                var affectedRows = connection.Execute("DeletePackage", parameters, commandType: CommandType.StoredProcedure);
                return affectedRows > 0;
            }
        }

        public IEnumerable<PackageDto> GetAllPackage()
        {
            using (var connection = CreateConnection())
            {
                return connection.Query<PackageDto>("GetAllPackages", commandType: CommandType.StoredProcedure);
            }
        }

        public async Task<IEnumerable<PackageDto>> GetAllPackageAsync()
        {
            using (var connection = CreateConnection())
            {
                return await connection.QueryAsync<PackageDto>("GetAllPackages", commandType: CommandType.StoredProcedure);
            }
        }

        public PackageDto GetPackageById(int packageId)
        {
            using (var connection = CreateConnection())
            {
                var parameters = new DynamicParameters();
                parameters.Add("@PackageId", packageId);

                return connection.QueryFirstOrDefault<PackageDto>("GetPackageById", parameters, commandType: CommandType.StoredProcedure);
            }
        }

        public IEnumerable<PackageDto> GetPackageByPLId(int plId)
        {
            using (var connection = CreateConnection())
            {
                var parameters = new DynamicParameters();
                parameters.Add("@PLId", plId);

                return connection.Query<PackageDto>("GetPackagesByPLId", parameters, commandType: CommandType.StoredProcedure);
            }
        }

        public PackageDto GetPackageByPK(int pk)
        {
            using (var connection = CreateConnection())
            {
                var parameters = new DynamicParameters();
                parameters.Add("@PK", pk);

                return connection.QueryFirstOrDefault<PackageDto>("GetPackageByPK", parameters, commandType: CommandType.StoredProcedure);
            }
        }

        public bool GetPackageByPackageNameBool(string packageName)
        {
            using (var connection = CreateConnection())
            {
                var parameters = new DynamicParameters();
                parameters.Add("@PackageName", packageName);

                return connection.ExecuteScalar<bool>("CheckPackageByName", parameters, commandType: CommandType.StoredProcedure);
            }
        }

        public int GetLastPackage(int plId)
        {
            using (var connection = CreateConnection())
            {
                var parameters = new DynamicParameters();
                parameters.Add("@PLId", plId);

                return connection.ExecuteScalar<int>("GetLastPackage", parameters, commandType: CommandType.StoredProcedure);
            }
        }

        public int GetLastPKID(int plId)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                string sql = "dbo.GetLastPKID";
                var parameters = new DynamicParameters();
                parameters.Add("@PLId", plId);

                var result = connection.QuerySingleOrDefault<int>(sql, parameters, commandType: CommandType.StoredProcedure);

                if (result == 0)
                {
                    Console.WriteLine($"No PKID found for PLId: {plId}");
                }

                return result;
            }
        }



        public int GetPackageCount(int plId)
        {
            using (var connection = CreateConnection())
            {
                var parameters = new DynamicParameters();
                parameters.Add("@PLId", plId);

                return connection.ExecuteScalar<int>("GetPackageCount", parameters, commandType: CommandType.StoredProcedure);
            }
        }

        public bool CheckPkExist(int plId, int pkNumber)
        {
            using (var connection = CreateConnection())
            {
                var parameters = new DynamicParameters();
                parameters.Add("@PLId", plId);
                parameters.Add("@PK", pkNumber);

                return connection.ExecuteScalar<bool>("CheckPackageExistence", parameters, commandType: CommandType.StoredProcedure);
            }
        }

        public int GetPkId(int plId, int pkNumber)
        {
            using (var connection = CreateConnection())
            {
                var parameters = new DynamicParameters();
                parameters.Add("@PLId", plId);
                parameters.Add("@PK", pkNumber);

                return connection.ExecuteScalar<int>("GetPackageId", parameters, commandType: CommandType.StoredProcedure);
            }
        }

        public int? GetPackageByPKID(int packageId)
        {
            using (var connection = CreateConnection())
            {
                var parameters = new DynamicParameters();
                parameters.Add("@PackageId", packageId);

                return connection.ExecuteScalar<int?>("GetPackagePKByPKID", parameters, commandType: CommandType.StoredProcedure);
            }
        }

        public bool UpdatePackagePulse(int packageId, UpdatePkDto updatedPackage)
        {
            try
            {
                using (var connection = CreateConnection())
                {
                    var parameters = new DynamicParameters();

                    // افزودن پارامترها با مقادیر پیش‌فرض یا بررسی‌شده
                    parameters.Add("@PKID", packageId);
                    parameters.Add("@PLId", updatedPackage.PLId);
                    parameters.Add("@NetW", updatedPackage.NetW ?? 0); // مقدار پیش‌فرض 0
                    parameters.Add("@GrossW", updatedPackage.GrossW ?? 0); // مقدار پیش‌فرض 0
                    parameters.Add("@Dimension", updatedPackage.Dimension ?? string.Empty); // پیش‌فرض خالی
                    parameters.Add("@Volume", updatedPackage.Volume ?? string.Empty);
                    parameters.Add("@ArrivalDate", updatedPackage.ArrivalDate.HasValue ? updatedPackage.ArrivalDate : DBNull.Value);
                    parameters.Add("@Desciption", updatedPackage.Desciption ?? string.Empty);
                    parameters.Add("@Remark", updatedPackage.Remark ?? string.Empty);
                    parameters.Add("@EditedBy", updatedPackage.EditedBy.HasValue ? updatedPackage.EditedBy.Value : DBNull.Value);

                    // اجرای پروسیجر
                    var result = connection.QueryFirstOrDefault<string>(
                        "UpdatePackage2025Pluse",
                        parameters,
                        commandType: CommandType.StoredProcedure,
                        commandTimeout: 120
                    );

                    // بررسی نتیجه
                    return result == "Update successful";
                }
            }
            catch (Exception ex)
            {
                // لاگ کردن خطا
                Console.WriteLine($"Error in UpdatePackage: {ex.Message}");
                return false;
            }
        }

        public bool UpdatePackage(int packageId, UpdatePackageDto updatedPackage)
        {
            using (var connection = CreateConnection())
            {
                var parameters = new DynamicParameters();
                parameters.Add("@PKID", packageId);
                parameters.Add("@ArrivalDate", updatedPackage.ArrivalDate);
                parameters.Add("@MSRNO", updatedPackage.MSRNO);
                parameters.Add("@MSRPDF", updatedPackage.MSRPDF);

                // افزودن پارامترهای ویرایش
                parameters.Add("@EditedBy", updatedPackage.EditedBy);
                parameters.Add("@EditedDate", updatedPackage.EditedDate);

                var affectedRows = connection.Execute("UpdatePackageINPackingList", parameters, commandType: CommandType.StoredProcedure);
                return affectedRows > 0;
            }
        }

        public async Task DeleteMultiplePKsWithTransactionAsync(IEnumerable<PackagePKIDDto> PKIDs)
        {
            using (var connection = CreateConnection())
            {
                connection.Open();
                using (var transaction = connection.BeginTransaction())
                {
                    try
                    {
                        var table = new DataTable();
                        table.Columns.Add("PKID", typeof(int));

                        foreach (var PKID in PKIDs)
                        {
                            table.Rows.Add(PKID.PKID);
                        }

                        var parameters = new DynamicParameters();
                        parameters.Add("@PKIDList", table.AsTableValuedParameter("dbo.PackagePKIDDtoType"));

                        await connection.ExecuteAsync("DeletePackages", parameters, transaction: transaction, commandType: CommandType.StoredProcedure);

                        transaction.Commit();
                    }
                    catch
                    {
                        transaction.Rollback();
                        throw;
                    }
                }
            }
        }



        private void SendDataToStoredProcedure(DataTable packages)
        {
            using (var connection = new SqlConnection(_connectionString))
            {
                connection.Open();

                using (var command = new SqlCommand("AddPackagesFromTempTable", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;

                    // ایجاد پارامتر برای داده‌های Package
                    var packageParam = command.Parameters.AddWithValue("@Packages", packages);
                    packageParam.SqlDbType = SqlDbType.Structured;
                    packageParam.TypeName = "dbo.PackageType";

                    command.ExecuteNonQuery();
                }
            }
        }

        // متد برای تبدیل لیست به DataTable
        private DataTable ConvertToDataTable(IEnumerable<PackageDto> packages)
        {
            var table = new DataTable();
            table.Columns.Add("PK", typeof(int));
            table.Columns.Add("NetW", typeof(decimal));
            table.Columns.Add("GrossW", typeof(decimal));
            table.Columns.Add("Dimension", typeof(string));
            table.Columns.Add("Volume", typeof(string));
            table.Columns.Add("ArrivalDate", typeof(DateTime));
            table.Columns.Add("Desciption", typeof(string));
            table.Columns.Add("Remark", typeof(string));
            table.Columns.Add("PLId", typeof(int)); // اضافه کردن PLId
            table.Columns.Add("EnteredBy", typeof(int)); // اضافه کردن EnteredBy
            table.Columns.Add("EnteredDate", typeof(DateTime)); // اضافه کردن EnteredDate

            foreach (var package in packages)
            {
                table.Rows.Add(package.PK, package.NetW, package.GrossW, package.Dimension, package.Volume, package.ArrivalDate, package.Desciption, package.Remark, package.PLId, package.EnteredBy, package.EnteredDate);
            }

            return table;
        }


        // متد برای افزودن لیست بسته‌ها
        public void AddPackages(IEnumerable<PackageDto> packages)
        {
            var dataTable = ConvertToDataTable(packages);
            SendDataToStoredProcedure(dataTable);
        }



    }
}
