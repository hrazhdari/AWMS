using AWMS.dapper.Repositories;
using DevExpress.XtraEditors;
using System.IO;
using Microsoft.Extensions.DependencyInjection;

namespace AWMS.app.Forms.RibbonSearch
{
    public partial class frmSearchMiv : XtraForm
    {
        private readonly IServiceProvider _serviceProvider;
        public frmSearchMiv(IServiceProvider serviceProvider)
        {
            InitializeComponent();
            _serviceProvider = serviceProvider;
            LoadDataIntoGrid3();
        }


        private void LoadDataIntoGrid3()
        {
            try
            {
                gridControl1.DataSource = _serviceProvider.GetService<ISearchDapperRepository>()!.SearchMivFillGrid2();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error loading data: " + ex.Message);
            }

        }

        private void labelControl4_Click_1(object sender, EventArgs e)
        {
            btnRefreshArchiveNO_Click(null, null);
        }

        private void btnRefreshArchiveNO_Click(object sender, EventArgs e)
        {
            LoadDataIntoGrid3();
            XtraMessageBox.Show("All Data Refreshed ;)");
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

        private void gridView1_CustomUnboundColumnData_1(object sender, DevExpress.XtraGrid.Views.Base.CustomColumnDataEventArgs e)
        {
            // بررسی اینکه آیا داده‌ها باید دریافت شوند
            if (e.IsGetData && e.Column.FieldName == "RowNumber")
            {
                // نمایش شماره ردیف (ایندکس از 0 شروع می‌شود، بنابراین برای نمایش 1 اضافه می‌شود)
                e.Value = e.ListSourceRowIndex + 1;
            }
        }
    }
}
