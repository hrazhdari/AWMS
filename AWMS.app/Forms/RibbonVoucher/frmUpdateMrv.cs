using AWMS.app.Forms.RibbonUser;
using AWMS.dapper.Repositories;
using DevExpress.XtraEditors;
using DevExpress.XtraEditors.Repository;
using System.Data;
using static AWMS.dapper.ApproveDapperRepository;
using Microsoft.Extensions.DependencyInjection;
using DevExpress.Xpo;
using AWMS.core;
using AWMS.datalayer.Repositories;
using AWMS.core.Interfaces;
using AWMS.dto;
using System.ComponentModel;
using AWMS.app.Utility;
using DevExpress.XtraGrid.Views.Grid;

namespace AWMS.app.Forms.RibbonVoucher
{
    public partial class frmUpdateMrv : XtraForm
    {

        private readonly IServiceProvider _serviceProvider;
        private readonly UserSession _session; // اضافه کردن UserSession
        public frmUpdateMrv(IServiceProvider serviceProvider, int? userId = null)
        {
            InitializeComponent();
            _serviceProvider = serviceProvider;
            // اگر UserId پاس داده نشده بود، مقدار پیش‌فرض 1 استفاده می‌شود
            int finalUserId = userId ?? 1;
            _session = SessionManager.GetSession(finalUserId);
            loadEditLookupMRV();
            loadData();
            //gridView1.CustomDrawColumnHeader += gridView1_CustomDrawColumnHeader;
        }

        private async void loadData()
        {
            //lookupLocation.Properties.DataSource = await _serviceProvider.GetService<ILocationDapperRepository>()!.GetAllAsync();
            lookupCompany.Properties.DataSource = await _serviceProvider.GetService<ICompanyService>()!.GetAllCompaniesNameAsync();
        }

