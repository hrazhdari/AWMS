using AWMS.app.Forms.RibbonUser;
using AWMS.dapper.Repositories;
using DevExpress.XtraEditors;
using DevExpress.XtraEditors.Repository;
using System.Data;
using static AWMS.dapper.ApproveDapperRepository;
using Microsoft.Extensions.DependencyInjection;

namespace AWMS.app.Forms.RibbonVoucher
{
    public partial class frmUpdateMrv : XtraForm
    {

        private readonly IServiceProvider _serviceProvider;
        private readonly UserSession _session; // اضافه کردن UserSession
        public frmUpdateMrv(IServiceProvider serviceProvider, int? userId = null)
        {
            InitializeComponent();
            _serviceProvider = serviceProvider;
            // اگر UserId پاس داده نشده بود، مقدار پیش‌فرض 1 استفاده می‌شود
            int finalUserId = userId ?? 1;
            _session = SessionManager.GetSession(finalUserId);
            loadEditLookupMRV();
        }
        private async void loadEditLookupMRV()
        {
            try
            {
                var requestNos = await _serviceProvider.GetService<IMrvDapperRepository>()!.GetMrvsAsync();

                // تنظیم DataSource برای LookUpEdit
                lookUpEdit1.Properties.DataSource = requestNos.Select(r => new { RequestNO = r }).ToList(); // تبدیل به یک لیست از آبجکت‌های ناشناس
                lookUpEdit1.Properties.DisplayMember = "RequestNO"; // مشخص کردن ستون برای نمایش
                lookUpEdit1.Properties.ValueMember = "RequestNO";   // مشخص کردن ستون برای مقدار
                lookUpEdit1.Properties.NullText = "Select MrvNO"; // تنظیم متن خالی
            }
            catch (Exception ex)
            {
                // نمایش خطا در صورت وجود
                XtraMessageBox.Show($"خطا در بارگذاری داده‌ها: {ex.Message}", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void ConfigureGridViewAppearance()
        {
            // تنظیم متن سلول‌ها به صورت وسط‌چین
            gridView1.Appearance.Row.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center;
            gridView1.Appearance.Row.TextOptions.VAlignment = DevExpress.Utils.VertAlignment.Center;

            // فعال کردن ظاهر سرستون‌ها و تنظیم پس‌زمینه و فونت
            gridView1.Appearance.HeaderPanel.Options.UseBackColor = true;
            gridView1.Appearance.HeaderPanel.Options.UseFont = true;
            gridView1.Appearance.HeaderPanel.Options.UseTextOptions = true;

            // تنظیمات برای سرستون‌ها
            gridView1.Appearance.HeaderPanel.BackColor = Color.Yellow;    // پس‌زمینه زرد
            gridView1.Appearance.HeaderPanel.Font = new Font(gridView1.Appearance.HeaderPanel.Font, FontStyle.Bold);  // متن بولد
            gridView1.Appearance.HeaderPanel.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center; // وسط‌چین افقی
            gridView1.Appearance.HeaderPanel.TextOptions.VAlignment = DevExpress.Utils.VertAlignment.Center; // وسط‌چین عمودی

            // تنظیمات رنگ‌های سلول‌های خاص
            gridView1.RowCellStyle += gridView1_RowCellStyle;

            // غیرقابل ویرایش کردن همه ستون‌ها
            foreach (DevExpress.XtraGrid.Columns.GridColumn column in gridView1.Columns)
            {
                column.OptionsColumn.AllowEdit = false;
            }

            // تنظیم ستون‌های خاص برای ویرایش
            gridView1.Columns["DelMrvQty"].OptionsColumn.AllowEdit = true;

            // تعریف ویرایشگر عددی برای ستون‌های خاص
            RepositoryItemTextEdit numericEditor = new RepositoryItemTextEdit();
            numericEditor.Mask.MaskType = DevExpress.XtraEditors.Mask.MaskType.Numeric;
            numericEditor.Mask.EditMask = "d"; // فقط اعداد صحیح
            numericEditor.Mask.UseMaskAsDisplayFormat = true;

            // اختصاص ویرایشگر به ستون‌های خاص
            gridControl1.RepositoryItems.Add(numericEditor);
            gridView1.Columns["ReqMrvQty"].ColumnEdit = numericEditor;
            gridView1.Columns["DelMrvQty"].ColumnEdit = numericEditor;
            gridView1.Columns["DelMrvRejQty"].ColumnEdit = numericEditor;
        }


        // رویداد برای تغییر رنگ فیلدهای خاص
        private void gridView1_RowCellStyle(object sender, DevExpress.XtraGrid.Views.Grid.RowCellStyleEventArgs e)
        {
            // شرط برای ستون ReserveQty که رنگ آبی داشته باشد
            if (e.Column.FieldName == "ReqMrvQty")
            {
                e.Appearance.BackColor = Color.Blue;
                e.Appearance.ForeColor = Color.White; // رنگ متن سفید برای خوانایی بهتر
            }

            // شرط برای ستون DelQty که رنگ نارنجی داشته باشد
            if (e.Column.FieldName == "DelMrvQty")
            {
                e.Appearance.BackColor = Color.Orange;
                e.Appearance.ForeColor = Color.Black; // رنگ متن مشکی برای خوانایی بهتر
            }
            // شرط برای ستون DelQty که رنگ نارنجی داشته باشد
            if (e.Column.FieldName == "DelMrvRejQty")
            {
                e.Appearance.BackColor = Color.Indigo;
                e.Appearance.ForeColor = Color.White; // رنگ متن مشکی برای خوانایی بهتر
            }

            if (e.Column.FieldName == "RemarkLocitemID")
            {
                e.Appearance.BackColor = Color.BlueViolet;
                e.Appearance.ForeColor = Color.White; // رنگ متن مشکی برای خوانایی بهتر
            }
            if (e.Column.FieldName == "LocationName")
            {
                e.Appearance.BackColor = Color.BlueViolet;
                e.Appearance.ForeColor = Color.White; // رنگ متن مشکی برای خوانایی بهتر
            }
        }

        private async void btnShowMiv_Click(object sender, EventArgs e)
        {
            try
            {
                var selectedRequestNo = lookUpEdit1.EditValue?.ToString();

                if (string.IsNullOrEmpty(selectedRequestNo))
                {
                    MessageBox.Show("Please select a MRV.NO.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return;
                }

                var dataTable = await _serviceProvider.GetService<IMrvDapperRepository>()!.GetMrvByMrvNoAsync(selectedRequestNo);

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
            //try
            //{
            //    await _approveDapperRepository.UpdateMivRequestsBulkAsync(updateDataList, _session.UserID);
            //    MessageBox.Show("داده‌ها با موفقیت به‌روزرسانی شدند.", "اطلاع", MessageBoxButtons.OK, MessageBoxIcon.Information);

            //    // پس از موفقیت، GridView را خالی کنید
            //    gridControl1.DataSource = null;

            //    // رفرش کردن LookUpEdit
            //    loadEditLookupMIV();
            //}
            //catch (Exception ex)
            //{
            //    MessageBox.Show($"خطا در هنگام به‌روزرسانی داده‌ها: {ex.Message}", "خطا", MessageBoxButtons.OK, MessageBoxIcon.Error);
            //}
        }
      
        private async void lookUpEdit1_EditValueChanged(object sender, EventArgs e)
        {
            try
            {
                if (lookUpEdit1.EditValue == null)
                {
                    MessageBox.Show("Please select a valid MRV.", "Validation Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
                var requestNos = await _serviceProvider.GetService<IMrvDapperRepository>()!.GetMrvsInfoAsync((lookUpEdit1.EditValue)?.ToString());
                // فرض کنیم requestNos شامل یک شیء یا لیستی از نتایج است
                if (requestNos != null)
                {
                    // نمایش یکی از خصوصیات مثلا CompanyName در labelControl5
                    labelControl5.Text = requestNos.CompanyName; // یا هر فیلد دیگری که لازم دارید
                    labelControl6.Text = requestNos.MRVNO; // یا هر فیلد دیگری که لازم دارید
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
