using AWMS.app.Forms.RibbonUser;
using AWMS.core.Interfaces;
using AWMS.dapper.Repositories;
using AWMS.dto;
using DevExpress.XtraEditors;
using Microsoft.Extensions.Configuration; // افزودن این using
using Microsoft.Extensions.DependencyInjection;
using OfficeOpenXml;
using System.IO;

namespace AWMS.app.Forms.RibbonVoucher
{
    public partial class frmImportMrc : XtraForm
    {
        private readonly IServiceProvider _serviceProvider;
        private readonly IConfiguration _configuration; // افزودن این فیلد
        private readonly UserSession _session; // اضافه کردن متغیر سراسری برای UserSession

        public frmImportMrc(IServiceProvider serviceProvider,
            IConfiguration configuration, int? UserId = null) // افزودن IConfiguration به سازنده
        {
            InitializeComponent();
            _serviceProvider = serviceProvider;
            _configuration = configuration; // مقداردهی فیلد

            // اگر UserId پاس داده نشده بود، مقدار پیش‌فرض 1 استفاده می‌شود
            int finalUserId = UserId ?? 1;
            _session = SessionManager.GetSession(finalUserId);
            initgrid();
        }

        public async void initgrid()
        {
            lookUpEditCompany.Properties.DataSource =  _serviceProvider.GetService<ICompanyService>()!.GetAllCompanies();
        }


