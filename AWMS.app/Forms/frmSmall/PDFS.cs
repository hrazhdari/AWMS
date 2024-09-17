using AWMS.app.Forms.RibbonUser;
using AWMS.app.Utility;
using AWMS.dapper.Repositories;
using DevExpress.XtraEditors;
using DevExpress.XtraEditors.Repository;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Diagnostics;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace AWMS.app.Forms.frmSmall
{
    public partial class PDFS : XtraForm
    {
        private readonly IUploadDapperRepository _uploadDapperRepository;
        private readonly UserSession _session; // اضافه کردن UserSession
        public PDFS(IUploadDapperRepository UploadDapperRepository, int? userId = null)
        {
            InitializeComponent();
            _uploadDapperRepository = UploadDapperRepository;
            // اگر UserId پاس داده نشده بود، مقدار پیش‌فرض 1 استفاده می‌شود
            int finalUserId = userId ?? 1;
            _session = SessionManager.GetSession(finalUserId);

            gridView1.CustomUnboundColumnData += gridView1_CustomUnboundColumnData;
        }
        private void gridView1_CustomUnboundColumnData(object sender, DevExpress.XtraGrid.Views.Base.CustomColumnDataEventArgs e)
        {
            if (e.Column.FieldName == "RowNumber" && e.IsGetData)
            {
                e.Value = e.ListSourceRowIndex + 1;  // تنظیم شماره ردیف بر اساس index
            }
        }
        private void SetupImageListAndGridView()
        {
            // ایجاد ImageList و افزودن آیکون‌ها
            ImageList imageList = new ImageList();
            //imageList.ImageSize = new Size(24, 24); // تغییر سایز آیکون به 32x32 (شما می‌توانید هر سایزی بگذارید)

            imageList.Images.Add(Image.FromFile("Resources/icons11_pdf.ico")); // آیکون برای فایل موجود
            imageList.Images.Add(Image.FromFile("Resources/icons10_pdf.ico")); // آیکون برای فایل ناموجود

            // ایجاد و تنظیم RepositoryItemImageEdit
            RepositoryItemImageEdit repositoryItemImageEdit = new RepositoryItemImageEdit();
            repositoryItemImageEdit.Images = imageList;

            // اختصاص RepositoryItemImageEdit به ستون DPF
            gridView1.Columns["DPF"].ColumnEdit = repositoryItemImageEdit;

            // غیرفعال کردن ویرایش برای ستون DPF
            gridView1.Columns["DPF"].OptionsColumn.AllowEdit = false; // یا به جای آن از ReadOnly استفاده کنید

            // تنظیم رویداد کلیک برای جلوگیری از هرگونه رفتار منوی پاپ‌آپ
            gridView1.RowCellClick += gridView1_RowCellClick;
        }
        private void gridView1_RowCellClick(object sender, DevExpress.XtraGrid.Views.Grid.RowCellClickEventArgs e)
        {
            if (e.Column.FieldName == "DPF")
            {
                e.Handled = true; // Stop event propagation

                string pdfPath = gridView1.GetRowCellValue(e.RowHandle, "DPF")?.ToString();

                try
                {
                    if (!string.IsNullOrEmpty(pdfPath) && System.IO.File.Exists(pdfPath))
                    {
                        var startInfo = new ProcessStartInfo
                        {
                            FileName = pdfPath,
                            UseShellExecute = true
                        };

                        Process.Start(startInfo);
                    }
                    else
                    {
                        // Ensure the message is only shown once
                        if (e.Column.OptionsColumn.AllowEdit)
                        {
                            MessageBox.Show(!string.IsNullOrEmpty(pdfPath) ? "PDF file does not exist." : "No PDF available for this row.");
                            e.Column.OptionsColumn.AllowEdit = false; // Prevent further messages
                        }
                    }
                }
                catch (Exception ex)
                {
                    // Handle the exception
                    MessageBox.Show("An error occurred while trying to open the PDF file: " + ex.Message);
                }
            }
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
        private void btnShow_Click(object sender, EventArgs e)
        {
            // پاک کردن داده‌ها و ستون‌ها
            gridControl1.DataSource = null;
            gridView1.Columns.Clear(); // این خط ستون‌های GridView را پاک می‌کند

            // متد برای نمایش داده‌ها در GridView
            string documentName = radioGroup1.Properties.Items[radioGroup1.SelectedIndex].Description;
            switch (documentName)
            {
                case "PL":
                    ShowPackingList();
                    break;
                case "IRN":
                    ShowIrn();
                    break;
                case "MIV":
                    ShowMIV();
                    break;
                case "MSR":
                    //
                    break;
            }


            SetupImageListAndGridView();
        }

        private void ShowPackingList()
        {
            try
            {
                // دریافت داده‌های Packing List
                var packingLists = _uploadDapperRepository.GetPackingLists();

                // نمایش داده‌ها در GridView
                gridControl1.DataSource = packingLists; // فرض شده است که شما از DevExpress GridControl استفاده می‌کنید
                gridView1.BestFitColumns(); // اندازه ستون‌ها بر اساس محتوای آن‌ها تنظیم می‌شود
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Error fetching data: {ex.Message}", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
        private void ShowIrn()
        {
            try
            {
                // دریافت داده‌های Packing List
                var irns = _uploadDapperRepository.GetIrns();

                // نمایش داده‌ها در GridView
                gridControl1.DataSource = irns; // فرض شده است که شما از DevExpress GridControl استفاده می‌کنید
                gridView1.BestFitColumns(); // اندازه ستون‌ها بر اساس محتوای آن‌ها تنظیم می‌شود
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Error fetching data: {ex.Message}", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
        private void ShowMIV()
        {
            try
            {
                // دریافت داده‌های Packing List
                var MIVs = _uploadDapperRepository.GetMIVs();

                // نمایش داده‌ها در GridView
                gridControl1.DataSource = MIVs; // فرض شده است که شما از DevExpress GridControl استفاده می‌کنید
                gridView1.BestFitColumns(); // اندازه ستون‌ها بر اساس محتوای آن‌ها تنظیم می‌شود
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Error fetching data: {ex.Message}", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void btnExport_Click(object sender, EventArgs e)
        {
            SaveGridData("Excel Files|*.xlsx", "Save Excel File", fileName => gridView1.ExportToXlsx(fileName));
            //ExportFromGridViewDevexpress.SaveGridData("Excel Files|*.xlsx", "Save Excel File", fileName => gridView1.ExportToXlsx(fileName));
        }
    }
}
