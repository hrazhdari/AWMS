using AWMS.app.Forms.RibbonUser;
using AWMS.dapper;
using AWMS.dapper.Repositories;
using DevExpress.XtraEditors;
using DevExpress.XtraEditors.Repository;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using static AWMS.dapper.ApproveDapperRepository;

namespace AWMS.app.Forms.RibbonVoucher
{
    public partial class frmApprove : XtraForm
    {
        private readonly IServiceProvider _serviceProvider;
        private readonly IApproveDapperRepository _approveDapperRepository;
        private readonly UserSession _session; // اضافه کردن UserSession
        public frmApprove(IServiceProvider serviceProvider, IApproveDapperRepository approveDapperRepository, int? userId = null)
        {
            InitializeComponent();
            _serviceProvider = serviceProvider;
            int finalUserId = userId ?? 1;
            _session = SessionManager.GetSession(finalUserId);
            _approveDapperRepository = approveDapperRepository;
            loadEditLookupMIV();
        }

        private async void loadEditLookupMIV()
        {
            try
            {
                // فراخوانی متد GetNotApprovedMivsAsync از repository
                var requestNos = await _approveDapperRepository.GetNotApprovedMivsAsync();

                // تنظیم DataSource برای LookUpEdit
                lookUpEdit1.Properties.DataSource = requestNos.Select(r => new { RequestNO = r }).ToList(); // تبدیل به یک لیست از آبجکت‌های ناشناس
                lookUpEdit1.Properties.DisplayMember = "RequestNO"; // مشخص کردن ستون برای نمایش
                lookUpEdit1.Properties.ValueMember = "RequestNO";   // مشخص کردن ستون برای مقدار
                lookUpEdit1.Properties.NullText = "Select RequestNO"; // تنظیم متن خالی
            }
            catch (Exception ex)
            {
                // نمایش خطا در صورت وجود
                XtraMessageBox.Show($"خطا در بارگذاری داده‌ها: {ex.Message}", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void ConfigureGridViewAppearance()
        {
            // وسط‌چین کردن متن‌ها در سلول‌ها به صورت افقی و عمودی
            gridView1.Appearance.Row.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center;
            gridView1.Appearance.Row.TextOptions.VAlignment = DevExpress.Utils.VertAlignment.Center;

            // اضافه کردن رویداد برای اعمال رنگ‌ها
            gridView1.RowCellStyle += gridView1_RowCellStyle;

            // غیرقابل ویرایش کردن همه ستون‌ها
            foreach (DevExpress.XtraGrid.Columns.GridColumn column in gridView1.Columns)
            {
                column.OptionsColumn.AllowEdit = false;
            }

            // فقط ستون DelMivQty قابل ویرایش باشد
            gridView1.Columns["DelMivQty"].OptionsColumn.AllowEdit = true;

            // تعریف RepositoryItemTextEdit برای محدود کردن ورودی به اعداد
            RepositoryItemTextEdit numericEditor = new RepositoryItemTextEdit();
            numericEditor.Mask.MaskType = DevExpress.XtraEditors.Mask.MaskType.Numeric;
            numericEditor.Mask.EditMask = "d"; // فقط اعداد صحیح
            numericEditor.Mask.UseMaskAsDisplayFormat = true;

            // اختصاص دادن این ویرایشگر به ستون DelMivQty
            gridControl1.RepositoryItems.Add(numericEditor);
            gridView1.Columns["DelMivQty"].ColumnEdit = numericEditor;
        }

        // رویداد برای تغییر رنگ فیلدهای خاص
        private void gridView1_RowCellStyle(object sender, DevExpress.XtraGrid.Views.Grid.RowCellStyleEventArgs e)
        {
            // شرط برای ستون ReserveQty که رنگ آبی داشته باشد
            if (e.Column.FieldName == "ReserveMivQty")
            {
                e.Appearance.BackColor = Color.Blue;
                e.Appearance.ForeColor = Color.White; // رنگ متن سفید برای خوانایی بهتر
            }

            // شرط برای ستون DelQty که رنگ نارنجی داشته باشد
            if (e.Column.FieldName == "DelMivQty")
            {
                e.Appearance.BackColor = Color.Orange;
                e.Appearance.ForeColor = Color.Black; // رنگ متن مشکی برای خوانایی بهتر
            }
        }

        private async void btnShowMiv_Click(object sender, EventArgs e)
        {
            try
            {
                var selectedRequestNo = lookUpEdit1.EditValue?.ToString();

                if (string.IsNullOrEmpty(selectedRequestNo))
                {
                    MessageBox.Show("Please select a RequestNO.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return;
                }

                var dataTable = await _approveDapperRepository.GetMivByRequestNoAsync(selectedRequestNo);

                // تنظیم داده‌ها برای GridControl
                gridView1.Columns.Clear();
                gridControl1.DataSource = dataTable;
                gridView1.BestFitColumns();

                // اعمال تنظیمات ظاهری برای GridView
                ConfigureGridViewAppearance();
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Error fetching data: {ex.Message}", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void btnZeroAll_Click(object sender, EventArgs e)
        {
            // شروع حلقه روی تمام ردیف‌ها
            for (int i = 0; i < gridView1.RowCount; i++)
            {
                // چک کردن اینکه آیا ردیف معتبر است
                if (!gridView1.IsDataRow(i))
                    continue;

                // تنظیم مقدار صفر برای DelMivQty
                gridView1.SetRowCellValue(i, "DelMivQty", 0);
            }
        }

        private void btnFillAll_Click(object sender, EventArgs e)
        {
            // شروع حلقه روی تمام ردیف‌ها
            for (int i = 0; i < gridView1.RowCount; i++)
            {
                // چک کردن اینکه آیا ردیف معتبر است
                if (!gridView1.IsDataRow(i))
                    continue;

                // گرفتن مقدار ReserveMivQty از ستون مرتبط
                var reserveQty = gridView1.GetRowCellValue(i, "ReserveMivQty");

                // کپی کردن مقدار ReserveMivQty به DelMivQty
                gridView1.SetRowCellValue(i, "DelMivQty", reserveQty);
            }
        }

        private async void btnAprrove_Click(object sender, EventArgs e)
        {
            // ایجاد لیست برای ذخیره اطلاعاتی که قرار است آپدیت شوند
            var updateDataList = new List<MivUpdateModel>();

            // بررسی ردیف‌های GridView و پر کردن لیست
            for (int i = 0; i < gridView1.RowCount; i++)
            {
                // گرفتن مقادیر فیلدهای مربوط به ReqLocItemID و DelMivQty از GridView
                var reqLocItemID = gridView1.GetRowCellValue(i, "ReqLocItemID")?.ToString();
                var delMivQty = gridView1.GetRowCellValue(i, "DelMivQty");

                // بررسی اینکه ReqLocItemID خالی نباشد
                if (string.IsNullOrWhiteSpace(reqLocItemID))
                {
                    MessageBox.Show("فیلد ReqLocItemID خالی است. بررسی کنید.", "خطا", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return;
                }

                // بررسی اینکه DelMivQty به درستی پر شده باشد
                if (delMivQty == null || delMivQty == DBNull.Value || !decimal.TryParse(delMivQty.ToString(), out _))
                {
                    MessageBox.Show("تمامی فیلدهای DelMivQty باید پر شوند و عدد معتبر باشند.", "خطا", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return;
                }

                // اضافه کردن داده به لیست
                updateDataList.Add(new MivUpdateModel
                {
                    ReqLocItemID = reqLocItemID,
                    DelMivQty = Convert.ToDecimal(delMivQty)
                });
            }

            // اگر لیست آپدیت‌ها خالی بود، نمایش پیام خطا
            if (updateDataList.Count == 0)
            {
                MessageBox.Show("هیچ داده‌ای برای آپدیت وجود ندارد.", "خطا", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }

            // فراخوانی متد برای آپدیت داده‌ها در دیتابیس
            try
            {
                await _approveDapperRepository.UpdateMivRequestsBulkAsync(updateDataList, _session.UserID);
                MessageBox.Show("داده‌ها با موفقیت به‌روزرسانی شدند.", "اطلاع", MessageBoxButtons.OK, MessageBoxIcon.Information);

                // پس از موفقیت، GridView را خالی کنید
                gridControl1.DataSource = null;

                // رفرش کردن LookUpEdit
                loadEditLookupMIV();
            }
            catch (Exception ex)
            {
                MessageBox.Show($"خطا در هنگام به‌روزرسانی داده‌ها: {ex.Message}", "خطا", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        // متد رفرش کردن LookUpEdit
        //private async Task LoadMivNotApprovedIntoLookUpEdit()
        //{
        //    try
        //    {
        //        // دریافت داده‌ها و پر کردن LookUpEdit
        //        var notApprovedMivs = await _approveDapperRepository.GetNotApprovedMivsAsync();
        //        lookUpEdit1.Properties.DataSource = notApprovedMivs;
        //    }
        //    catch (Exception ex)
        //    {
        //        MessageBox.Show($"خطا در هنگام رفرش LookUpEdit: {ex.Message}", "خطا", MessageBoxButtons.OK, MessageBoxIcon.Error);
        //    }
        //}

    }
}
