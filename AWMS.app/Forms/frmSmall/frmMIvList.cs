using AWMS.dapper.Repositories;
using DevExpress.XtraEditors;
using System.IO;

namespace AWMS.app.Forms.frmSmall
{
    public partial class frmMIvList : XtraForm
    {
        private int _locItemId;
        private readonly IChangeDapperRepository _changeDapperRepository;
        public frmMIvList(IChangeDapperRepository changeDapperRepository, int locItemId)
        {
            InitializeComponent();
            _locItemId = locItemId;
            _changeDapperRepository = changeDapperRepository;
            // بارگذاری اطلاعات مرتبط با LocItemID از جدول Requests
            LoadRequestData(_locItemId);
        }
        private async void LoadRequestData(int locItemId)
        {

            if (locItemId != -1)
            {
                var requests = await _changeDapperRepository.GetRequestsByLocItemIdAsync(locItemId);
                gridControl1.DataSource = requests;
            }


            gridView1.Columns["CompanyID2"].Visible = false;
            gridView1.Columns["ContractId"].Visible = false;
            gridView1.Columns["ContractId2"].Visible = false;
            gridView1.Columns["AreaUnitID"].Visible = false;
            gridView1.Columns["VendorID"].Visible = false;
            gridView1.Columns["TypeID"].Visible = false;
            gridView1.Columns["ReqMivRejQty"].Visible = false;
            gridView1.Columns["ReserveMivRejQty"].Visible = false;
            gridView1.Columns["DelMivRejQty"].Visible = false;
            gridView1.Columns["ReqMrvQty"].Visible = false;
            gridView1.Columns["DelMrvQty"].Visible = false;
            gridView1.Columns["DelMrvRejQty"].Visible = false;
            gridView1.Columns["ReqHmvQty"].Visible = false;
            gridView1.Columns["DelHmvQty"].Visible = false;
            gridView1.Columns["DelHmvRejQty"].Visible = false;
            gridView1.Columns["ApprovedBy"].Visible = false;
            gridView1.Columns["ApprovedDate"].Visible = false;
            gridView1.Columns["DelDate"].Visible = false;
            gridView1.Columns["MRVNO"].Visible = false;
            gridView1.Columns["HMVNO"].Visible = false;
            gridView1.Columns["RequestPDF"].Visible = false;
            gridView1.Columns["RequestTypeTypeID"].Visible = false;

            // فعال‌سازی قابلیت‌های سفارشی‌سازی ستون‌ها
            gridView1.OptionsCustomization.AllowColumnMoving = true;
            gridView1.OptionsCustomization.AllowQuickHideColumns = true;

            // نمایش پنل سفارشی‌سازی
            gridView1.ShowCustomization();

            // وسط‌چین کردن محتوای سلول‌ها
            gridView1.Appearance.Row.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center;

            // وسط‌چین کردن عنوان (header) ستون‌ها
            gridView1.Appearance.HeaderPanel.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center;
        }
        private void SaveGridData(string filter, string title, Action<string> exportAction)
        {
            SaveFileDialog saveFileDialog = new SaveFileDialog
            {
                Filter = filter,
                Title = title
            };

            if (saveFileDialog.ShowDialog() == DialogResult.OK)
            {
                exportAction.Invoke(saveFileDialog.FileName);
                DevExpress.XtraEditors.XtraMessageBox.Show($"{Path.GetExtension(saveFileDialog.FileName)} file saved successfully!", "Success", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
        }
        private void simpleButton1_Click(object sender, EventArgs e)
        {
            SaveGridData("Excel Files|*.xlsx", "Save Excel File", fileName => gridView1.ExportToXlsx(fileName));
        }
    }
}
