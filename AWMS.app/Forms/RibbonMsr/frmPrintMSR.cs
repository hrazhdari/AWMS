using AWMS.app.Forms.RibbonUser;
using AWMS.dapper.Repositories;
using AWMS.dto;
using DevExpress.XtraEditors;
using DevExpress.XtraReports.UI;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace AWMS.app.Forms.RibbonMsr
{
    public partial class frmPrintMSR : DevExpress.XtraEditors.XtraForm
    {
        private readonly IServiceProvider _serviceProvider;
        private readonly UserSession _session; // اضافه کردن UserSession
        public frmPrintMSR(IServiceProvider serviceProvider, int? userId = null)
        {
            InitializeComponent();
            _serviceProvider = serviceProvider;
            int finalUserId = userId ?? 1;
            _session = SessionManager.GetSession(finalUserId);
            LoadMSRNOData();
        }

        private void frmPlChecking_Load(object sender, EventArgs e)
        {
            simpleButton1.Focus();
        }
        private async void LoadMSRNOData()
        {
            try
            {
                var MSRData = await _serviceProvider.GetService<IInspectionDapperRepository>()!.GetAllMsrNoAsync();

                lookUpEdit1.Properties.DataSource = MSRData;

                // تنظیم NullText برای نمایش مقدار پیش‌فرض
                lookUpEdit1.Properties.NullText = "Please Select MSR ...";
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Failed to load MSR NO data: {ex.Message}", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void simpleButton1_Click(object sender, EventArgs e)
        {
            LoadMSRNOData();
        }
        private async void lookUpEdit1_EditValueChanged(object sender, EventArgs e)
        {
            var selectedValue = lookUpEdit1.EditValue;

            if (selectedValue != null && int.TryParse(selectedValue.ToString(), out int plId))
            {
                try
                {
                    // بارگذاری داده‌های هدر و جزئیات به صورت غیر همزمان
                    var MsrHeaderDetails = await _serviceProvider
                        .GetService<IInspectionDapperRepository>()!
                        .GetMsrHeaderDetailsPLIdAsync(plId);

                    var MsrDetailDetails = await _serviceProvider
                        .GetService<IInspectionDapperRepository>()!
                        .GetMsrDetailDetailsByPLIdAsync(plId);

                    if (MsrHeaderDetails == null || !MsrHeaderDetails.Any())
                    {
                        MessageBox.Show("No data found for the selected MSR.", "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                        return;
                    }

                    // بارگذاری و نمایش گزارش
                    LoadReportFromRepx("ReportMSRPrint.repx", MsrHeaderDetails, MsrDetailDetails);
                }
                catch (Exception ex)
                {
                    MessageBox.Show($"Failed to fetch packing list details: {ex.Message}", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
            else
            {
                MessageBox.Show("Invalid selection. Please select a valid Packing List.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
        }


        private void BindReportLabelData(XtraReport report, string controlName, string dataMember)
        {
            XRTableCell? label = report.FindControl(controlName, true) as XRTableCell;
            if (label != null)
            {
                label.DataBindings.Add("Text", null, dataMember);
            }
        }

        private void LoadReportFromRepx(string reportFileName, List<MsrHeaderDetailsDto> requestData, List<MsrDetailDetailsDto> MsrDetailDetails)
        {
            // به‌روزرسانی Remark برای رکوردهایی که ScopeName شامل "Steel" است
            foreach (var detail in MsrDetailDetails)
            {
                if (detail.ScopeName != null && detail.ScopeName.IndexOf("Steel", StringComparison.OrdinalIgnoreCase) >= 0)
                {
                    detail.Remark = $"{detail.Remark} : {detail.NetW}";
                }
            }

            XtraReport report = new XtraReport();

            string reportFilePath = System.IO.Path.Combine(Application.StartupPath, reportFileName);
            if (!System.IO.File.Exists(reportFilePath))
            {
                MessageBox.Show($"Report file not found: {reportFilePath}", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }

            report.LoadLayout(reportFilePath);

            // تنظیم منبع داده
            report.DataSource = new { RequestData = requestData, MsrDetailDetails = MsrDetailDetails };
            report.DataMember = "MsrDetailDetails"; // Sub-Band داده‌های جزئیات را استفاده خواهد کرد.

            // اتصال داده‌ها به کنترل‌های گزارش
            BindReportLabelData(report, "tableCell2", "RequestData.MSRNO");
            BindReportLabelData(report, "tableCell4", "RequestData.MSRRev");
            BindReportLabelData(report, "tableCell6", "RequestData.IVR_NO");
            BindReportLabelData(report, "tableCell8", "RequestData.VendorName");
            BindReportLabelData(report, "tableCell10", "RequestData.SupplierName");
            BindReportLabelData(report, "tableCell87", "RequestData.MSRDate");
            BindReportLabelData(report, "tableCell12", "RequestData.PLName");
            BindReportLabelData(report, "tableCell16", "RequestData.PoName");
            BindReportLabelData(report, "tableCell18", "RequestData.IrnName");
            BindReportLabelData(report, "tableCell20", "RequestData.MARDate");

            // داده‌های Sub-Band
            XRTable detailTable = report.FindControl("table3", true) as XRTable;
            if (detailTable != null)
            {
                detailTable.BeginInit();
                foreach (XRTableRow row in detailTable.Rows)
                {
                    foreach (XRTableCell cell in row.Cells)
                    {
                        if (cell.Name == "tableCell50")
                        {
                            cell.ExpressionBindings.Add(new ExpressionBinding("BeforePrint", "Text", "[PK]"));
                        }
                        else if (cell.Name == "tableCell51")
                        {
                            cell.ExpressionBindings.Add(new ExpressionBinding("BeforePrint", "Text", "[ItemOfPk]"));
                        }
                        else if (cell.Name == "tableCell52")
                        {
                            cell.ExpressionBindings.Add(new ExpressionBinding("BeforePrint", "Text", "[Tag]"));
                        }
                        else if (cell.Name == "tableCell53")
                        {
                            cell.ExpressionBindings.Add(new ExpressionBinding("BeforePrint", "Text", "[Description]"));
                        }
                        else if (cell.Name == "tableCell54")
                        {
                            cell.ExpressionBindings.Add(new ExpressionBinding("BeforePrint", "Text", "[UnitName]"));
                        }
                        else if (cell.Name == "tableCell55")
                        {
                            cell.ExpressionBindings.Add(new ExpressionBinding("BeforePrint", "Text", "[Qty]"));
                        }
                        else if (cell.Name == "tableCell56")
                        {
                            cell.ExpressionBindings.Add(new ExpressionBinding("BeforePrint", "Text", "[QtyRec]"));
                        }
                        else if (cell.Name == "tableCell57")
                        {
                            cell.ExpressionBindings.Add(new ExpressionBinding("BeforePrint", "Text", "[ShortageQty]"));
                        }
                        else if (cell.Name == "tableCell58")
                        {
                            cell.ExpressionBindings.Add(new ExpressionBinding("BeforePrint", "Text", "[OverQty]"));
                        }
                        else if (cell.Name == "tableCell59")
                        {
                            cell.ExpressionBindings.Add(new ExpressionBinding("BeforePrint", "Text", "[DamageQty]"));
                        }
                        else if (cell.Name == "tableCell68")
                        {
                            cell.ExpressionBindings.Add(new ExpressionBinding("BeforePrint", "Text", "[RejectQty]"));
                        }
                        else if (cell.Name == "tableCell60")
                        {
                            cell.ExpressionBindings.Add(new ExpressionBinding("BeforePrint", "Text", "[LocationName]"));
                        }
                        else if (cell.Name == "tableCell61")
                        {
                            cell.ExpressionBindings.Add(new ExpressionBinding("BeforePrint", "Text", "[Remark]"));
                        }
                    }
                }
                detailTable.EndInit();
            }

            // نمایش گزارش
            report.CreateDocument();
            documentViewer1.DocumentSource = report;
            documentViewer1.Refresh();
        }
    }
}