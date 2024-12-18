using AWMS.app.Forms.RibbonUser;
using AWMS.dapper.Repositories;
using DevExpress.XtraEditors;
using DevExpress.XtraEditors.Repository;
using System.Data;
using static AWMS.dapper.ApproveDapperRepository;
using Microsoft.Extensions.DependencyInjection;
using DevExpress.Xpo;
using AWMS.core;
using AWMS.datalayer.Repositories;
using AWMS.core.Interfaces;
using AWMS.dto;
using System.ComponentModel;
using AWMS.app.Utility;
using DevExpress.XtraGrid.Views.Grid;

namespace AWMS.app.Forms.RibbonVoucher
{
    public partial class frmUpdateHmv : XtraForm
    {

        private readonly IServiceProvider _serviceProvider;
        private readonly UserSession _session; // اضافه کردن UserSession
        public frmUpdateHmv(IServiceProvider serviceProvider, int? userId = null)
        {
            InitializeComponent();
            _serviceProvider = serviceProvider;
            // اگر UserId پاس داده نشده بود، مقدار پیش‌فرض 1 استفاده می‌شود
            int finalUserId = userId ?? 1;
            _session = SessionManager.GetSession(finalUserId);
            loadEditLookupMRV();
            loadData();
            //gridView1.CustomDrawColumnHeader += gridView1_CustomDrawColumnHeader;
        }

        private async void loadData()
        {
            //lookupLocation.Properties.DataSource = await _serviceProvider.GetService<ILocationDapperRepository>()!.GetAllAsync();
            lookupCompany.Properties.DataSource = await _serviceProvider.GetService<ICompanyService>()!.GetAllCompaniesNameAsync();
        }

