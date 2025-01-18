using AWMS.app.Forms.frmBase;
using AWMS.app.Forms.RibbonUser;
using AWMS.core.Interfaces;
using AWMS.dapper.Repositories;
using AWMS.dto;
using DevExpress.XtraEditors;
using DevExpress.XtraSplashScreen;
using Microsoft.Extensions.Configuration; // افزودن این using
using Microsoft.Extensions.DependencyInjection;
using OfficeOpenXml;
using System;
using System.IO;

namespace AWMS.app.Forms.RibbonVoucher
{
    public partial class frmManageMrc : XtraForm
    {
        private readonly IServiceProvider _serviceProvider;
        private readonly IConfiguration _configuration; // افزودن این فیلد
        private readonly UserSession _session; // اضافه کردن متغیر سراسری برای UserSession

        public frmManageMrc(IServiceProvider serviceProvider,
            IConfiguration configuration, int? UserId = null) // افزودن IConfiguration به سازنده
        {
            InitializeComponent();
            _serviceProvider = serviceProvider;
            _configuration = configuration; // مقداردهی فیلد

            // اگر UserId پاس داده نشده بود، مقدار پیش‌فرض 1 استفاده می‌شود
            int finalUserId = UserId ?? 1;
            _session = SessionManager.GetSession(finalUserId);
            initgrid();
            lookUpEditMRC();
        }

        private async void lookUpEditMRC()
        {
            lookUpEdit1.Properties.DataSource = await _serviceProvider.GetService<IMrcDapperRepository>()!.GetUniqueMrcNamesAsync();
        }

        public async void initgrid()
        {
            gridControl1.DataSource = await _serviceProvider.GetService<IMrcDapperRepository>()!.GetAllMRCAsync();
        }

        private void btnRefreshData_Click(object sender, EventArgs e)
        {
            initgrid();
            lookUpEditMRC();
        }

        private void chkAllowEdit_CheckedChanged(object sender, EventArgs e)
        {
            if (chkAllowEdit.Checked) { gridView1.OptionsBehavior.ReadOnly = false; } else { gridView1.OptionsBehavior.ReadOnly = true; }
            //if (chkAllowEdit.Checked) { gridView1.OptionsBehavior.Editable = false; } else { gridView1.OptionsBehavior.Editable = true; }
        }

