using AWMS.app.Forms.RibbonUser;
using AWMS.app.Utility;
using AWMS.core.Interfaces;
using AWMS.dapper;
using AWMS.dapper.Repositories;
using AWMS.datalayer.Entities;
using AWMS.dto;
using DevExpress.XtraEditors;
using DevExpress.XtraGrid;
using DevExpress.XtraGrid.Columns;
using DevExpress.XtraGrid.Views.Grid;
using DevExpress.XtraVerticalGrid;
using Microsoft.Extensions.DependencyInjection;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.TextBox;

namespace AWMS.app.Forms.RibbonMsr
{
    public partial class frmMsrRev : XtraForm
    {
        private readonly IServiceProvider _serviceProvider;
        private readonly UserSession _session; // اضافه کردن UserSession
        public frmMsrRev(IServiceProvider serviceProvider, int? userId = null)
        {
            InitializeComponent();
            _serviceProvider = serviceProvider;
            InitializeGrid();
            // اگر UserId پاس داده نشده بود، مقدار پیش‌فرض 1 استفاده می‌شود
            int finalUserId = userId ?? 1;
            _session = SessionManager.GetSession(finalUserId);
        }

        private async void InitializeGrid()
        {
            if (gridControl1 == null || gridView1 == null)
            {
                MessageBox.Show("کنترل‌های Grid مقداردهی نشده‌اند یا به درستی اضافه نشده‌اند.");
                return;
            }
            try
            {
                var data = await _serviceProvider.GetService<IInspectionDapperRepository>()!.GetInspectionDetailsWithMSRAsync();
                if (data != null && gridControl1 != null)
                {
                    gridControl1.DataSource = data;
                    gridView1.SortInfo.Clear();
                    gridView1.SortInfo.Add(new GridColumnSortInfo(gridView1.Columns["PLId"], DevExpress.Data.ColumnSortOrder.Descending));
                    if (gridView1.RowCount > 0) gridView1.FocusedRowHandle = 0;
                }
                else
                {
                    MessageBox.Show("No data retrieved from the database.");
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Error loading data: {ex.Message}");
            }
        }

        private void refreshBtn_Click(object sender, EventArgs e)
        {
            InitializeGrid();
        }

        private void gridView1_FocusedRowChanged(object sender, DevExpress.XtraGrid.Views.Base.FocusedRowChangedEventArgs e)
        {
            try
            {
                // گرفتن مقدار ستون MSRRev از رکورد انتخاب‌شده
                int rowHandle = e.FocusedRowHandle;
                if (rowHandle >= 0) // بررسی اینکه رکورد معتبر است
                {
                    object msrRevValue = gridView1.GetRowCellValue(rowHandle, "MSRRev");

                    // تبدیل مقدار MSRRev به عدد صحیح یا 0 در صورت null
                    int msrRev = msrRevValue == null ? 0 : Convert.ToInt32(msrRevValue);

                    // مقدار MSRRev را درون Label قرار دهید
                    labelControl9.Text = $"{msrRev}";
                    textEdit1.Text = $"{msrRev}";
                }
                else
                {
                    labelControl9.Text = "0";
                    textEdit1.Text = "0";
                }
            }
            catch (Exception ex)
            {
                // مدیریت خطا
                MessageBox.Show($"Error reading MSRRev: {ex.Message}", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                labelControl9.Text = "0";
                textEdit1.Text = "0";
            }
        }

        private async void UpdateMsrRevBtn_Click(object sender, EventArgs e)
        {
            var focusedRowHandle = gridView1.FocusedRowHandle;

            if (focusedRowHandle < 0)
            {
                MessageBox.Show("Please select a row before proceeding.", "No Row Selected", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            var plIdValue = gridView1.GetRowCellValue(focusedRowHandle, "PLId");

            // مقدار MSRRev از TextEdit1 گرفته می‌شود
            var msrRevValue = textEdit1.Text;

            if (plIdValue == null || !int.TryParse(plIdValue.ToString(), out int plId) || plId == 0)
            {
                MessageBox.Show("Could not retrieve PLId from the selected row.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }

            if (!int.TryParse(msrRevValue, out int msrRev))
            {
                MessageBox.Show("Please enter a valid MSRRev value.", "Invalid Input", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }

            // بررسی مقدار MSRRev با مقدار labelControl9
            if (int.TryParse(labelControl9.Text, out int currentMsrRev) && msrRev < currentMsrRev)
            {
                var dialogResult = MessageBox.Show(
                    $"The entered MSRRev value ({msrRev}) is less than the current value ({currentMsrRev}).\nDo you want to proceed?",
                    "Confirmation",
                    MessageBoxButtons.YesNo,
                    MessageBoxIcon.Warning
                );

                if (dialogResult == DialogResult.No)
                {
                    return;
                }
            }

            var dialogResultConfirm = MessageBox.Show(
                $"Selected PLId: {plId}\nDo you want to Update MSR Rev for this PLId?",
                "Update MSR Rev",
                MessageBoxButtons.YesNo,
                MessageBoxIcon.Question
            );

            if (dialogResultConfirm == DialogResult.No)
            {
                return;
            }

            try
            {
                var newMsrNo = await _serviceProvider.GetService<IInspectionDapperRepository>()!.UpdateMsrRevAsync(plId, msrRev, _session.UserID);
                labelControl1.Text = $"MSR-{newMsrNo} Rev-{msrRev}";
                labelControl2.Text = $"MSR-{newMsrNo} Rev-{msrRev}";
                labelControl3.Text = $"MSR-{newMsrNo} Rev-{msrRev}";
                labelControl4.Text = $"MSR-{newMsrNo} Rev-{msrRev}";
                labelControl5.Text = $"MSR-{newMsrNo} Rev-{msrRev}";
                labelControl6.Text = $"MSR-{newMsrNo} Rev-{msrRev}";

                MessageBox.Show($"MSR successfully updated!\nMSR Number with Rev: {newMsrNo} Rev-{msrRev}", "Success", MessageBoxButtons.OK, MessageBoxIcon.Information);

                InitializeGrid();
                gridView1.RefreshData();
            }
            catch (Exception ex)
            {
                MessageBox.Show($"An error occurred: {ex.Message}", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void textEdit1_KeyPress(object sender, KeyPressEventArgs e)
        {
            // بررسی اینکه فقط اعداد و کلید Backspace وارد شوند
            if (!char.IsDigit(e.KeyChar) && e.KeyChar != (char)Keys.Back)
            {
                e.Handled = true; // مانع از ورود کاراکترهای غیرمجاز شوید
            }
        }

        private async void simpleButton1_Click(object sender, EventArgs e)
        {
            // بررسی اینکه ردیفی انتخاب شده است
            var focusedRowHandle = gridView1.FocusedRowHandle;
            if (focusedRowHandle < 0)
            {
                MessageBox.Show("Please select a row to clear MSR data.", "No Row Selected", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            // گرفتن PLId از GridView
            var plIdValue = gridView1.GetRowCellValue(focusedRowHandle, "PLId");
            if (plIdValue == null || !int.TryParse(plIdValue.ToString(), out int plId) || plId == 0)
            {
                MessageBox.Show("Could not retrieve PLId from the selected row.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }

            // اولین تأیید از کاربر
            var firstConfirmation = MessageBox.Show(
                "Are you sure you want to clear MSR data for this item? This action cannot be undone.",
                "Confirm Clear",
                MessageBoxButtons.YesNo,
                MessageBoxIcon.Warning
            );

            if (firstConfirmation != DialogResult.Yes) return;

            // دومین تأیید از کاربر
            var secondConfirmation = MessageBox.Show(
                "This will permanently delete the MSR data. Do you want to proceed?",
                "Final Confirmation",
                MessageBoxButtons.YesNo,
                MessageBoxIcon.Warning
            );

            if (secondConfirmation != DialogResult.Yes) return;

            try
            {
                // فراخوانی متد ClearMsrAsync
                var isCleared = await _serviceProvider.GetService<IInspectionDapperRepository>()!.ClearMsrAsync(plId);

                if (isCleared)
                {
                    MessageBox.Show("MSR data has been cleared successfully.", "Success", MessageBoxButtons.OK, MessageBoxIcon.Information);

                    // به‌روزرسانی GridView
                    InitializeGrid();
                    gridView1.RefreshData();
                }
                else
                {
                    MessageBox.Show("Failed to clear MSR data. Please try again.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show($"An error occurred: {ex.Message}", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
    }
}
