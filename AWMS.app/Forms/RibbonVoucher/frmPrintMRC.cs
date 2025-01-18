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
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace AWMS.app.Forms.RibbonVoucher
{
    public partial class frmPrintMRC : DevExpress.XtraEditors.XtraForm
    {
        public string MrcText { get; set; }
        private readonly IServiceProvider _serviceProvider;
        private readonly UserSession _session;

        public frmPrintMRC(IServiceProvider serviceProvider, string mrcText, int? userId = null)
        {
            InitializeComponent();
            _serviceProvider = serviceProvider;
            int finalUserId = userId ?? 1;
            _session = SessionManager.GetSession(finalUserId);

            MrcText = mrcText;
            LoadMRCData();
        }

        private async Task<string?> LoadCompanyDetails(string mrcText)
        {
            try
            {
                var toCompany = await _serviceProvider
                    .GetService<IMrcDapperRepository>()!
                    .GetMRCReqCompanyAsync(mrcText);

                if (!string.IsNullOrEmpty(toCompany))
                {
                    //MessageBox.Show($"Company Name: {toCompany}", "Company Details", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
                else
                {
                    MessageBox.Show("No company found for this MRC.", "Company Details", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                }

                return toCompany;
            }
            catch (Exception ex)
            {
                MessageBox.Show($"An error occurred: {ex.Message}", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return null;
            }
        }

        private async void LoadMRCData()
        {
            if (!string.IsNullOrEmpty(MrcText))
            {
                try
                {
                    // Load header details
                    var MRCHeaderDetails = await LoadCompanyDetails(MrcText);
                    if (string.IsNullOrEmpty(MRCHeaderDetails))
                    {
                        MessageBox.Show("Company details could not be retrieved.", "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                        return;
                    }

                    // Load detail data
                    var MRCDetailDetails = await _serviceProvider
                        .GetService<IMrcDapperRepository>()!
                        .GetMRCDetailDetailsAsync(MrcText);

                    if (!MRCDetailDetails.Any())
                    {
                        MessageBox.Show("No data found for the selected Packing List.", "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                        return;
                    }
                    var reportData = new MRCReportData
                    {
                        MrcText = MrcText,
                        MRCHeaderDetails = MRCHeaderDetails,
                        MRCHeaderDate = DateTime.Now
                    };
                    // Load and display report
                    LoadReportFromRepx("ReportMRC.repx", reportData, MRCDetailDetails);
                }
                catch (Exception ex)
                {
                    MessageBox.Show($"Failed to fetch MRC details: {ex.Message}", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
            else
            {
                MessageBox.Show("Invalid selection. Please select a valid MRC.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Warning);
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
        private void LoadReportFromRepx(string reportFileName, MRCReportData requestData, IEnumerable<AllMRCDto> MRCDetailDetails)
        {
            XtraReport report = new XtraReport();

            string reportFilePath = System.IO.Path.Combine(Application.StartupPath, reportFileName);
            if (!System.IO.File.Exists(reportFilePath))
            {
                MessageBox.Show($"Report file not found: {reportFilePath}", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }

            report.LoadLayout(reportFilePath);
            //    // تبدیل IEnumerable<AllMRCDto> به List<AllMRCDto>
            List<AllMRCDto> MRCDetailDetailsList = MRCDetailDetails.ToList();
            // تنظیم منبع داده
            report.DataSource = new { RequestData = requestData, PackingListDetails = MRCDetailDetailsList };
            report.DataMember = "PackingListDetails"; // Sub-Band داده‌های جزئیات را استفاده خواهد کرد.

            // اتصال داده‌ها به کنترل‌های گزارش
            BindReportLabelData(report, "tableCell28", "RequestData.MrcText");
            BindReportLabelData(report, "tableCell32", "RequestData.MRCHeaderDetails");
            BindReportLabelData(report, "tableCell33", "RequestData.MRCHeaderDate");


            // داده‌های Sub-Band
            XRTable detailTable = report.FindControl("table2", true) as XRTable;
            if (detailTable != null)
            {
                detailTable.BeginInit();
                foreach (XRTableRow row in detailTable.Rows)
                {
                    foreach (XRTableCell cell in row.Cells)
                    {
                        if (cell.Name == "lblPk")
                        {
                            cell.ExpressionBindings.Add(new ExpressionBinding("BeforePrint", "Text", "[PK]"));
                        }
                        else if (cell.Name == "lblItem")
                        {
                            cell.ExpressionBindings.Add(new ExpressionBinding("BeforePrint", "Text", "[ItemOfPk]"));
                        }
                        else if (cell.Name == "tableCell7")
                        {
                            cell.ExpressionBindings.Add(new ExpressionBinding("BeforePrint", "Text", "[Tag]"));
                        }
                        else if (cell.Name == "lblDescription")
                        {
                            cell.ExpressionBindings.Add(new ExpressionBinding("BeforePrint", "Text", "[Description]"));
                        }
                        else if (cell.Name == "lblUnit")
                        {
                            cell.ExpressionBindings.Add(new ExpressionBinding("BeforePrint", "Text", "[Unit]"));
                        }
                        else if (cell.Name == "lblReqQty")
                        {
                            cell.ExpressionBindings.Add(new ExpressionBinding("BeforePrint", "Text", "[Qty]"));
                        }
                        else if (cell.Name == "lblsize1")
                        {
                            cell.ExpressionBindings.Add(new ExpressionBinding("BeforePrint", "Text", "[Size1]"));
                        }
                        else if (cell.Name == "lblsize2")
                        {
                            cell.ExpressionBindings.Add(new ExpressionBinding("BeforePrint", "Text", "[Size2]"));
                        }
                        else if (cell.Name == "lblbatchno")
                        {
                            cell.ExpressionBindings.Add(new ExpressionBinding("BeforePrint", "Text", "[BatchNo]"));
                        }
                        else if (cell.Name == "lbldoc")
                        {
                            cell.ExpressionBindings.Add(new ExpressionBinding("BeforePrint", "Text", "[DocNo]"));
                        }
                        else if (cell.Name == "lblremark")
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
    public class MRCReportData
    {
        public string MrcText { get; set; }
        public string MRCHeaderDetails { get; set; }
        public DateTime MRCHeaderDate { get; set; }
        
    }

}
