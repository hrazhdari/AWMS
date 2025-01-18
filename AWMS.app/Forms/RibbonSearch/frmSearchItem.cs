using AWMS.dapper.Repositories;
using DevExpress.XtraEditors;
using System.IO;
using Microsoft.Extensions.DependencyInjection;
using AWMS.dto;
namespace AWMS.app.Forms.RibbonSearch
{
    public partial class frmSearchItem : XtraForm
    {
        private readonly IServiceProvider _serviceProvider;
        private List<SearchItemDto> _allData; // ذخیره داده‌ها در حافظه
        private const int PageSize = 100; // تعداد رکورد در هر صفحه
        private int _currentPage = 1;
        public frmSearchItem(IServiceProvider serviceProvider)
        {
            InitializeComponent();
            _serviceProvider = serviceProvider;
            initGrid();
        }

        private async void LoadDataIntoGrid3()
        {
            try
            {
                gridControl1.DataSource = await _serviceProvider.GetService<ISearchDapperRepository>()!.SearchItemFillGridIEnumerableAsync();
                //gridControl1.DataSource = await _serviceProvider.GetService<ISearchDapperRepository>()!.SearchItemFillGridAsync();
                //gridControl1.DataSource = await _serviceProvider.GetService<ISearchDapperRepository>()!.SearchItemFillGridDataReaderAsync();
                //gridControl1.DataSource =  _serviceProvider.GetService<ISearchDapperRepository>()!.SearchItemFillGridWithDataReader();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error loading data: " + ex.Message);
            }

        }
        private  void initGrid()
        {
            LoadDataIntoGrid3();
        }
        private void labelControl4_Click_1(object sender, EventArgs e)
        {
            btnRefreshArchiveNO_Click(null, null);
        }

        private void btnRefreshArchiveNO_Click(object sender, EventArgs e)
        {
            initGrid();
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

        private void gridControl1_Click(object sender, EventArgs e)
        {

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