        private async void loadEditLookupMRV()
        {
            try
            {
                var requestNos = await _serviceProvider.GetService<IMrvDapperRepository>()!.GetMrvsAsync();

                // تنظیم DataSource برای LookUpEdit
                lookUpEdit1.Properties.DataSource = requestNos.Select(r => new { RequestNO = r }).ToList(); // تبدیل به یک لیست از آبجکت‌های ناشناس
                lookUpEdit1.Properties.DisplayMember = "RequestNO"; // مشخص کردن ستون برای نمایش
                lookUpEdit1.Properties.ValueMember = "RequestNO";   // مشخص کردن ستون برای مقدار
                lookUpEdit1.Properties.NullText = "Select MrvNO"; // تنظیم متن خالی
            }
            catch (Exception ex)
            {
                // نمایش خطا در صورت وجود
                XtraMessageBox.Show($"خطا در بارگذاری داده‌ها: {ex.Message}", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        //private void ConfigureGridViewAppearance()
        //{
        //    // بررسی اینکه آیا gridView1 مقداردهی شده است
        //    if (gridView1 == null)
        //    {
        //        MessageBox.Show("GridView is not initialized.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
        //        return;
        //    }
        //    // تنظیمات برای متن و ظاهر سلول‌ها
        //    gridView1.Appearance.Row.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center;
        //    gridView1.Appearance.Row.TextOptions.VAlignment = DevExpress.Utils.VertAlignment.Center;

        //    gridView1.Appearance.HeaderPanel.Options.UseBackColor = true;
        //    gridView1.Appearance.HeaderPanel.Options.UseFont = true;
        //    gridView1.Appearance.HeaderPanel.Options.UseTextOptions = true;

        //    gridView1.Appearance.HeaderPanel.Font = new Font(gridView1.Appearance.HeaderPanel.Font, FontStyle.Bold);

        //    gridView1.RowCellStyle += gridView1_RowCellStyle;

        //    // تنظیمات برای اجازه ویرایش کردن ستون‌های خاص
        //    foreach (DevExpress.XtraGrid.Columns.GridColumn column in gridView1.Columns)
        //    {
        //        column.OptionsColumn.AllowEdit = false;
        //    }

        //    gridView1.Columns["DelMrvQty"].OptionsColumn.AllowEdit = true;
        //    gridView1.Columns["ReqMrvQty"].OptionsColumn.AllowEdit = true;
        //    gridView1.Columns["DelMrvRejQty"].OptionsColumn.AllowEdit = true;
        //    gridView1.Columns["RemarkLocitemID"].OptionsColumn.AllowEdit = true;
        //    gridView1.Columns["LocationName"].OptionsColumn.AllowEdit = true;
        //    gridView1.Columns["RemarkRequests"].Visible = false; // مخفی کردن ستون
        //    gridView1.Columns["PLocItemIDforMRV"].Visible = false; // مخفی کردن ستون
        //    gridView1.Columns["ParentLocItemID"].Visible = false; // مخفی کردن ستون
        //    gridView1.Columns["CompanyName"].Visible = false; // مخفی کردن ستون
        //    gridView1.Columns["RequestNO"].Visible = false; // مخفی کردن ستون

        //    // تعریف ویرایشگر عددی برای ستون‌های خاص
        //    RepositoryItemTextEdit numericEditor = new RepositoryItemTextEdit();
        //    numericEditor.Mask.MaskType = DevExpress.XtraEditors.Mask.MaskType.Numeric;
        //    numericEditor.Mask.EditMask = "n2";
        //    numericEditor.Mask.UseMaskAsDisplayFormat = true;

        //    gridControl1.RepositoryItems.Add(numericEditor);
        //    gridView1.Columns["ReqMrvQty"].ColumnEdit = numericEditor;
        //    gridView1.Columns["DelMrvQty"].ColumnEdit = numericEditor;
        //    gridView1.Columns["DelMrvRejQty"].ColumnEdit = numericEditor;

        //    gridView1.Invalidate();
        //}

        private async void ConfigureGridViewAppearance()
        {
            // بررسی اینکه آیا gridView1 مقداردهی شده است
            if (gridView1 == null)
            {
                MessageBox.Show("GridView is not initialized.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }

            // تنظیمات اولیه برای GridView

            gridView1.RowCellStyle += gridView1_RowCellStyle;

            //// تنظیمات عدم ویرایش برای ستون‌ها
            //foreach (DevExpress.XtraGrid.Columns.GridColumn column in gridView1.Columns)
            //{
            //    column.OptionsColumn.AllowEdit = false;
            //}


            //// سایر تنظیمات (ویرایش عددی)
            //RepositoryItemTextEdit numericEditor = new RepositoryItemTextEdit();
            //numericEditor.Mask.MaskType = DevExpress.XtraEditors.Mask.MaskType.Numeric;
            //numericEditor.Mask.EditMask = "n2";
            //numericEditor.Mask.UseMaskAsDisplayFormat = true;

            //gridControl1.RepositoryItems.Add(numericEditor);
            //gridView1.Columns["ReqMrvQty"].ColumnEdit = numericEditor;
            //gridView1.Columns["DelMrvQty"].ColumnEdit = numericEditor;
            //gridView1.Columns["DelMrvRejQty"].ColumnEdit = numericEditor;
        }

        //private void gridView1_CustomDrawColumnHeader(object sender, DevExpress.XtraGrid.Views.Grid.ColumnHeaderCustomDrawEventArgs e)
        //{
        //    // تنظیمات رنگ و فونت
        //    e.Appearance.BackColor = Color.Yellow;
        //    e.Appearance.Font = new Font(e.Appearance.Font, FontStyle.Bold);
        //    e.Appearance.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center;

        //    // رسم مجدد سرستون با تنظیمات جدید
        //    e.Painter.DrawObject(e.Info);
        //}



        // رویداد برای تغییر رنگ فیلدهای خاص
        private void gridView1_RowCellStyle(object sender, DevExpress.XtraGrid.Views.Grid.RowCellStyleEventArgs e)
        {
            //// شرط برای ستون ReserveQty که رنگ آبی داشته باشد
            //if (e.Column.FieldName == "ReqMrvQty")
            //{
            //    e.Appearance.BackColor = Color.Orange;
            //    e.Appearance.ForeColor = Color.Black; // رنگ متن مشکی برای خوانایی بهتر
            //}

            //// شرط برای ستون DelQty که رنگ نارنجی داشته باشد
            //if (e.Column.FieldName == "DelMrvQty")
            //{
            //    e.Appearance.BackColor = Color.Orange;
            //    e.Appearance.ForeColor = Color.Black; // رنگ متن مشکی برای خوانایی بهتر
            //}
            //// شرط برای ستون DelQty که رنگ نارنجی داشته باشد
            //if (e.Column.FieldName == "DelMrvRejQty")
            //{
            //    e.Appearance.BackColor = Color.Orange;
            //    e.Appearance.ForeColor = Color.Black; // رنگ متن مشکی برای خوانایی بهتر
            //}

            //if (e.Column.FieldName == "RemarkLocitemID")
            //{
            //    e.Appearance.BackColor = Color.Orange;
            //    e.Appearance.ForeColor = Color.Black; // رنگ متن مشکی برای خوانایی بهتر
            //}
            //if (e.Column.FieldName == "LocationID")
            //{
            //    e.Appearance.BackColor = Color.Orange;
            //    e.Appearance.ForeColor = Color.Black; // رنگ متن مشکی برای خوانایی بهتر
            //}
            gridView1.Appearance.Row.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center;
            gridView1.Appearance.Row.TextOptions.VAlignment = DevExpress.Utils.VertAlignment.Center;
            gridView1.Appearance.HeaderPanel.Font = new Font(gridView1.Appearance.HeaderPanel.Font, FontStyle.Bold);
        }

        //private async void btnShowMiv_Click(object sender, EventArgs e)
        //{
        //    try
        //    {
        //        var selectedRequestNo = lookUpEdit1.EditValue?.ToString();

        //        if (string.IsNullOrEmpty(selectedRequestNo))
        //        {
        //            MessageBox.Show("Please select a MRV.NO.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
        //            return;
        //        }
        //        repositoryItemLookUpEdit1.DataSource = await _serviceProvider.GetService<ILocationDapperRepository>()!.GetAllAsync();
        //        gridControl1.DataSource = await _serviceProvider.GetService<IMrvDapperRepository>()!.GetMrvByMrvNoAsync(selectedRequestNo);

        //        gridView1.BestFitColumns();

        //        // اعمال تنظیمات ظاهری برای GridView
        //        ConfigureGridViewAppearance();
        //    }
        //    catch (Exception ex)
        //    {
        //        MessageBox.Show($"Error fetching data: {ex.Message}", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
        //    }
        //}

        private async void btnAprrove_Click(object sender, EventArgs e)
        {
            // ایجاد لیست برای ذخیره اطلاعاتی که قرار است آپدیت شوند
            var updateDataList = new List<MivUpdateModel>();

            // بررسی ردیف‌های GridView و پر کردن لیست
            for (int i = 0; i < gridView1.RowCount; i++)
            {
                // گرفتن مقادیر فیلدهای مربوط به ReqLocItemID و DelMivQty از GridView
                var reqLocItemID = gridView1.GetRowCellValue(i, "ReqLocItemID")?.ToString();
                var delMivQty = gridView1.GetRowCellValue(i, "DelMivQty");

                // بررسی اینکه ReqLocItemID خالی نباشد
                if (string.IsNullOrWhiteSpace(reqLocItemID))
                {
                    MessageBox.Show("فیلد ReqLocItemID خالی است. بررسی کنید.", "خطا", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return;
                }

                // بررسی اینکه DelMivQty به درستی پر شده باشد
                if (delMivQty == null || delMivQty == DBNull.Value || !decimal.TryParse(delMivQty.ToString(), out _))
                {
                    MessageBox.Show("تمامی فیلدهای DelMivQty باید پر شوند و عدد معتبر باشند.", "خطا", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return;
                }

                // اضافه کردن داده به لیست
                updateDataList.Add(new MivUpdateModel
                {
                    ReqLocItemID = reqLocItemID,
                    DelMivQty = Convert.ToDecimal(delMivQty)
                });
            }

            // اگر لیست آپدیت‌ها خالی بود، نمایش پیام خطا
            if (updateDataList.Count == 0)
            {
                MessageBox.Show("هیچ داده‌ای برای آپدیت وجود ندارد.", "خطا", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }

        }

        private async void lookUpEdit1_EditValueChanged(object sender, EventArgs e)
        {
            try
            {
                if (lookUpEdit1.EditValue == null)
                {
                    MessageBox.Show("Please select a valid MRV.", "Validation Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
                var requestNos = await _serviceProvider.GetService<IMrvDapperRepository>()!.GetMrvsInfoAsync((lookUpEdit1.EditValue)?.ToString());
                // فرض کنیم requestNos شامل یک شیء یا لیستی از نتایج است
                if (requestNos != null)
                {
                    // نمایش یکی از خصوصیات مثلا CompanyName در labelControl5
                    labelControl5.Text = requestNos.CompanyName; // یا هر فیلد دیگری که لازم دارید
                    labelControl6.Text = requestNos.MRVNO; // یا هر فیلد دیگری که لازم دارید
                    textEdit1.Text = requestNos.MRVNO; // یا هر فیلد دیگری که لازم دارید
                }
                else
                {
                    labelControl5.Text = "No data found";
                }
            }
            catch (Exception ex)
            {
                // نمایش خطا در صورت وجود
                XtraMessageBox.Show($"Error loading data : {ex.Message}", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            try
            {
                var selectedRequestNo = lookUpEdit1.EditValue?.ToString();

                if (string.IsNullOrEmpty(selectedRequestNo))
                {
                    MessageBox.Show("Please select a MRV.NO.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return;
                }
                repositoryItemLookUpEdit1.DataSource = await _serviceProvider.GetService<ILocationDapperRepository>()!.GetAllAsync();
                gridControl1.DataSource = await _serviceProvider.GetService<IMrvDapperRepository>()!.GetMrvByMrvNoAsync(selectedRequestNo);

                gridView1.BestFitColumns();

                // اعمال تنظیمات ظاهری برای GridView
                ConfigureGridViewAppearance();
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Error fetching data: {ex.Message}", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void checkEdit1_CheckedChanged(object sender, EventArgs e)
        {
            // بررسی وضعیت CheckBox
            bool isChecked = checkEdit1.Checked;

            // فعال یا غیرفعال کردن دکمه‌ها بر اساس وضعیت CheckBox
            btnDellMrv.Enabled = isChecked;
            btnDelRowOfMrv.Enabled = isChecked;
        }


        private async void btnZeroAll_Click_1(object sender, EventArgs e)
        {
            try
            {
                // Show confirmation message to ensure the user wants to proceed
                DialogResult result = MessageBox.Show("Are you sure you want to proceed with this operation to change the MRV Name?", "Confirmation", MessageBoxButtons.YesNo, MessageBoxIcon.Question);

                if (result == DialogResult.No)
                {
                    return;
                }

                // Get the selected MRV number from lookUpEdit1
                string mrvno = lookUpEdit1.EditValue?.ToString();

                if (string.IsNullOrWhiteSpace(mrvno))
                {
                    MessageBox.Show("Please select a valid MRV number.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return;
                }

                // Check if textEdit1 is empty or null
                if (string.IsNullOrWhiteSpace(textEdit1.Text))
                {
                    MessageBox.Show("Please enter a valid value in the MRV Name field.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return;
                }

                // Call the UpdateMrvNameAsync method and pass the MRV number and name
                bool requestNos = await _serviceProvider.GetService<IMrvDapperRepository>()!.UpdateMrvNameAsync(mrvno, textEdit1.Text);

                if (requestNos)
                {
                    MessageBox.Show("MRV Name is Changed.", "Success", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    labelControl6.Text = textEdit1.Text;
                }
                else
                {
                    MessageBox.Show("No rows were updated. Please check if the MRV number and name are correct.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show($"An error occurred: {ex.Message}", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
        private async void simpleButton2_Click(object sender, EventArgs e)
        {
            try
            {
                // Show confirmation message to ensure the user wants to proceed
                DialogResult result = MessageBox.Show("Are you sure you want to proceed with this operation to change the MRV Company?", "Confirmation", MessageBoxButtons.YesNo, MessageBoxIcon.Question);

                if (result == DialogResult.No)
                {
                    return;
                }

                // Get the selected MRV number from lookUpEdit1
                string mrvno = lookUpEdit1.EditValue?.ToString();

                if (string.IsNullOrWhiteSpace(mrvno))
                {
                    MessageBox.Show("Please select a valid MRV number.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return;
                }

                // Get the selected MRV Company from lookupCompany
                if (lookupCompany.EditValue == null || !int.TryParse(lookupCompany.EditValue.ToString(), out int mrvcopany) || mrvcopany == 0)
                {
                    MessageBox.Show("Please select a valid MRV Company.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return;
                }

                // Call the UpdateMrvCompanyAsync method and pass the MRV number and company
                bool requestNos = await _serviceProvider.GetService<IMrvDapperRepository>()!.UpdateMrvCompanyAsync(mrvno, mrvcopany);

                if (requestNos)
                {
                    MessageBox.Show("MRV Company is Changed.", "Success", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    labelControl5.Text = lookupCompany.Text;
                }
                else
                {
                    MessageBox.Show("No rows were updated. Please check if the MRV Company and MRV number are correct.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show($"An error occurred: {ex.Message}", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void gridView1_CellValueChanged(object sender, DevExpress.XtraGrid.Views.Base.CellValueChangedEventArgs e)
        {
            GridView view = sender as GridView;
            if (e.Column.FieldName == "LocationID" && e.RowHandle >= 0)
            {
                object newLocationValue = e.Value;
                int[] selectedRows = view.GetSelectedRows();

                view.CellValueChanged -= gridView1_CellValueChanged;

                List<UpdateLocitemLocationDto> updateDtos = new List<UpdateLocitemLocationDto>();

                foreach (int rowHandle in selectedRows)
                {
                    view.SetRowCellValue(rowHandle, "LocationID", newLocationValue);

                    object locItemId = gridView1.GetRowCellValue(rowHandle, "LocItemID");

                    if (locItemId != null)
                    {
                        int locItemIdValue = Convert.ToInt32(locItemId);
                        int locationIdValue = Convert.ToInt32(newLocationValue);

                        var updateDto = new UpdateLocitemLocationDto
                        {
                            LocItemID = locItemIdValue,
                            LocationID = locationIdValue,
                            EditedBy = _session.UserID, // Replace with the actual current user
                            EditedDate = DateTime.Now
                        };

                        updateDtos.Add(updateDto);
                    }
                    else
                    {
                        XtraMessageBox.Show($"LocItemID is null for row handle {rowHandle}.");
                    }
                }

                view.CellValueChanged += gridView1_CellValueChanged;

                UpdateLocationsInDatabase(updateDtos);
            }
            if (e.Column.FieldName == "RemarkLocitemID" && e.RowHandle >= 0)
            {
                object newRemarkValue = e.Value;
                int[] selectedRows = view.GetSelectedRows();

                view.CellValueChanged -= gridView1_CellValueChanged;

                List<UpdateRemarkLocitemidDto> updateDtos = new List<UpdateRemarkLocitemidDto>();

                foreach (int rowHandle in selectedRows)
                {
                    view.SetRowCellValue(rowHandle, "RemarkLocitemID", newRemarkValue);

                    object locItemId = gridView1.GetRowCellValue(rowHandle, "LocItemID");

                    if (locItemId != null)
                    {
                        int locItemIdValue = Convert.ToInt32(locItemId);
                        var RemarkValue = (newRemarkValue).ToString();

                        var updateDto = new UpdateRemarkLocitemidDto
                        {
                            LocItemID = locItemIdValue,
                            RemarkLocitemID = RemarkValue,
                            EditedBy = _session.UserID, // Replace with the actual current user
                            EditedDate = DateTime.Now
                        };

                        updateDtos.Add(updateDto);
                    }
                    else
                    {
                        XtraMessageBox.Show($"LocItemID is null for row handle {rowHandle}.");
                    }
                }

                view.CellValueChanged += gridView1_CellValueChanged;

                UpdateRemarkInDatabase(updateDtos);
            }
            if (e.Column.FieldName == "RemarkRequests" && e.RowHandle >= 0)
            {
                object newMrvRemarkValue = e.Value;
                int[] selectedRows = view.GetSelectedRows();
                string mrvno = lookUpEdit1.EditValue?.ToString();

                view.CellValueChanged -= gridView1_CellValueChanged;

                List<UpdateMrvRemarkDto> updateDtos = new List<UpdateMrvRemarkDto>();

                foreach (int rowHandle in selectedRows)
                {
                    view.SetRowCellValue(rowHandle, "RemarkRequests", newMrvRemarkValue);

                    object locItemId = gridView1.GetRowCellValue(rowHandle, "LocItemID");

                    if (locItemId != null)
                    {
                        int locItemIdValue = Convert.ToInt32(locItemId);
                        var MrvRemarkValue = (newMrvRemarkValue).ToString();

                        var updateDto = new UpdateMrvRemarkDto
                        {
                            LocItemID = locItemIdValue,
                            MRVRequest = mrvno,
                            RemarkRequests = MrvRemarkValue,
                            EditedBy = _session.UserID, // Replace with the actual current user
                            EditedDate = DateTime.Now
                        };

                        updateDtos.Add(updateDto);
                    }
                    else
                    {
                        XtraMessageBox.Show($"LocItemID is null for row handle {rowHandle}.");
                    }
                }

                view.CellValueChanged += gridView1_CellValueChanged;

                UpdateMRvRemarkInDatabase(updateDtos);
            }
            if ((e.Column.FieldName == "ReqMrvQty" || e.Column.FieldName == "DelMrvQty" || e.Column.FieldName == "DelMrvRejQty") && e.RowHandle >= 0)
            {

                int[] selectedRows = view.GetSelectedRows();
                string mrvno = lookUpEdit1.EditValue?.ToString();

                view.CellValueChanged -= gridView1_CellValueChanged;

                List<UpdateMRVqtiesDto> updateDtos = new List<UpdateMRVqtiesDto>();

                foreach (int rowHandle in selectedRows)
                {
                    object locItemId = gridView1.GetRowCellValue(rowHandle, "LocItemID");
                    object ReqLocItemID = gridView1.GetRowCellValue(rowHandle, "ReqLocItemID");
                    object PLocItemIDforMRV = gridView1.GetRowCellValue(rowHandle, "PLocItemIDforMRV");
                    object ReqMrvQtyValue = gridView1.GetRowCellValue(rowHandle, "ReqMrvQty");
                    object DelMrvQtyValue = gridView1.GetRowCellValue(rowHandle, "DelMrvQty");
                    object DelMrvRejQtyValue = gridView1.GetRowCellValue(rowHandle, "DelMrvRejQty");

                    if (locItemId != null)
                    {
                        int locItemIdValue = Convert.ToInt32(locItemId);
                        int ReqLocItemIDValue = Convert.ToInt32(ReqLocItemID);
                        int PLocItemIDforMRVValue = Convert.ToInt32(PLocItemIDforMRV);
                        decimal ReqMrvQty = Convert.ToDecimal(ReqMrvQtyValue);
                        decimal DelMrvQty = Convert.ToDecimal(DelMrvQtyValue);
                        decimal DelMrvRejQty = Convert.ToDecimal(DelMrvRejQtyValue);

                        var updateDto = new UpdateMRVqtiesDto
                        {
                            LocItemID = locItemIdValue,
                            ReqLocItemID = ReqLocItemIDValue,
                            PLocItemIDforMRV = PLocItemIDforMRVValue,
                            MRVRequest = mrvno,
                            ReqMrvQty = ReqMrvQty,
                            DelMrvQty = DelMrvQty,
                            DelMrvRejQty = DelMrvRejQty,
                            EditedBy = _session.UserID, // Replace with the actual current user
                            EditedDate = DateTime.Now
                        };

                        updateDtos.Add(updateDto);
                    }
                    else
                    {
                        XtraMessageBox.Show($"LocItemID is null for row handle {rowHandle}.");
                    }
                }

                view.CellValueChanged += gridView1_CellValueChanged;

                UpdateMRvQtyInDatabase(updateDtos);
            }
        }

        private async void UpdateMRvQtyInDatabase(List<UpdateMRVqtiesDto> updateDtos)
        {
            try
            {
                await _serviceProvider.GetService<IMrvDapperRepository>()!.UpdateMrvQtyAsync(updateDtos);
                gridView1.RefreshData();
            }
            catch (Exception ex)
            {
                XtraMessageBox.Show($"Error occurred: {ex.Message}", "Error occurred",MessageBoxButtons.OK,MessageBoxIcon.Error);
            }
        }

        private async void UpdateMRvRemarkInDatabase(List<UpdateMrvRemarkDto> updateDtos)
        {
            try
            {
                await _serviceProvider.GetService<IMrvDapperRepository>()!.UpdateMrvRemarksAsync(updateDtos);
                gridView1.RefreshData();
            }
            catch (Exception ex)
            {
                XtraMessageBox.Show($"Error occurred: {ex.Message}");
            }
        }

        private async void UpdateRemarkInDatabase(List<UpdateRemarkLocitemidDto> updateDtos)
        {
            try
            {
                await _serviceProvider.GetService<ILocItemDapperRepository>()!.UpdateLocitemRemarksAsync(updateDtos);
                gridView1.RefreshData();
            }
            catch (Exception ex)
            {
                XtraMessageBox.Show($"Error occurred: {ex.Message}");
            }
        }

        private async void UpdateLocationsInDatabase(List<UpdateLocitemLocationDto> updateDtos)
        {
            try
            {
                await _serviceProvider.GetService<ILocItemDapperRepository>()!.UpdateLocationsAsync(updateDtos);
                gridView1.RefreshData();
            }
            catch (Exception ex)
            {
                XtraMessageBox.Show($"Error occurred: {ex.Message}");
            }
        }
        private void labelControl10_Click(object sender, EventArgs e)
        {
            ExportFromGridViewDevexpress.SaveGridData("Excel Files|*.xlsx", "Save Excel File", fileName => gridView1.ExportToXlsx(fileName));
        }

        private async void btnDelRowOfMrv_Click(object sender, EventArgs e)
        {
            try
            {
                // بررسی اینکه آیا ردیفی انتخاب شده است
                var selectedRow = gridView1.GetFocusedRow();
                if (selectedRow == null)
                {
                    MessageBox.Show("Please select a row to delete.", "No Selection", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    return;
                }

                // دریافت LocItemID از ردیف انتخابی
                var ReqLocItemID = (int)gridView1.GetFocusedRowCellValue("ReqLocItemID");
                string mrvno = lookUpEdit1.EditValue?.ToString();
                // نمایش پیام تایید
                var confirmResult = MessageBox.Show(
                    "Are you sure you want to delete this row?",
                    "Confirm Deletion",
                    MessageBoxButtons.YesNo,
                    MessageBoxIcon.Question);

                if (confirmResult == DialogResult.Yes)
                {
                    // فراخوانی متد حذف
                    await _serviceProvider.GetService<IMrvDapperRepository>()!.DeleteMrvRowAsync(ReqLocItemID, mrvno);

                    // حذف ردیف از GridView
                    gridView1.DeleteRow(gridView1.FocusedRowHandle);

                    MessageBox.Show("Row deleted successfully.", "Success", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show($"An error occurred: {ex.Message}", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private async void btnDellMrv_Click(object sender, EventArgs e)
        {
            try
            {
                // بررسی اینکه آیا MRV انتخاب شده است
                string mrvno = lookUpEdit1.EditValue?.ToString();
                if (string.IsNullOrEmpty(mrvno))
                {
                    MessageBox.Show("Please select a MRV to delete.", "No Selection", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    return;
                }

                // نمایش پیام تایید
                var confirmResult = MessageBox.Show(
                    "Are you sure you want to delete this MRV?",
                    "Confirm Deletion",
                    MessageBoxButtons.YesNo,
                    MessageBoxIcon.Question);

                if (confirmResult == DialogResult.Yes)
                {
                    // فراخوانی متد حذف
                    await _serviceProvider.GetService<IMrvDapperRepository>()!.DeleteMrvAsync(mrvno);

                    // پاک کردن داده‌های GridControl
                    gridControl1.DataSource = null;

                    //loadEditLookupMRV();
                    lookUpEdit1.Refresh();
                    MessageBox.Show("MRV deleted successfully.", "Success", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show($"An error occurred: {ex.Message}", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

    }
}
