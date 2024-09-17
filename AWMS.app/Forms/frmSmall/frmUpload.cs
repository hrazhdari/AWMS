using AWMS.app.Forms.RibbonUser;
using AWMS.dapper.Repositories;
using AWMS.dto;
using DevExpress.XtraEditors;
using System.IO;

namespace AWMS.app.Forms.frmSmall
{
    public partial class frmUpload : XtraForm
    {
        private readonly IUploadDapperRepository _uploadDapperRepository;
        private readonly UserSession _session; // اضافه کردن UserSession
        public frmUpload(IUploadDapperRepository UploadDapperRepository, int? userId = null)
        {
            InitializeComponent();
            _uploadDapperRepository = UploadDapperRepository;
            // اگر UserId پاس داده نشده بود، مقدار پیش‌فرض 1 استفاده می‌شود
            int finalUserId = userId ?? 1;
            _session = SessionManager.GetSession(finalUserId);
            gridView1.RowCellStyle += gridView1_RowCellStyle;
            gridView1.CustomUnboundColumnData += gridView1_CustomUnboundColumnData;

        }
        private void gridView1_CustomUnboundColumnData(object sender, DevExpress.XtraGrid.Views.Base.CustomColumnDataEventArgs e)
        {
            if (e.Column.FieldName == "RowNumber" && e.IsGetData)
            {
                e.Value = e.ListSourceRowIndex + 1;  // تنظیم شماره ردیف بر اساس index
            }
        }

        private void gridView1_RowCellStyle(object sender, DevExpress.XtraGrid.Views.Grid.RowCellStyleEventArgs e)
        {
            var view = sender as DevExpress.XtraGrid.Views.Grid.GridView;

            // بررسی می‌کنیم که ستون Status باشد
            if (e.Column.FieldName == "Status")
            {
                // گرفتن مقدار ستون Status برای ردیف جاری
                string status = view.GetRowCellValue(e.RowHandle, "Status")?.ToString();

                // تغییر رنگ بر اساس مقدار Status
                if (status == "Pending")
                {
                    e.Appearance.BackColor = Color.Yellow;  // رنگ زرد برای Pending
                }
                else if (status == "Uploaded")
                {
                    e.Appearance.BackColor = Color.LightGreen;  // رنگ سبز برای Uploaded
                }
                else if (status != null && status.StartsWith("Error"))
                {
                    e.Appearance.BackColor = Color.Red;  // رنگ قرمز برای Error
                }
            }
        }

        private List<FileUploadDto> fileList = new List<FileUploadDto>();  // لیستی برای نگهداری فایل‌ها

        private void btnSelect_Click(object sender, EventArgs e)
        {
            using (OpenFileDialog openFileDialog = new OpenFileDialog())
            {
                openFileDialog.Filter = "PDF Files|*.pdf";
                openFileDialog.Multiselect = true;

                if (openFileDialog.ShowDialog() == DialogResult.OK)
                {
                    var fileList = new List<FileUploadDto>();

                    foreach (string filePath in openFileDialog.FileNames)
                    {
                        FileInfo fileInfo = new FileInfo(filePath);

                        // Check file size
                        if (fileInfo.Length > 25 * 1024 * 1024) // 25 MB
                        {
                            MessageBox.Show($"The file {fileInfo.Name} exceeds 25 MB and will not be selected.");
                            continue;
                        }

                        fileList.Add(new FileUploadDto
                        {
                            FileName = filePath,
                            Status = "Pending"
                        });
                    }

                    gridControl1.DataSource = fileList;
                    gridControl1.RefreshDataSource();
                }
            }
        }

        private void btnUpload_Click(object sender, EventArgs e)
        {
            string documentName = radioGroup1.Properties.Items[radioGroup1.SelectedIndex].Description;

            if (string.IsNullOrEmpty(documentName))
            {
                MessageBox.Show("Please select a document type.");
                return;
            }

            string folderPath = Path.Combine(@"C:\Documents\", documentName);

            if (!Directory.Exists(folderPath))
            {
                Directory.CreateDirectory(folderPath);  // Create folder for the document
            }

            var fileList = gridControl1.DataSource as List<FileUploadDto>;

            if (fileList == null || fileList.Count == 0)
            {
                MessageBox.Show("No files available for upload.");
                return;
            }

            bool allUploadedSuccessfully = true;

            foreach (var fileDto in fileList)
            {
                string filePath = fileDto.FileName;  // Full file path
                string fileName = Path.GetFileName(filePath);
                string destinationPath = Path.Combine(folderPath, fileName);
                string fileNameWithoutExtension = Path.GetFileNameWithoutExtension(filePath);

                try
                {
                    bool isUpdated = false;

                    // First, try to update the database record and check if the record exists
                    switch (documentName)
                    {
                        case "PL":
                            isUpdated = _uploadDapperRepository.UpdatePackingListPLDPF(fileNameWithoutExtension, destinationPath);
                            break;
                        case "IRN":
                            isUpdated = _uploadDapperRepository.UpdateIRNPDF(fileNameWithoutExtension, destinationPath);
                            break;
                        case "MIV":
                            isUpdated = _uploadDapperRepository.UpdateRequestMIVPDF(fileNameWithoutExtension, destinationPath);
                            break;
                        case "MSR":
                            isUpdated = _uploadDapperRepository.UpdatePKMSRPDF(fileNameWithoutExtension, destinationPath);
                            break;
                        default:
                            MessageBox.Show("Please select a valid option.");
                            continue;  // Skip to the next file if the document type is invalid
                    }

                    // Only copy the file if the database update was successful
                    if (isUpdated && File.Exists(filePath))
                    {
                        File.Copy(filePath, destinationPath, true);  // Copy the file to the respective folder
                        fileDto.Status = "Uploaded";  // If the file is copied successfully, update the file status
                    }
                    else
                    {
                        fileDto.Status = "Error: Update failed or file not found.";  // If the update failed or file doesn't exist
                        allUploadedSuccessfully = false;
                    }
                }
                catch (Exception ex)
                {
                    fileDto.Status = $"Error: {ex.Message}";  // Log any exception encountered
                    allUploadedSuccessfully = false;
                }
            }

            gridControl1.RefreshDataSource();  // Refresh the grid after data changes

            if (allUploadedSuccessfully)
            {
                MessageBox.Show("All files have been successfully uploaded.");
            }
            else
            {
                MessageBox.Show("Some files were not uploaded. Please check the status.");
            }
        }


    }
}
