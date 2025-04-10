using DevExpress.XtraEditors;
using Microsoft.Extensions.Configuration;
using System;
using System.Data;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace AWMS.app.Forms.RibbonSetting
{
    public partial class frmDatabaseSetting : DevExpress.XtraEditors.XtraForm
    {
        private readonly string _connectionString;

        public frmDatabaseSetting(IConfiguration configuration)
        {
            InitializeComponent();
            _connectionString = configuration.GetConnectionString("DefaultConnection")!;
        }

        private IDbConnection CreateConnection()
        {
            return new SqlConnection(_connectionString);
        }

        private void simpleButton1_Click(object sender, EventArgs e)
        {
            try
            {
                // نمایش هشدار به کاربر
                var result = XtraMessageBox.Show(
                    "Updating statistics can take some time and may temporarily slow down the system. Do you want to continue?",
                    "Warning",
                    MessageBoxButtons.YesNo,
                    MessageBoxIcon.Warning
                );

                if (result == DialogResult.Yes)
                {
                    // اتصال به دیتابیس و اجرای sp_updatestats
                    using (var connection = CreateConnection())
                    {
                        connection.Open();
                        using (var command = new SqlCommand("EXEC sp_updatestats;", (SqlConnection)connection))
                        {

                            command.CommandType = CommandType.Text;
                            command.CommandTimeout = 300; // افزایش Timeout به 300 ثانیه (5 دقیقه)
                            command.ExecuteNonQuery();
                        }
                    }

                    // نمایش پیام موفقیت
                    XtraMessageBox.Show(
                        "Statistics updated successfully!",
                        "Success",
                        MessageBoxButtons.OK,
                        MessageBoxIcon.Information
                    );
                }
            }
            catch (Exception ex)
            {
                // مدیریت خطاها و نمایش پیام
                XtraMessageBox.Show(
                    $"An error occurred: {ex.Message}",
                    "Error",
                    MessageBoxButtons.OK,
                    MessageBoxIcon.Error
                );
            }
        }
    }
}
