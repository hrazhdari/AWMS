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
    public partial class frmRegisterIvr : XtraForm
    {
        private readonly IServiceProvider _serviceProvider;
        private readonly UserSession _session; // اضافه کردن UserSession
        public frmRegisterIvr(IServiceProvider serviceProvider, int? userId = null)
        {
            InitializeComponent();
            _serviceProvider = serviceProvider;
            InitIrn();
            InitializeGrid();
            // اگر UserId پاس داده نشده بود، مقدار پیش‌فرض 1 استفاده می‌شود
            int finalUserId = userId ?? 1;
            _session = SessionManager.GetSession(finalUserId);
        }

        private void InitIrn()
        {
            repositoryItemLookUpEdit2.DataSource = _serviceProvider.GetService<IIrnService>()!.GetAllIrns();
        }

        private async void InitializeGrid()
        {
            if (gridcontrolInspection == null || gridView1 == null)
            {
                MessageBox.Show("کنترل‌های Grid مقداردهی نشده‌اند یا به درستی اضافه نشده‌اند.");
                return;
            }
            try
            {
                var data = await _serviceProvider.GetService<IInspectionDapperRepository>()!.GetInspectionDetails();
                if (data != null && gridcontrolInspection != null)
                {
                    gridcontrolInspection.DataSource = data;
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
       
        private async void GridView_CellValueChanged(object sender, DevExpress.XtraGrid.Views.Base.CellValueChangedEventArgs e)
        {
            // Cast sender to GridView
            GridView gridView = sender as GridView;
            if (gridView == null) return;

            try
            {
                // دریافت مقدار ستون‌های مورد نیاز به صورت جداگانه
                int plId = (int)(gridView.GetRowCellValue(e.RowHandle, "PLId") ?? 0);
                int? irnId = (int?)gridView.GetRowCellValue(e.RowHandle, "IrnId");
                bool irnConflict = (bool)(gridView.GetRowCellValue(e.RowHandle, "IRN_Conflict") ?? false);
                string ivrNo = gridView.GetRowCellValue(e.RowHandle, "IVR_NO")?.ToString();
                string ivrIfr = gridView.GetRowCellValue(e.RowHandle, "IVR_IFR")?.ToString();
                string orderStatus = gridView.GetRowCellValue(e.RowHandle, "OrderStatus")?.ToString();
                bool thirdParty = (bool)(gridView.GetRowCellValue(e.RowHandle, "ThirdParty") ?? false);
                bool opi = (bool)(gridView.GetRowCellValue(e.RowHandle, "OPI") ?? false);
                string description = gridView.GetRowCellValue(e.RowHandle, "Description")?.ToString();
                string icNo = gridView.GetRowCellValue(e.RowHandle, "IcNo")?.ToString();
                string subProject = gridView.GetRowCellValue(e.RowHandle, "SubProject")?.ToString();
                bool site = (bool)(gridView.GetRowCellValue(e.RowHandle, "Site") ?? false);
                bool laydown = (bool)(gridView.GetRowCellValue(e.RowHandle, "Laydown") ?? false);
                bool warehouse = (bool)(gridView.GetRowCellValue(e.RowHandle, "Warehouse") ?? false);
                bool osbl = (bool)(gridView.GetRowCellValue(e.RowHandle, "OSBL") ?? false);
                bool? visualInspection = (bool?)gridView.GetRowCellValue(e.RowHandle, "VisualInspection");
                bool? quantityCheck = (bool?)gridView.GetRowCellValue(e.RowHandle, "QuantityCheck");
                bool? marking = (bool?)gridView.GetRowCellValue(e.RowHandle, "Marking");
                bool? unloading = (bool?)gridView.GetRowCellValue(e.RowHandle, "Unloading");
                int editedBy = _session.UserID; // فرض کنید _session کاربر جاری را دارد
                DateTime editedDate = DateTime.Now;

                // ارسال مقادیر به متد Update
                await _serviceProvider.GetService<IInspectionDapperRepository>()!.UpdateInspectionDetailsAsync(
                    new UpdateInspectionDetailsDto
                    {
                        PLId = plId,
                        IrnId = irnId,
                        IRN_Conflict = irnConflict,
                        IVR_NO = ivrNo,
                        IVR_IFR = ivrIfr,
                        OrderStatus = orderStatus,
                        ThirdParty = thirdParty,
                        OPI = opi,
                        Description = description,
                        IcNo = icNo,
                        SubProject = subProject,
                        Site = site,
                        Laydown = laydown,
                        Warehouse = warehouse,
                        OSBL = osbl,
                        VisualInspection = visualInspection,
                        QuantityCheck = quantityCheck,
                        Marking = marking,
                        Unloading = unloading,
                        EditedBy = editedBy,
                        EditedDate = editedDate
                    });

                // پیغام موفقیت
                //MessageBox.Show("Row updated successfully!", "Success", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            catch (Exception ex)
            {
                // مدیریت خطا
                MessageBox.Show($"Error updating row: {ex.Message}", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }



        private void btnexcel_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            ExportFromGridViewDevexpress.SaveGridData("Excel Files|*.xlsx", "Save Excel File", fileName => gridView1.ExportToXlsx(fileName));
        }

        private void barButtonItem1_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            var frmIrn = _serviceProvider.GetRequiredService<Forms.frmSmall.frmIRN>();
            frmIrn.ShowDialog();
        }

        private void barToggleSwitchItem1_CheckedChanged(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            var toggleSwitch = sender as DevExpress.XtraBars.BarToggleSwitchItem;
            if (toggleSwitch != null)
            {
                bool isEditable = toggleSwitch.Checked; // وضعیت روشن یا خاموش بودن
                gridView1.OptionsBehavior.Editable = isEditable;
            }
        }

        private void frmRegisterIvr_Load(object sender, EventArgs e)
        {
            // بررسی وضعیت اولیه ToggleSwitch
            bool isEditable = barToggleSwitchItem1.Checked;

            // تنظیم قابلیت ویرایش GridView
            gridView1.OptionsBehavior.Editable = isEditable;
        }

        private void barButtonItem3_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            InitIrn();
            InitializeGrid();
        }
    }
}
