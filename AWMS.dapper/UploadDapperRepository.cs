using AWMS.dapper.Repositories;
using AWMS.dto;
using Dapper;
using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Configuration;
using System.Data;

namespace AWMS.dapper
{
    public class UploadDapperRepository : IUploadDapperRepository
    {
        private readonly string _connectionString;

        public UploadDapperRepository(IConfiguration configuration)
        {
            _connectionString = configuration.GetConnectionString("DefaultConnection")!;
        }

        private IDbConnection CreateConnection()
        {
            return new SqlConnection(_connectionString);
        }

        public bool UpdatePackingListPLDPF(string fileName, string filePath)
        {
            using (var connection = CreateConnection())
            {
                string storedProcedure = "UpdatePackingListPLDPF"; // نام stored procedure

                // پارامترها را به stored procedure ارسال می‌کنیم
                var parameters = new { PLName = fileName, PLDPF = filePath };

                // اجرای stored procedure با استفاده از Dapper و بازگرداندن تعداد ردیف‌های به‌روزرسانی‌شده
                int affectedRows = connection.Execute(storedProcedure, parameters, commandType: CommandType.StoredProcedure);

                // اگر ردیفی به‌روزرسانی شد، true برمی‌گردانیم
                return affectedRows > 0;
            }
        }

        public bool UpdateIRNPDF(string fileName, string filePath)
        {
            using (var connection = CreateConnection())
            {
                string storedProcedure = "UpdateIRNPDF"; // نام stored procedure

                // پارامترها را به stored procedure ارسال می‌کنیم
                var parameters = new { IRNName = fileName, IRNPDF = filePath };

                // اجرای stored procedure با استفاده از Dapper و بازگرداندن تعداد ردیف‌های به‌روزرسانی‌شده
                int affectedRows = connection.Execute(storedProcedure, parameters, commandType: CommandType.StoredProcedure);

                // اگر ردیفی به‌روزرسانی شد، true برمی‌گردانیم
                return affectedRows > 0;
            }
        }

        public bool UpdateRequestMIVPDF(string fileName, string filePath)
        {
            using (var connection = CreateConnection())
            {
                string storedProcedure = "UpdateRequestMIVPDF"; // نام stored procedure

                // پارامترها را به stored procedure ارسال می‌کنیم
                var parameters = new { RequestNo = fileName, RequestPDF = filePath };

                // اجرای stored procedure با استفاده از Dapper و بازگرداندن تعداد ردیف‌های به‌روزرسانی‌شده
                int affectedRows = connection.Execute(storedProcedure, parameters, commandType: CommandType.StoredProcedure);

                // اگر ردیفی به‌روزرسانی شد، true برمی‌گردانیم
                return affectedRows > 0;
            }
        }

        public bool UpdatePKMSRPDF(string fileName, string filePath)
        {
            using (var connection = CreateConnection())
            {
                string storedProcedure = "UpdatePKMSRPDF"; // نام stored procedure

                // پارامترها را به stored procedure ارسال می‌کنیم
                var parameters = new { MSRNO = fileName, MSRPDF = filePath };

                // اجرای stored procedure با استفاده از Dapper و بازگرداندن تعداد ردیف‌های به‌روزرسانی‌شده
                int affectedRows = connection.Execute(storedProcedure, parameters, commandType: CommandType.StoredProcedure);

                // اگر ردیفی به‌روزرسانی شد، true برمی‌گردانیم
                return affectedRows > 0;
            }
        }

        // متد برای فراخوانی Stored Procedure و دریافت داده‌ها
        public IEnumerable<PDFSsectionPLDto> GetPackingLists()
        {
            using (var connection = CreateConnection())
            {
                var sql = "PDFSsectionPL"; // نام Stored Procedure
                return connection.Query<PDFSsectionPLDto>(sql, commandType: CommandType.StoredProcedure).ToList();
            }
        }
        public IEnumerable<PDFsectionIRNDto> GetIrns()
        {
            using (var connection = CreateConnection())
            {
                var sql = "PDFSsectionIRN"; // نام Stored Procedure
                return connection.Query<PDFsectionIRNDto>(sql, commandType: CommandType.StoredProcedure).ToList();
            }
        }
        public IEnumerable<PDFsectionMIVDto> GetMIVs()
        {
            using (var connection = CreateConnection())
            {
                var sql = "PDFSsectionMIV"; // نام Stored Procedure
                return connection.Query<PDFsectionMIVDto>(sql, commandType: CommandType.StoredProcedure).ToList();
            }
        }
    }
}
