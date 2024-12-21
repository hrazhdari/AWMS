using DevExpress.XtraEditors;
using DevExpress.XtraPrinting;
using DevExpress.XtraReports.UI;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace AWMS.app.Forms.RibbonVoucher
{
    public partial class frmChangeFormat : DevExpress.XtraEditors.XtraForm
    {
        public frmChangeFormat()
        {
            InitializeComponent();
        }

        private void simpleButton1_Click(object sender, EventArgs e)
        {
      

            // بارگذاری فایل .prnx
            string prnxPath = @"path\to\report.prnx";
            PrintingSystem ps = new PrintingSystem();
            ps.LoadDocument(prnxPath);

            // تبدیل PrintingSystem به یک گزارش جدید
            XtraReport report = new XtraReport();
           // report.LoadFromPrnx(ps);

            // ذخیره به عنوان فایل .repx
            string repxPath = @"path\to\report.repx";
            report.SaveLayoutToXml(repxPath);

        }
    }
}