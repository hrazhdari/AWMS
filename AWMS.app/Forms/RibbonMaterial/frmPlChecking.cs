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

namespace AWMS.app.Forms.RibbonMaterial
{
    public partial class frmPlChecking : DevExpress.XtraEditors.XtraForm
    {
        private readonly IServiceProvider _serviceProvider;
        private readonly UserSession _session; // اضافه کردن UserSession
        public frmPlChecking(IServiceProvider serviceProvider, int? userId = null)
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
                //lookUpEdit1.Properties.DisplayMember = "PLName"; // فیلدی که به کاربر نمایش داده می‌شود
                //lookUpEdit1.Properties.ValueMember = "PLId";    // فیلدی که به عنوان مقدار بازمی‌گردد
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
                    LoadReportFromRepx("ReportPlChecking.repx", packingListHeaderDetails, packingListDetailDetails);
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
            BindReportLabelData(report, "tableCell4", "RequestData.SupplierName");
            BindReportLabelData(report, "tableCell6", "RequestData.MrName");
            BindReportLabelData(report, "tableCell8", "RequestData.NetW");
            BindReportLabelData(report, "tableCell10", "RequestData.MARDate");
            BindReportLabelData(report, "tableCell12", "RequestData.Username");
            BindReportLabelData(report, "tableCell14", "RequestData.VendorName");
            BindReportLabelData(report, "tableCell16", "RequestData.PoName");
            BindReportLabelData(report, "tableCell18", "RequestData.GrossW");
            BindReportLabelData(report, "tableCell20", "RequestData.AreaUnitName");//warehouse
            BindReportLabelData(report, "tableCell30", "RequestData.AreaUnitName");
            BindReportLabelData(report, "tableCell22", "RequestData.ArchiveNO");
            BindReportLabelData(report, "tableCell26", "RequestData.IrnName");
            BindReportLabelData(report, "tableCell24", "RequestData.IrnName");
            BindReportLabelData(report, "tableCell28", "RequestData.DesciplineName");


            // داده‌های Sub-Band
            XRTable detailTable = report.FindControl("table3", true) as XRTable;
            if (detailTable != null)
            {
                detailTable.BeginInit();
                foreach (XRTableRow row in detailTable.Rows)
                {
                    foreach (XRTableCell cell in row.Cells)
                    {
                        if (cell.Name == "tableCell47")
                        {
                            cell.ExpressionBindings.Add(new ExpressionBinding("BeforePrint", "Text", "[PK]"));
                        }
                        else if (cell.Name == "tableCell48")
                        {
                            cell.ExpressionBindings.Add(new ExpressionBinding("BeforePrint", "Text", "[ItemOfPk]"));
                        }
                        else if (cell.Name == "tableCell49")
                        {
                            cell.ExpressionBindings.Add(new ExpressionBinding("BeforePrint", "Text", "[Tag]"));
                        }
                        else if (cell.Name == "tableCell50")
                        {
                            cell.ExpressionBindings.Add(new ExpressionBinding("BeforePrint", "Text", "[Description]"));
                        }
                        else if (cell.Name == "tableCell51")
                        {
                            cell.ExpressionBindings.Add(new ExpressionBinding("BeforePrint", "Text", "[UnitName]"));
                        }
                        else if (cell.Name == "tableCell52")
                        {
                            cell.ExpressionBindings.Add(new ExpressionBinding("BeforePrint", "Text", "[Qty]"));
                        }
                        else if (cell.Name == "tableCell53")
                        {
                            cell.ExpressionBindings.Add(new ExpressionBinding("BeforePrint", "Text", "[MaterialRec]"));
                        }
                        else if (cell.Name == "tableCell54")
                        {
                            cell.ExpressionBindings.Add(new ExpressionBinding("BeforePrint", "Text", "[ShortageQty]"));
                        }
                        else if (cell.Name == "tableCell55")
                        {
                            cell.ExpressionBindings.Add(new ExpressionBinding("BeforePrint", "Text", "[OverQty]"));
                        }
                        else if (cell.Name == "tableCell56")
                        {
                            cell.ExpressionBindings.Add(new ExpressionBinding("BeforePrint", "Text", "[DamageQty]"));
                        }
                        else if (cell.Name == "tableCell57")
                        {
                            cell.ExpressionBindings.Add(new ExpressionBinding("BeforePrint", "Text", "[LocationName]"));
                        }
                        else if (cell.Name == "tableCell58")
                        {
                            cell.ExpressionBindings.Add(new ExpressionBinding("BeforePrint", "Text", "[ScopeName]"));
                        }
                        else if (cell.Name == "tableCell59")
                        {
                            cell.ExpressionBindings.Add(new ExpressionBinding("BeforePrint", "Text", "[BatchNo]"));
                        }
                        else if (cell.Name == "tableCell60")
                        {
                            cell.ExpressionBindings.Add(new ExpressionBinding("BeforePrint", "Text", "[ItemNetW]"));
                        }
                        else if (cell.Name == "tableCell61")
                        {
                            cell.ExpressionBindings.Add(new ExpressionBinding("BeforePrint", "Text", "[BaseMaterial]"));
                        }
                        else if (cell.Name == "tableCell62")
                        {
                            cell.ExpressionBindings.Add(new ExpressionBinding("BeforePrint", "Text", "[Price]"));
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