        private async void btnDeleteItem_Click(object sender, EventArgs e)
        {
            try
            {
                // Get the focused row handle
                int rowHandle = gridView1.FocusedRowHandle;

                // Check if a valid row is selected
                if (rowHandle < 0)
                {
                    MessageBox.Show("لطفاً یک ردیف را انتخاب کنید.", "هشدار", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    return;
                }

                // Get MrcId from the focused row
                var mrcId = gridView1.GetRowCellValue(rowHandle, "MrcId");

                // Check if MrcId is null or cannot be parsed to int
                if (mrcId == null || !int.TryParse(mrcId.ToString(), out int parsedMrcId))
                {
                    MessageBox.Show("شناسه معتبر نیست.", "خطا", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return;
                }

                // Confirmation dialog
                var confirmResult = MessageBox.Show("آیا مطمئن هستید که می‌خواهید این مورد را حذف کنید؟",
                                                     "تأیید حذف",
                                                     MessageBoxButtons.YesNo,
                                                     MessageBoxIcon.Question);

                if (confirmResult == DialogResult.Yes)
                {
                    // Call the delete method
                    var repository = _serviceProvider.GetService<IMrcDapperRepository>();
                    if (repository != null)
                    {
                        await repository.DeleteMrcByIdAsync(parsedMrcId);

                        // Refresh the grid after deletion
                        MessageBox.Show("آیتم با موفقیت حذف شد.", "موفقیت", MessageBoxButtons.OK, MessageBoxIcon.Information);
                        btnRefreshData_Click(null, null); // Refresh the grid after deletion
                    }
                    else
                    {
                        MessageBox.Show("خدمات مورد نظر یافت نشد.", "خطا", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show($"خطایی رخ داد: {ex.Message}", "خطا", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private async void btnDeleteMRC_Click(object sender, EventArgs e)
        {
            try
            {
                // Get the focused row handle
                int rowHandle = gridView1.FocusedRowHandle;

                // Check if a valid row is selected
                if (rowHandle < 0)
                {
                    MessageBox.Show("لطفاً یک ردیف را انتخاب کنید.", "هشدار", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    return;
                }

                // Get MrcName from the focused row
                var mrcName = gridView1.GetRowCellValue(rowHandle, "MrcName");
                if (mrcName == null)
                {
                    MessageBox.Show("MrcName معتبر نیست.", "خطا", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return;
                }

                // Confirmation dialog
                var confirmResult = MessageBox.Show($"آیا مطمئن هستید که می‌خواهید تمام ردیف‌هایی که MrcName آنها {mrcName} است حذف شوند؟",
                                                     "تأیید حذف",
                                                     MessageBoxButtons.YesNo,
                                                     MessageBoxIcon.Question);

                if (confirmResult == DialogResult.Yes)
                {
                    // Call the stored procedure to delete rows by MrcName
                    var repository = _serviceProvider.GetService<IMrcDapperRepository>();
                    if (repository != null)
                    {
                        // Execute the stored procedure with MrcName as a parameter
                        await repository.DeleteMrcsByMrcNameAsync(mrcName.ToString());

                        // Refresh the grid after deletion
                        MessageBox.Show("تمام آیتم‌ها با موفقیت حذف شدند.", "موفقیت", MessageBoxButtons.OK, MessageBoxIcon.Information);
                        btnRefreshData_Click(null, null); // Refresh the grid after deletion
                    }
                    else
                    {
                        MessageBox.Show("خدمات مورد نظر یافت نشد.", "خطا", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show($"خطایی رخ داد: {ex.Message}", "خطا", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private async void gridView1_CellValueChanged(object sender, DevExpress.XtraGrid.Views.Base.CellValueChangedEventArgs e)
        {
            try
            {
                // Check if the column is one of the editable fields
                if (e.Column.FieldName == "PK" || e.Column.FieldName == "ItemOfPk" || e.Column.FieldName == "Tag" ||
                    e.Column.FieldName == "Description" || e.Column.FieldName == "Qty" || e.Column.FieldName == "Size1" ||
                    e.Column.FieldName == "Size2" || e.Column.FieldName == "BatchNo" || e.Column.FieldName == "DocNo" ||
                    e.Column.FieldName == "Remark")
                {
                    // Get the MrcId for the row
                    var mrcId = gridView1.GetRowCellValue(e.RowHandle, "MrcId");
                    if (mrcId == null || !int.TryParse(mrcId.ToString(), out int parsedMrcId))
                    {
                        MessageBox.Show("شناسه معتبر نیست.", "خطا", MessageBoxButtons.OK, MessageBoxIcon.Error);
                        return;
                    }

                    // Get the updated value for the changed cell
                    var updatedValue = e.Value;

                    // Call the update stored procedure with the necessary parameters
                    var repository = _serviceProvider.GetService<IMrcDapperRepository>();
                    if (repository != null)
                    {
                        // Create a dynamic object to pass the parameters to the stored procedure
                        var parameters = new
                        {
                            MrcId = parsedMrcId,
                            ColumnName = e.Column.FieldName,
                            NewValue = updatedValue
                        };

                        // Call the stored procedure to update the record
                        await repository.UpdateMrcFieldAsync(parameters);
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show($"خطایی رخ داد: {ex.Message}", "خطا", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void btnPrintMRC_Click(object sender, EventArgs e)
        {
            try
            {
                // گرفتن مقدار از LookUpEdit
                string mrcValue = lookUpEdit1.Text;

                // بررسی اینکه مقدار وارد شده در LookUpEdit خالی نباشد
                if (string.IsNullOrEmpty(mrcValue))
                {
                    MessageBox.Show("لطفاً مقداری را از لیست انتخاب کنید.", "خطا", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return;
                }

                // ایجاد و نمایش فرم جدید و ارسال مقدار
                frmPrintMRC printForm = new frmPrintMRC(_serviceProvider, mrcValue,_session.UserID);
                printForm.ShowDialog();
            }
            catch (Exception ex)
            {
                MessageBox.Show($"خطایی رخ داد: {ex.Message}", "خطا", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

    }
}
