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

namespace AWMS.app.Forms.RibbonMsr
{
    public partial class frmRegisterMsr : XtraForm
    {
        private readonly IServiceProvider _serviceProvider;
        private readonly UserSession _session; // اضافه کردن UserSession
        public frmRegisterMsr(IServiceProvider serviceProvider, int? userId = null)
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
                var data = await _serviceProvider.GetService<IInspectionDapperRepository>()!.GetInspectionDetailsWithEmptyMSRAsync();
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

        private async void registerMsrBtn_Click(object sender, EventArgs e)
        {
            // فرض کنید gridView1 نام GridView شماست
            var focusedRowHandle = gridView1.FocusedRowHandle;

            // بررسی اینکه آیا ردیفی انتخاب شده است
            if (focusedRowHandle < 0)
            {
                MessageBox.Show("Please select a row before proceeding.", "No Row Selected", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            // استخراج PLId از ستون GridView
            var plIdValue = gridView1.GetRowCellValue(focusedRowHandle, "PLId");
            if (plIdValue == null || !int.TryParse(plIdValue.ToString(), out int plId) || plId == 0)
            {
                MessageBox.Show("Could not retrieve PLId from the selected row.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }

            // نمایش تاییدیه به کاربر
            var dialogResult = MessageBox.Show(
                $"Selected PLId: {plId}\nDo you want to register an MSR for this PLId?",
                "Register MSR",
                MessageBoxButtons.YesNo,
                MessageBoxIcon.Question
            );

            // اگر کاربر گزینه No را انتخاب کند
            if (dialogResult == DialogResult.No)
            {
                return;
            }

            try
            {
                // فراخوانی تابع RegisterMsrAsync از Repository
                var newMsrNo = await _serviceProvider.GetService<IInspectionDapperRepository>()!.RegisterMsrAsync(plId, _session.UserID);
                labelControl1.Text = "MSR-" + newMsrNo;
                labelControl2.Text = "MSR-" + newMsrNo;
                labelControl3.Text = "MSR-" + newMsrNo;
                labelControl4.Text = "MSR-" + newMsrNo;
                labelControl5.Text = "MSR-" + newMsrNo;
                labelControl6.Text = "MSR-" + newMsrNo;
                // نمایش شماره جدید MSR به کاربر
                MessageBox.Show($"MSR successfully registered!\nNew MSR Number: {newMsrNo}", "Success", MessageBoxButtons.OK, MessageBoxIcon.Information);

                // به‌روزرسانی GridView یا هر عملیات مرتبط دیگر
                InitializeGrid();
                gridView1.RefreshData();
            }
            catch (Exception ex)
            {
                MessageBox.Show($"An error occurred: {ex.Message}", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

    }
}