        private async void loadEditLookupMRV()
        {
            try
            {
                var requestNos = await _serviceProvider.GetService<IHmvDapperRepository>()!.GetHmvsAsync();

                // تنظیم DataSource برای LookUpEdit
                lookUpEdit1.Properties.DataSource = requestNos.Select(r => new { RequestNO = r }).ToList(); // تبدیل به یک لیست از آبجکت‌های ناشناس
                lookUpEdit1.Properties.DisplayMember = "RequestNO"; // مشخص کردن ستون برای نمایش
                lookUpEdit1.Properties.ValueMember = "RequestNO";   // مشخص کردن ستون برای مقدار
                lookUpEdit1.Properties.NullText = "Select HmvNO"; // تنظیم متن خالی
            }
            catch (Exception ex)
            {
                // نمایش خطا در صورت وجود
                XtraMessageBox.Show($"خطا در بارگذاری داده‌ها: {ex.Message}", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }



        private async void ConfigureGridViewAppearance()
        {
            // بررسی اینکه آیا gridView1 مقداردهی شده است
            if (gridView1 == null)
            {
                MessageBox.Show("GridView is not initialized.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }

            // تنظیمات اولیه برای GridView

            gridView1.RowCellStyle += gridView1_RowCellStyle;

        }



        // رویداد برای تغییر رنگ فیلدهای خاص
        private void gridView1_RowCellStyle(object sender, DevExpress.XtraGrid.Views.Grid.RowCellStyleEventArgs e)
        {

            gridView1.Appearance.Row.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center;
            gridView1.Appearance.Row.TextOptions.VAlignment = DevExpress.Utils.VertAlignment.Center;
            gridView1.Appearance.HeaderPanel.Font = new Font(gridView1.Appearance.HeaderPanel.Font, FontStyle.Bold);
        }


        private async void lookUpEdit1_EditValueChanged(object sender, EventArgs e)
        {
            try
            {
                if (lookUpEdit1.EditValue == null)
                {
                    MessageBox.Show("Please select a valid HMV.", "Validation Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
                var requestNos = await _serviceProvider.GetService<IHmvDapperRepository>()!.GetHmvsInfoAsync((lookUpEdit1.EditValue)?.ToString());
                // فرض کنیم requestNos شامل یک شیء یا لیستی از نتایج است
                if (requestNos != null)
                {
                    // نمایش یکی از خصوصیات مثلا CompanyName در labelControl5
                    labelControl5.Text = requestNos.fromCompanyName; // یا هر فیلد دیگری که لازم دارید
                    labelControl12.Text = requestNos.toCompanyName; // یا هر فیلد دیگری که لازم دارید
                    labelControl6.Text = requestNos.HMVNO; // یا هر فیلد دیگری که لازم دارید
                    textEdit1.Text = requestNos.HMVNO; // یا هر فیلد دیگری که لازم دارید
                }
                else
                {
                    labelControl5.Text = "No data found";
                }
            }
            catch (Exception ex)
            {
                // نمایش خطا در صورت وجود
                XtraMessageBox.Show($"Error loading data : {ex.Message}", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            try
            {
                var selectedRequestNo = lookUpEdit1.EditValue?.ToString();

                if (string.IsNullOrEmpty(selectedRequestNo))
                {
                    MessageBox.Show("Please select a HMV.NO.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return;
                }

                gridControl1.DataSource = await _serviceProvider.GetService<IHmvDapperRepository>()!.GetHmvByHmvNoAsync(selectedRequestNo);

                gridView1.BestFitColumns();

                // اعمال تنظیمات ظاهری برای GridView
                ConfigureGridViewAppearance();
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Error fetching data: {ex.Message}", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void checkEdit1_CheckedChanged(object sender, EventArgs e)
        {
            // بررسی وضعیت CheckBox
            bool isChecked = checkEdit1.Checked;

            // فعال یا غیرفعال کردن دکمه‌ها بر اساس وضعیت CheckBox
            btnDellMrv.Enabled = isChecked;
            btnDelRowOfMrv.Enabled = isChecked;
        }


        private async void btnZeroAll_Click_1(object sender, EventArgs e)
        {
            try
            {
                // Show confirmation message to ensure the user wants to proceed
                DialogResult result = MessageBox.Show("Are you sure you want to proceed with this operation to change the HMV Name?", "Confirmation", MessageBoxButtons.YesNo, MessageBoxIcon.Question);

                if (result == DialogResult.No)
                {
                    return;
                }

                // Get the selected MRV number from lookUpEdit1
                string hmvno = lookUpEdit1.EditValue?.ToString();

                if (string.IsNullOrWhiteSpace(hmvno))
                {
                    MessageBox.Show("Please select a valid HMV number.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return;
                }

                // Check if textEdit1 is empty or null
                if (string.IsNullOrWhiteSpace(textEdit1.Text))
                {
                    MessageBox.Show("Please enter a valid value in the HMV Name field.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return;
                }

                // Call the UpdateMrvNameAsync method and pass the MRV number and name
                bool requestNos = await _serviceProvider.GetService<IHmvDapperRepository>()!.UpdateHmvNameAsync(hmvno, textEdit1.Text);

                if (requestNos)
                {
                    MessageBox.Show("HMV Name is Changed.", "Success", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    labelControl6.Text = textEdit1.Text;
                }
                else
                {
                    MessageBox.Show("No rows were updated. Please check if the HMV number and name are correct.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show($"An error occurred: {ex.Message}", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
        private async void simpleButton2_Click(object sender, EventArgs e)
        {
            try
            {
                // Show confirmation message to ensure the user wants to proceed
                DialogResult result = MessageBox.Show("Are you sure you want to proceed with this operation to change the HMV To Company (The Company Received The Material?", "Confirmation", MessageBoxButtons.YesNo, MessageBoxIcon.Question);

                if (result == DialogResult.No)
                {
                    return;
                }

                // Get the selected HMV number from lookUpEdit1
                string hmvno = lookUpEdit1.EditValue?.ToString();

                if (string.IsNullOrWhiteSpace(hmvno))
                {
                    MessageBox.Show("Please select a valid HMV number.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return;
                }

                // Get the selected MRV Company from lookupCompany
                if (lookupCompany.EditValue == null || !int.TryParse(lookupCompany.EditValue.ToString(), out int hmvcompany) || hmvcompany == 0)
                {
                    MessageBox.Show("Please select a valid HMV To Company.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return;
                }

                // Call the UpdateMrvCompanyAsync method and pass the MRV number and company
                bool requestNos = await _serviceProvider.GetService<IHmvDapperRepository>()!.UpdateHmvCompanyAsync(hmvno, hmvcompany);

                if (requestNos)
                {
                    MessageBox.Show("HMV Company is Changed.", "Success", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    labelControl12.Text = lookupCompany.Text;
                    // به‌روزرسانی مقدار ستون toCompanyName در GridView
                    for (int i = 0; i < gridView1.RowCount; i++)
                    {
                        gridView1.SetRowCellValue(i, "toCompanyName", lookupCompany.Text);
                    }
                }
                else
                {
                    MessageBox.Show("No rows were updated. Please check if the HMV Company and HMV number are correct.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show($"An error occurred: {ex.Message}", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void gridView1_CellValueChanged(object sender, DevExpress.XtraGrid.Views.Base.CellValueChangedEventArgs e)
        {
            GridView view = sender as GridView;
      
            if (e.Column.FieldName == "RemarkRequests" && e.RowHandle >= 0)
            {
                object newMrvRemarkValue = e.Value;
                int[] selectedRows = view.GetSelectedRows();
                string mrvno = lookUpEdit1.EditValue?.ToString();

                view.CellValueChanged -= gridView1_CellValueChanged;

                List<UpdateMrvRemarkDto> updateDtos = new List<UpdateMrvRemarkDto>();

                foreach (int rowHandle in selectedRows)
                {
                    view.SetRowCellValue(rowHandle, "RemarkRequests", newMrvRemarkValue);

                    object locItemId = gridView1.GetRowCellValue(rowHandle, "LocItemID");

                    if (locItemId != null)
                    {
                        int locItemIdValue = Convert.ToInt32(locItemId);
                        var MrvRemarkValue = (newMrvRemarkValue).ToString();

                        var updateDto = new UpdateMrvRemarkDto
                        {
                            LocItemID = locItemIdValue,
                            MRVRequest = mrvno,
                            RemarkRequests = MrvRemarkValue,
                            EditedBy = _session.UserID, // Replace with the actual current user
                            EditedDate = DateTime.Now
                        };

                        updateDtos.Add(updateDto);
                    }
                    else
                    {
                        XtraMessageBox.Show($"LocItemID is null for row handle {rowHandle}.");
                    }
                }

                view.CellValueChanged += gridView1_CellValueChanged;

                UpdateHmvRemarkInDatabase(updateDtos);
            }
            if ((e.Column.FieldName == "ReqHmvQty" || e.Column.FieldName == "DelHmvQty" || e.Column.FieldName == "DelHmvRejQty") && e.RowHandle >= 0)
            {

                int[] selectedRows = view.GetSelectedRows();
                string hmvno = lookUpEdit1.EditValue?.ToString();

                view.CellValueChanged -= gridView1_CellValueChanged;

                List<updateHMVqtiesDto> updateDtos = new List<updateHMVqtiesDto>();

                foreach (int rowHandle in selectedRows)
                {
                    object locItemId = gridView1.GetRowCellValue(rowHandle, "LocItemID");
                    object ReqLocItemID = gridView1.GetRowCellValue(rowHandle, "ReqLocItemID");
                    object ReqHmvQtyValue = gridView1.GetRowCellValue(rowHandle, "ReqHmvQty");
                    object DelHmvQtyValue = gridView1.GetRowCellValue(rowHandle, "DelHmvQty");
                    object DelHmvRejQtyValue = gridView1.GetRowCellValue(rowHandle, "DelHmvRejQty");

                    if (locItemId != null)
                    {
                        int locItemIdValue = Convert.ToInt32(locItemId);
                        int ReqLocItemIDValue = Convert.ToInt32(ReqLocItemID);
                        decimal ReqHmvQty = Convert.ToDecimal(ReqHmvQtyValue);
                        decimal DelHmvQty = Convert.ToDecimal(DelHmvQtyValue);
                        decimal DelHmvRejQty = Convert.ToDecimal(DelHmvRejQtyValue);

                        var updateDto = new updateHMVqtiesDto
                        {
                            LocItemID = locItemIdValue,
                            ReqLocItemID = ReqLocItemIDValue,
                            HMVRequest = hmvno,
                            ReqHmvQty = ReqHmvQty,
                            DelHmvQty = DelHmvQty,
                            DelHmvRejQty = DelHmvRejQty,
                            EditedBy = _session.UserID, // Replace with the actual current user
                            EditedDate = DateTime.Now
                        };

                        updateDtos.Add(updateDto);
                    }
                    else
                    {
                        XtraMessageBox.Show($"LocItemID is null for row handle {rowHandle}.");
                    }
                }

                view.CellValueChanged += gridView1_CellValueChanged;

                UpdateHmvQtyInDatabase(updateDtos);
            }
        }

        private async void UpdateHmvQtyInDatabase(List<updateHMVqtiesDto> updateDtos)
        {
            try
            {
                await _serviceProvider.GetService<IHmvDapperRepository>()!.UpdateHmvQtyAsync(updateDtos);
                gridView1.RefreshData();
            }
            catch (Exception ex)
            {
                XtraMessageBox.Show($"Error occurred: {ex.Message}", "Error occurred", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private async void UpdateHmvRemarkInDatabase(List<UpdateMrvRemarkDto> updateDtos)
        {
            try
            {
                await _serviceProvider.GetService<IHmvDapperRepository>()!.UpdateHmvRemarksAsync(updateDtos);
                gridView1.RefreshData();
            }
            catch (Exception ex)
            {
                XtraMessageBox.Show($"Error occurred: {ex.Message}");
            }
        }

     
        private void labelControl10_Click(object sender, EventArgs e)
        {
            ExportFromGridViewDevexpress.SaveGridData("Excel Files|*.xlsx", "Save Excel File", fileName => gridView1.ExportToXlsx(fileName));
        }

        private async void btnDelRowOfMrv_Click(object sender, EventArgs e)
        {
            try
            {
                // بررسی اینکه آیا ردیفی انتخاب شده است
                var selectedRow = gridView1.GetFocusedRow();
                if (selectedRow == null)
                {
                    MessageBox.Show("Please select a row to delete.", "No Selection", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    return;
                }

                // دریافت LocItemID از ردیف انتخابی
                var ReqLocItemID = (int)gridView1.GetFocusedRowCellValue("ReqLocItemID");
                string hmvno = lookUpEdit1.EditValue?.ToString();
                // نمایش پیام تایید
                var confirmResult = MessageBox.Show(
                    "Are you sure you want to delete this row?",
                    "Confirm Deletion",
                    MessageBoxButtons.YesNo,
                    MessageBoxIcon.Question);

                if (confirmResult == DialogResult.Yes)
                {
                    // فراخوانی متد حذف
                    await _serviceProvider.GetService<IHmvDapperRepository>()!.DeleteHmvRowAsync(ReqLocItemID, hmvno);

                    // حذف ردیف از GridView
                    gridView1.DeleteRow(gridView1.FocusedRowHandle);

                    MessageBox.Show("Row deleted successfully.", "Success", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show($"An error occurred: {ex.Message}", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private async void btnDellMrv_Click(object sender, EventArgs e)
        {
            try
            {
                // بررسی اینکه آیا MRV انتخاب شده است
                string hmvno = lookUpEdit1.EditValue?.ToString();
                if (string.IsNullOrEmpty(hmvno))
                {
                    MessageBox.Show("Please select a HMV to delete.", "No Selection", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    return;
                }

                // نمایش پیام تایید
                var confirmResult = MessageBox.Show(
                    "Are you sure you want to delete this HMV?",
                    "Confirm Deletion",
                    MessageBoxButtons.YesNo,
                    MessageBoxIcon.Question);

                if (confirmResult == DialogResult.Yes)
                {
                    // فراخوانی متد حذف
                    await _serviceProvider.GetService<IHmvDapperRepository>()!.DeleteHmvAsync(hmvno);

                    // پاک کردن داده‌های GridControl
                    gridControl1.DataSource = null;

                    //loadEditLookupMRV();
                    lookUpEdit1.Refresh();
                    MessageBox.Show("HMV deleted successfully.", "Success", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show($"An error occurred: {ex.Message}", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
    }
}