        private void btnImport_Click(object sender, EventArgs e)
        {
            // بررسی textEditMrcName
            if (string.IsNullOrWhiteSpace(textEditMrcName?.Text))
            {
                MessageBox.Show("Please enter a valid Mrc Name.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }

            // بررسی txtmrcDescription
            if (string.IsNullOrWhiteSpace(txtmrcDescription?.Text))
            {
                MessageBox.Show("Please enter a valid Mrc Description.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }

            // بررسی lookUpEditCompany
            if (lookUpEditCompany?.EditValue == null || !(lookUpEditCompany.EditValue is int))
            {
                MessageBox.Show("Please select a valid company.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }

            // نمایش OpenFileDialog برای انتخاب فایل
            OpenFileDialog openFileDialog = new OpenFileDialog
            {
                Filter = "Excel Files|*.xls;*.xlsx;*.xlsm"
            };

            if (openFileDialog.ShowDialog() == DialogResult.OK)
            {
                // بررسی وجود فایل انتخاب‌شده
                var fileInfo = new FileInfo(openFileDialog.FileName);
                if (!fileInfo.Exists)
                {
                    MessageBox.Show("The selected file does not exist.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return;
                }

                try
                {
                    using (var package = new ExcelPackage(fileInfo))
                    {
                        var detailWorksheet = package.Workbook.Worksheets["Detail"];

                        // بررسی وجود شیت Detail
                        if (detailWorksheet == null)
                        {
                            MessageBox.Show("Sheet named 'Detail' not found in the selected Excel file.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                            return;
                        }

                        // خواندن داده‌ها از شیت
                        var details = ReadDetailsFromExcel(detailWorksheet);

                        // بررسی وجود داده‌ها
                        if (details != null && details.Any())
                        {
                            var repository = _serviceProvider?.GetService<IMrcDapperRepository>();
                            if (repository == null)
                            {
                                MessageBox.Show("Unable to access the repository service.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                                return;
                            }

                            repository.AddMrcs(details, textEditMrcName.Text, txtmrcDescription.Text, (int)lookUpEditCompany.EditValue, _session.UserID);
                            LoadDataToGridControl(detailWorksheet);
                            MessageBox.Show("Mrc Details imported successfully!", "Success", MessageBoxButtons.OK, MessageBoxIcon.Information);
                        }
                        else
                        {
                            MessageBox.Show("No valid data found in the 'Detail' sheet.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                        }
                    }
                }
                catch (Exception ex)
                {
                    // مدیریت خطاهای احتمالی
                    MessageBox.Show($"An error occurred while processing the file: {ex.Message}", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
        }


        //private IEnumerable<ImportMrcDto> ReadDetailsFromExcel(ExcelWorksheet worksheet)
        //  {
        //      if (worksheet == null)
        //      {
        //          throw new ArgumentNullException(nameof(worksheet), "Worksheet cannot be null.");
        //      }

        //      var items = new List<ImportMrcDto>();

        //      for (int row = 2; row <= worksheet.Dimension.End.Row; row++)
        //      {
        //          var cellValue1 = worksheet.Cells[row, 1].Value; // PK
        //          var cellValue2 = worksheet.Cells[row, 2].Value; // ItemOfPk
        //          var cellValue3 = worksheet.Cells[row, 3].Value; // Tag
        //          var cellValue4 = worksheet.Cells[row, 4].Value; // Description
        //          var cellValue5 = worksheet.Cells[row, 5].Value; // UnitID
        //          var cellValue6 = worksheet.Cells[row, 6].Value; // Qty
        //          var cellValue7 = worksheet.Cells[row, 7].Value; // Size1
        //          var cellValue8 = worksheet.Cells[row, 8].Value; // Size2
        //          var cellValue9 = worksheet.Cells[row, 9].Value; // BatchNo
        //          var cellValue10 = worksheet.Cells[row, 10].Value; // DocNo
        //          var cellValue11 = worksheet.Cells[row, 11].Value; // Remark


        //          if (cellValue1 == null || string.IsNullOrWhiteSpace(cellValue1.ToString()))
        //          {
        //              continue; // اگر PK خالی بود، ردیف را نادیده بگذارید
        //          }

        //          var itemDto = new ImportMrcDto
        //          {
        //              PK = cellValue1 != null ? (int?)Convert.ToInt32(cellValue1) : null,
        //              ItemOfPk = cellValue2 != null ? (int?)Convert.ToInt32(cellValue2) : null,
        //              Tag = cellValue3 != null ? cellValue3.ToString() : string.Empty,
        //              Description = cellValue4 != null ? cellValue4.ToString() : string.Empty,
        //              UnitID = cellValue5 != null ? cellValue5.ToString() : string.Empty,
        //              Qty = cellValue6 != null ? (decimal?)Convert.ToDecimal(cellValue6) : null,
        //              Size1 = cellValue7 != null ? cellValue7.ToString() : string.Empty,
        //              Size2 = cellValue8 != null ? cellValue8.ToString() : string.Empty,
        //              BatchNo = cellValue9 != null ? cellValue9.ToString() : string.Empty,
        //              DocNo = cellValue10 != null ? cellValue10.ToString() : string.Empty,
        //              Remark = cellValue11 != null ? cellValue11.ToString() : string.Empty,
        //              EnteredBy = _session.UserID,
        //              EnteredDate = DateTime.Now
        //          };

        //          items.Add(itemDto);
        //      }

        //      return items;
        //  }
        //private IEnumerable<ImportMrcDto> ReadDetailsFromExcel(ExcelWorksheet worksheet)
        //{
        //    if (worksheet == null)
        //    {
        //        throw new ArgumentNullException(nameof(worksheet), "Worksheet cannot be null.");
        //    }

        //    var items = new List<ImportMrcDto>();

        //    for (int row = 2; row <= worksheet.Dimension.End.Row; row++)
        //    {
        //        // بررسی وجود حداقل یک مقدار در ردیف
        //        bool isRowEmpty = true;
        //        for (int col = 1; col <= worksheet.Dimension.End.Column; col++)
        //        {
        //            if (worksheet.Cells[row, col].Value != null &&
        //                !string.IsNullOrWhiteSpace(worksheet.Cells[row, col].Value.ToString()))
        //            {
        //                isRowEmpty = false;
        //                break;
        //            }
        //        }

        //        // اگر ردیف خالی بود، به سراغ ردیف بعدی بروید
        //        if (isRowEmpty) continue;

        //        var itemDto = new ImportMrcDto
        //        {
        //            PK = worksheet.Cells[row, 1].Value != null ? (int?)Convert.ToInt32(worksheet.Cells[row, 1].Value) : null,
        //            ItemOfPk = worksheet.Cells[row, 2].Value != null ? (int?)Convert.ToInt32(worksheet.Cells[row, 2].Value) : null,
        //            Tag = worksheet.Cells[row, 3].Value != null ? worksheet.Cells[row, 3].Value.ToString() : string.Empty,
        //            Description = worksheet.Cells[row, 4].Value != null ? worksheet.Cells[row, 4].Value.ToString() : string.Empty,
        //            UnitID = worksheet.Cells[row, 5].Value != null ? worksheet.Cells[row, 5].Value.ToString() : string.Empty,
        //            Qty = worksheet.Cells[row, 6].Value != null ? (decimal?)Convert.ToDecimal(worksheet.Cells[row, 6].Value) : null,
        //            Size1 = worksheet.Cells[row, 7].Value != null ? worksheet.Cells[row, 7].Value.ToString() : string.Empty,
        //            Size2 = worksheet.Cells[row, 8].Value != null ? worksheet.Cells[row, 8].Value.ToString() : string.Empty,
        //            BatchNo = worksheet.Cells[row, 9].Value != null ? worksheet.Cells[row, 9].Value.ToString() : string.Empty,
        //            DocNo = worksheet.Cells[row, 10].Value != null ? worksheet.Cells[row, 10].Value.ToString() : string.Empty,
        //            Remark = worksheet.Cells[row, 11].Value != null ? worksheet.Cells[row, 11].Value.ToString() : string.Empty,
        //            EnteredBy = _session.UserID,
        //            EnteredDate = DateTime.Now
        //        };

        //        items.Add(itemDto);
        //    }

        //    return items;
        //}

        private IEnumerable<ImportMrcDto> ReadDetailsFromExcel(ExcelWorksheet worksheet)
        {
            if (worksheet == null)
            {
                throw new ArgumentNullException(nameof(worksheet), "Worksheet cannot be null.");
            }

            var items = new List<ImportMrcDto>();

            for (int row = 2; row <= worksheet.Dimension.End.Row; row++)
            {
                var tag = worksheet.Cells[row, 3].Value?.ToString().Trim(); // خواندن Tag
                var description = worksheet.Cells[row, 4].Value?.ToString().Trim(); // خواندن Description

                // اگر Tag یا Description خالی بود، پردازش متوقف می‌شود
                if (string.IsNullOrWhiteSpace(tag) || string.IsNullOrWhiteSpace(description))
                {
                   // MessageBox.Show("Tag یا Description نمی‌تواند خالی باشد. عملیات متوقف می‌شود.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    yield break; // متوقف کردن پردازش
                }

                var itemDto = new ImportMrcDto
                {
                    PK = worksheet.Cells[row, 1].Value != null ? (int?)Convert.ToInt32(worksheet.Cells[row, 1].Value) : null,
                    ItemOfPk = worksheet.Cells[row, 2].Value != null ? (int?)Convert.ToInt32(worksheet.Cells[row, 2].Value) : null,
                    Tag = tag, // استفاده از مقدار Tag
                    Description = description, // استفاده از مقدار Description
                    UnitID = worksheet.Cells[row, 5].Value != null ? worksheet.Cells[row, 5].Value.ToString() : string.Empty,
                    Qty = worksheet.Cells[row, 6].Value != null ? (decimal?)Convert.ToDecimal(worksheet.Cells[row, 6].Value) : null,
                    Size1 = worksheet.Cells[row, 7].Value != null ? worksheet.Cells[row, 7].Value.ToString() : string.Empty,
                    Size2 = worksheet.Cells[row, 8].Value != null ? worksheet.Cells[row, 8].Value.ToString() : string.Empty,
                    BatchNo = worksheet.Cells[row, 9].Value != null ? worksheet.Cells[row, 9].Value.ToString() : string.Empty,
                    DocNo = worksheet.Cells[row, 10].Value != null ? worksheet.Cells[row, 10].Value.ToString() : string.Empty,
                    Remark = worksheet.Cells[row, 11].Value != null ? worksheet.Cells[row, 11].Value.ToString() : string.Empty,
                    EnteredBy = _session.UserID,
                    EnteredDate = DateTime.Now
                };

                // بازگشت هر ردیف از داده‌ها
                yield return itemDto;
            }
        }
        private IEnumerable<ImportMrcDto> ReadDetailsFromExcelForgridControl(ExcelWorksheet worksheet)
        {
            if (worksheet == null)
            {
                throw new ArgumentNullException(nameof(worksheet), "Worksheet cannot be null.");
            }

            var items = new List<ImportMrcDto>();

            for (int row = 2; row <= worksheet.Dimension.End.Row; row++)
            {
                var tag = worksheet.Cells[row, 3].Value?.ToString().Trim(); // خواندن Tag
                var description = worksheet.Cells[row, 4].Value?.ToString().Trim(); // خواندن Description

                // اگر Tag یا Description خالی بود، پردازش متوقف می‌شود
                if (string.IsNullOrWhiteSpace(tag) || string.IsNullOrWhiteSpace(description))
                {
                    // MessageBox.Show("Tag یا Description نمی‌تواند خالی باشد. عملیات متوقف می‌شود.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    yield break; // متوقف کردن پردازش
                }

                var itemDto = new ImportMrcDto
                {
                    PK = worksheet.Cells[row, 1].Value != null ? (int?)Convert.ToInt32(worksheet.Cells[row, 1].Value) : null,
                    ItemOfPk = worksheet.Cells[row, 2].Value != null ? (int?)Convert.ToInt32(worksheet.Cells[row, 2].Value) : null,
                    Tag = tag, // استفاده از مقدار Tag
                    Description = description, // استفاده از مقدار Description
                    UnitID = worksheet.Cells[row, 5].Value != null ? worksheet.Cells[row, 5].Value.ToString() : string.Empty,
                    Qty = worksheet.Cells[row, 6].Value != null ? (decimal?)Convert.ToDecimal(worksheet.Cells[row, 6].Value) : null,
                    Size1 = worksheet.Cells[row, 7].Value != null ? worksheet.Cells[row, 7].Value.ToString() : string.Empty,
                    Size2 = worksheet.Cells[row, 8].Value != null ? worksheet.Cells[row, 8].Value.ToString() : string.Empty,
                    BatchNo = worksheet.Cells[row, 9].Value != null ? worksheet.Cells[row, 9].Value.ToString() : string.Empty,
                    DocNo = worksheet.Cells[row, 10].Value != null ? worksheet.Cells[row, 10].Value.ToString() : string.Empty,
                    Remark = worksheet.Cells[row, 11].Value != null ? worksheet.Cells[row, 11].Value.ToString() : string.Empty,
                    EnteredBy = _session.UserID,
                    EnteredDate = DateTime.Now,


                    // اضافه کردن مقادیر اضافی
                    MrcName = textEditMrcName.Text, // گرفتن نام Mrc از textEdit
                    MrcDescription = txtmrcDescription.Text, // گرفتن توضیحات Mrc از txtmrcDescription
                    ToCompanyID = (int)lookUpEditCompany.EditValue // گرفتن شناسه شرکت از lookUpEdit
                };

                // بازگشت هر ردیف از داده‌ها
                yield return itemDto;
            }
        }
        // تابع برای بارگذاری داده‌ها به گرید کنترل
        public void LoadDataToGridControl(ExcelWorksheet worksheet)
        {
            if (worksheet == null)
            {
                throw new ArgumentNullException(nameof(worksheet), "Worksheet cannot be null.");
            }

            // خواندن داده‌ها از Excel
            var dataItems = ReadDetailsFromExcelForgridControl(worksheet).ToList();

            // تنظیم دیتابایندینگ گرید کنترل به داده‌های خوانده شده
            gridControl1.DataSource = dataItems;
        }

    }
}
