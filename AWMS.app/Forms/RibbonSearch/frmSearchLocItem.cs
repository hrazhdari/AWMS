using AWMS.dapper.Repositories;
using DevExpress.XtraEditors;
using System.IO;

namespace AWMS.app.Forms.RibbonSearch
{
    public partial class frmSearchLocItem : XtraForm
    {
        // private readonly IRequestDapperRepository _requestDapperRepository;
        private readonly ISearchDapperRepository _searchDapperRepository;
        public frmSearchLocItem(ISearchDapperRepository searchDapperRepository)//IRequestDapperRepository requestDapperRepository,)
        {
            InitializeComponent();
            //_requestDapperRepository = requestDapperRepository;
            _searchDapperRepository = searchDapperRepository;
            initGrid();
        }

        //private async Task LoadDataIntoGrid()
        //{
        //    int pageNumber = 1;
        //    int pageSize = 100;
        //    bool moreData = true;

        //    progressBar1.Visible = true;
        //    progressBar1.Style = ProgressBarStyle.Continuous;
        //    progressBar1.Maximum = 100;
        //    progressBar1.Value = 0;

        //    progressLabel.Visible = true;
        //    progressLabel.Text = "0%";

        //    int totalRecords = await _searchDapperRepository.GetTotalItemRecordCount(); // دریافت تعداد کل رکوردها
        //    MessageBox.Show("item = " + totalRecords);
        //    List<SearchItemDto> allData = new List<SearchItemDto>();

        //    try
        //    {
        //        while (moreData)
        //        {
        //            var data = await _searchDapperRepository.SearchItemFillGrid(pageNumber, pageSize);

        //            if (data.Any())
        //            {
        //                allData.AddRange(data);
        //                gridControl1.DataSource = allData;

        //                pageNumber++;
        //                int percentage = (int)((double)allData.Count / totalRecords * 100);

        //                progressBar1.Value = percentage;
        //                progressLabel.Text = $"{percentage}%";
        //            }
        //            else
        //            {
        //                moreData = false;
        //            }
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        MessageBox.Show("Error loading data: " + ex.Message);
        //        progressLabel.Text = "Error loading data: " + ex.Message;
        //    }
        //    finally
        //    {
        //        progressBar1.Visible = false;
        //        progressLabel.Visible = false;
        //    }
        //}
        //private async Task LoadDataIntoGrid2()
        //{
        //    try
        //    {
        //        var data = await _searchDapperRepository.SearchItemFillGrid2();

        //        gridControl1.DataSource = data;
        //    }
        //    catch (Exception ex)
        //    {
        //        MessageBox.Show("Error loading data: " + ex.Message);
        //    }

        //}
        private void LoadDataIntoGrid3()
        {
            try
            {
                gridControl1.DataSource = _searchDapperRepository.SearchLocItemFillGridWithDataReader();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error loading data: " + ex.Message);
            }

        }
        private async void initGrid()
        {
            // پنهان کردن ProgressBar پیش از بارگیری داده‌ها
            progressBar1.Visible = false;

            // بارگیری داده‌ها به صورت تکه‌تکه
            //await LoadDataIntoGrid();
            //await LoadDataIntoGrid2();
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

        private void simpleButton2_Click(object sender, EventArgs e)
        {
            SaveGridData("PDF Files|*.pdf", "Save PDF File", fileName => gridView1.ExportToPdf(fileName));
        }

        private void simpleButton3_Click(object sender, EventArgs e)
        {
            gridView1.Print();
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
