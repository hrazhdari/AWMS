namespace AWMS.report
{
    public partial class MivReportFront : DevExpress.XtraReports.UI.XtraReport
    {
        public MivReportFront(int ONOFFDEL)
        {
            InitializeComponent();
            DevExpress.XtraReports.UI.CalculatedField rowNumberField = new DevExpress.XtraReports.UI.CalculatedField();
            this.CalculatedFields.Add(rowNumberField);

            rowNumberField.Name = "RowNumber";
            rowNumberField.Expression = "Iif(True, [DataSource.CurrentRowIndex] + 1, 0)";

            // مثال برای یک Table
            this.RowNumber.DataBindings.Add("Text", null, "RowNumber");

            this.mivlabel.DataBindings.Add("Text", null, "RequestNO");
            this.companylabel.DataBindings.Add("Text", null, "CompanyName");
            this.mrclabel.DataBindings.Add("Text", null, "MRCNO");
            this.datelabel.DataBindings.Add("Text", null, "ReqDate", "{0:yyyy/MM/dd}");
            this.pllabel.DataBindings.Add("Text", null, "PLName");
            this.pklabel.DataBindings.Add("Text", null, "PK");
            this.itemlabel.DataBindings.Add("Text", null, "ItemOfPk");
            this.taglabel.DataBindings.Add("Text", null, "Tag");
            this.descriptionlabel.DataBindings.Add("Text", null, "Description");
            this.unitlabel.DataBindings.Add("Text", null, "UnitName");
            this.remarklabel.DataBindings.Add("Text", null, "Remark");
            this.ReqQtyList.DataBindings.Add("Text", null, "ReqMivQty");
            if (ONOFFDEL == 1) { this.DelQtyList.DataBindings.Add("Text", null, "ReqMivQty"); } else { this.DelQtyList.DataBindings.Add("Text", null, ""); }
        }
    }
}
