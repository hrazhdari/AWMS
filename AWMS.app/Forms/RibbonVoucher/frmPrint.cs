using AWMS.dapper.Repositories;
using DevExpress.XtraEditors;
using DevExpress.XtraReports.UI;
using System.Data;

namespace AWMS.app.Forms.RibbonVoucher
{
    public partial class frmPrint : XtraForm
    {
        private readonly IRequestDapperRepository _requestDapperRepository;
        public frmPrint(IRequestDapperRepository requestDapperRepository)
        {
            InitializeComponent();
            _requestDapperRepository = requestDapperRepository;
        }
        private async void simpleButton1_Click(object sender, EventArgs e)
        {
            // بررسی اینکه آیا فیلد textEdit1 خالی نیست
            if (!string.IsNullOrWhiteSpace(textEdit1.Text))
            {
                // گرفتن شماره MIV از textEdit1
                string mivNumber = textEdit1.Text.Trim();

                // بررسی وضعیت ToggleSwitch برای بارگذاری گزارش مناسب
                if (toggleSwitch1.IsOn)
                {
                    var requestData = await _requestDapperRepository.GetDataFromDatabaseREARAsync(mivNumber);
                    // بارگذاری گزارش برای عقب
                    LoadReportFromRepx("ReportBackMiv.repx", requestData, mivNumber);
                }
                else
                {
                    var requestData = await _requestDapperRepository.GetDataFromDatabaseAsync(mivNumber);
                    // بارگذاری گزارش برای جلو
                    LoadReportFromRepx("ReportFrontMiv.repx", requestData, mivNumber);
                }
            }
            else
            {
                // نمایش پیام اگر textEdit1 خالی باشد
                MessageBox.Show("Please enter a valid MIV number.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
        private async void LoadReportFromRepx(string reportFileName, DataTable requestData, string mivNumber)
        {
            // ایجاد یک شیء XtraReport
            XtraReport report = new XtraReport();

            // مسیر فایل گزارش در پوشه AWMS.report
            string reportFilePath = System.IO.Path.Combine(Application.StartupPath, reportFileName);

            // بررسی وجود فایل
            if (!System.IO.File.Exists(reportFilePath))
            {
                MessageBox.Show($"Report file not found: {reportFilePath}", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }

            // بارگذاری طرح گزارش از فایل .repx
            report.LoadLayout(reportFilePath);

            // تنظیم پارامتر MivNumber
            if (report.Parameters["MivNumber"] != null)
            {
                report.Parameters["MivNumber"].Value = mivNumber;
                report.Parameters["MivNumber"].Visible = false;
            }

            // تنظیم داده‌های گزارش
            report.DataSource = requestData;


            // ایجاد یک فیلد محاسباتی برای شماره ردیف
            DevExpress.XtraReports.UI.CalculatedField rowNumberField = new DevExpress.XtraReports.UI.CalculatedField();
            rowNumberField.Name = "RowNumber";
            rowNumberField.Expression = "[DataSource.CurrentRowIndex] + 1";
            report.CalculatedFields.Add(rowNumberField);
            XRLabel rowNumberLabel = report.FindControl("lblRow", true) as XRLabel;
            if (rowNumberLabel != null)
            {
                rowNumberLabel.DataBindings.Add("Text", null, "RowNumber");
            }

            // اتصال فیلدهای گزارش به داده‌های DataSource
            XRLabel labelRequestNO = report.FindControl("lblRequestNO", true) as XRLabel;
            if (labelRequestNO != null)
            {
                labelRequestNO.DataBindings.Add("Text", null, "RequestNO");
            }
            XRLabel labelPLName = report.FindControl("lblPl", true) as XRLabel;
            if (labelPLName != null)
            {
                labelPLName.DataBindings.Add("Text", null, "PLName");
            }
            XRLabel labelPK = report.FindControl("lblPk", true) as XRLabel;
            if (labelPK != null)
            {
                labelPK.DataBindings.Add("Text", null, "PK");
            }
            XRLabel labelItemOfPk = report.FindControl("lblItem", true) as XRLabel;
            if (labelItemOfPk != null)
            {
                labelItemOfPk.DataBindings.Add("Text", null, "ItemOfPk");
            }
            XRLabel labelTag = report.FindControl("lblTag", true) as XRLabel;
            if (labelTag != null)
            {
                labelTag.DataBindings.Add("Text", null, "Tag");
            }
            XRLabel labelDescription = report.FindControl("lblDescription", true) as XRLabel;
            if (labelDescription != null)
            {
                labelDescription.DataBindings.Add("Text", null, "Description");
            }
            XRLabel labelUnitName = report.FindControl("lblUnit", true) as XRLabel;
            if (labelUnitName != null)
            {
                labelUnitName.DataBindings.Add("Text", null, "UnitName");
            }
            XRLabel labelReqMivQty = report.FindControl("lblReqQty", true) as XRLabel;
            if (labelReqMivQty != null)
            {
                labelReqMivQty.DataBindings.Add("Text", null, "ReqMivQty");
            }
            XRLabel labelRemark = report.FindControl("lblRemark", true) as XRLabel;
            if (labelRemark != null)
            {
                labelRemark.DataBindings.Add("Text", null, "Remark");
            }
            XRLabel labellblWarehouse = report.FindControl("lblWarehouse", true) as XRLabel;
            if (labellblWarehouse != null)
            {
                labellblWarehouse.DataBindings.Add("Text", null, "TypeID");
            }
            XRLabel labellblCompany = report.FindControl("lblCompany", true) as XRLabel;
            if (labellblCompany != null)
            {
                labellblCompany.DataBindings.Add("Text", null, "CompanyName");
            }
            XRLabel labelMRCNO = report.FindControl("lblMrc", true) as XRLabel;
            if (labelMRCNO != null)
            {
                labelMRCNO.DataBindings.Add("Text", null, "MRCNO");
            }

            //XRLabel labellblDate = report.FindControl("lblDate", true) as XRLabel;
            //if (labellblDate != null)
            //{
            //    // تنظیم فرمت نمایش فقط برای تاریخ (بدون ساعت)
            //    labellblDate.DataBindings.Add("Text", null, "ReqDate", "{0:yyyy/MM/dd}");
            //}
            XRLabel labellblDate = report.FindControl("lblDate", true) as XRLabel;
            if (labellblDate != null)
            {
                labellblDate.DataBindings.Add("Text", null, "ReqDate", "{0:yyyy/MM/dd}");
            }

            if (toggleSwitch1.IsOn)
            {
                XRLabel labellblDate2 = report.FindControl("lblDate2", true) as XRLabel;
                if (labellblDate2 != null)
                {
                    // تنظیم فرمت نمایش فقط برای تاریخ (بدون ساعت)
                    labellblDate2.DataBindings.Add("Text", null, "ReqDate", "{0:yyyy/MM/dd}");
                }
                XRLabel labelUsername = report.FindControl("lblUser", true) as XRLabel;
                if (labelUsername != null)
                {
                    // تنظیم فرمت نمایش فقط برای تاریخ (بدون ساعت)
                    labelUsername.DataBindings.Add("Text", null, "Username");
                }

                XRLabel labelLocation = report.FindControl("lblLocation", true) as XRLabel;
                if (labelLocation != null)
                {
                    // تنظیم فرمت نمایش فقط برای تاریخ (بدون ساعت)
                    labelLocation.DataBindings.Add("Text", null, "LocationName");
                }
            }
            if (toggleSwitch2.IsOn)
            {
                XRLabel labelDelQty = report.FindControl("lblDelQty", true) as XRLabel;
                if (labelDelQty != null)
                {
                    // تنظیم فرمت نمایش فقط برای تاریخ (بدون ساعت)
                    labelDelQty.DataBindings.Add("Text", null, "ReqMivQty");
                }
            }

            // ایجاد سند گزارش
            report.CreateDocument();

            // نمایش گزارش در documentViewer1
            documentViewer1.DocumentSource = report;
            documentViewer1.Refresh();
        }
    }
}
