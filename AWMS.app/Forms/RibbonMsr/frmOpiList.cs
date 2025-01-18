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
    public partial class frmOpiList : DevExpress.XtraEditors.XtraForm
    {
        private readonly IServiceProvider _serviceProvider;
        private readonly UserSession _session; // اضافه کردن UserSession
        public frmOpiList(IServiceProvider serviceProvider, int? userId = null)
        {
            InitializeComponent();
            _serviceProvider = serviceProvider;
            int finalUserId = userId ?? 1;
            _session = SessionManager.GetSession(finalUserId);
            LoadPackingListData();
        }

        private async void LoadPackingListData()
        {
            try
            {
                var packingListData = await _serviceProvider.GetService<IPackingListDapperRepository>()!.GetAllPackingListNamesAsync();

                lookUpEdit1.Properties.DataSource = packingListData;

                // تنظیم NullText برای نمایش مقدار پیش‌فرض
                lookUpEdit1.Properties.NullText = "Please Select PackingList ...";
                simpleButton1.Focus();
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Failed to load packing list data: {ex.Message}", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void simpleButton1_Click(object sender, EventArgs e)
        {
            LoadPackingListData();
        }
        private async void lookUpEdit1_EditValueChanged(object sender, EventArgs e)
        {
            var selectedValue = lookUpEdit1.EditValue;

            if (selectedValue != null && int.TryParse(selectedValue.ToString(), out int plId))
            {
                try
                {
                    // بارگذاری داده‌های هدر و جزئیات به صورت غیر همزمان
                    var packingListHeaderDetails = await _serviceProvider
                        .GetService<IPackingListDapperRepository>()!
                        .GetPackingListHeaderDetailsByPLIdAsync(plId);

                    var packingListDetailDetails = await _serviceProvider
                        .GetService<IPackingListDapperRepository>()!
                        .GetPackingListDetailDetailsByPLIdAsync(plId);

                    if (packingListHeaderDetails == null || !packingListHeaderDetails.Any())
                    {
                        MessageBox.Show("No data found for the selected Packing List.", "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                        return;
                    }

                    // بارگذاری و نمایش گزارش
                    LoadReportFromRepx("ReportOpiList.repx", packingListHeaderDetails, packingListDetailDetails);
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

        //private void LoadReportFromRepx(string reportFileName, List<PLcheckingHeaderDetailDto> requestData, List<PLcheckingDetailDetailDto> packingListDetailDetails)
        //{
        //    XtraReport report = new XtraReport();

        //    string reportFilePath = System.IO.Path.Combine(Application.StartupPath, reportFileName);
        //    if (!System.IO.File.Exists(reportFilePath))
        //    {
        //        MessageBox.Show($"Report file not found: {reportFilePath}", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
        //        return;
        //    }

        //    report.LoadLayout(reportFilePath);

        //    // تنظیم دو منبع داده
        //    report.DataSource = new { RequestData = requestData, PackingListDetails = packingListDetailDetails };

        //    // حالا می‌توانید از هر دو مجموعه داده در فیلدهای گزارش استفاده کنید.
        //    BindReportLabelData(report, "lblpl", "RequestData.PLName");
        //    BindReportLabelData(report, "lblsupplier", "RequestData.SupplierName");
        //    BindReportLabelData(report, "lblmr", "RequestData.MrName");
        //    BindReportLabelData(report, "lblnetw", "RequestData.NetW");
        //    BindReportLabelData(report, "label2", "RequestData.MARDate");
        //    BindReportLabelData(report, "lblenteredby", "RequestData.Username");
        //    BindReportLabelData(report, "lblvendor", "RequestData.VendorName");
        //    BindReportLabelData(report, "lblpono", "RequestData.PoName");
        //    BindReportLabelData(report, "lblgrossw", "RequestData.GrossW");
        //    BindReportLabelData(report, "label7", "RequestData.AreaUnitName");
        //    BindReportLabelData(report, "lblarchiveno", "RequestData.ArchiveNO");
        //    BindReportLabelData(report, "lblirnno", "RequestData.IrnName");

        //    // به عنوان مثال، می‌توانید جزئیات از packingListDetailDetails را نیز در گزارش نمایش دهید
        //    // فرض کنید که برخی فیلدها از packingListDetailDetails استفاده می‌کنند
        //    //BindReportLabelData(report, "lblPackingListDetailField", "PackingListDetails.SomeField");

        //    report.CreateDocument();
        //    documentViewer1.DocumentSource = report;
        //    documentViewer1.Refresh();
        //}

        private void LoadReportFromRepx(string reportFileName, List<PLcheckingHeaderDetailDto> requestData, List<PLcheckingDetailDetailDto> packingListDetailDetails)
        {
            XtraReport report = new XtraReport();

            string reportFilePath = System.IO.Path.Combine(Application.StartupPath, reportFileName);
            if (!System.IO.File.Exists(reportFilePath))
            {
                MessageBox.Show($"Report file not found: {reportFilePath}", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }

            report.LoadLayout(reportFilePath);

            // تنظیم منبع داده
            report.DataSource = new { RequestData = requestData, PackingListDetails = packingListDetailDetails };
            report.DataMember = "PackingListDetails"; // Sub-Band داده‌های جزئیات را استفاده خواهد کرد.

            // اتصال داده‌ها به کنترل‌های گزارش
            BindReportLabelData(report, "tableCell2", "RequestData.PLName");
            BindReportLabelData(report, "tableCell4", "RequestData.VendorName");
            BindReportLabelData(report, "tableCell6", "RequestData.PoName");
            BindReportLabelData(report, "tableCell8", "RequestData.IrnName");

            //int rowe = 1;
            // داده‌های Sub-Band
            XRTable detailTable = report.FindControl("table3", true) as XRTable;
            if (detailTable != null)
            {
                detailTable.BeginInit();
                foreach (XRTableRow row in detailTable.Rows)
                {
                    foreach (XRTableCell cell in row.Cells)
                    {
                        //if (cell.Name == "tableCell24")
                        //{
                        //    cell.ExpressionBindings.Add(new ExpressionBinding("BeforePrint", "Text", $"{rowe}"));
                        //}
                        //else
                        if (cell.Name == "tableCell25")
                        {
                            cell.ExpressionBindings.Add(new ExpressionBinding("BeforePrint", "Text", "[Tag]"));
                        }
                        else if (cell.Name == "tableCell26")
                        {
                            cell.ExpressionBindings.Add(new ExpressionBinding("BeforePrint", "Text", "[PK]"));
                        }
                        else if (cell.Name == "tableCell27")
                        {
                            cell.ExpressionBindings.Add(new ExpressionBinding("BeforePrint", "Text", "[Description]"));
                        }
                        else if (cell.Name == "tableCell28")
                        {
                            cell.ExpressionBindings.Add(new ExpressionBinding("BeforePrint", "Text", "[UnitName]"));
                        }
                        else if (cell.Name == "tableCell29")
                        {
                            cell.ExpressionBindings.Add(new ExpressionBinding("BeforePrint", "Text", "[Qty]"));
                        }
                        else if (cell.Name == "tableCell30")
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