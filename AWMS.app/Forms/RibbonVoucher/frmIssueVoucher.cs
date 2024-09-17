using AWMS.app.Forms.RibbonUser;
using AWMS.core.Interfaces;
using AWMS.dapper.Repositories;
using AWMS.dto;
using AWMS.dto.AWMS.datalayer.Entities;
using AWMS.report;
using DevExpress.XtraBars.Navigation;
using DevExpress.XtraEditors;
using DevExpress.XtraNavBar;
using Microsoft.Extensions.DependencyInjection;
using System.Data;
using System.Text;

namespace AWMS.app.Forms.RibbonVoucher
{
    public partial class frmIssueVoucher : XtraForm
    {
        //private readonly UnitOfWork _unitOfWork;
        private readonly IServiceProvider _serviceProvider;
        private readonly IRequestDapperRepository _requestDapperRepository;
        private readonly IAreaUnitService _areaUnitService;
        private readonly ICompanyService _companyService;
        private readonly IContractService _contractService;
        private readonly ILocationDapperRepository _locationRepository;
        private readonly IUnitDapperRepository _unitDapperRepository;
        private readonly UserSession _session; // اضافه کردن UserSession
        public frmIssueVoucher(IServiceProvider serviceProvider, IRequestDapperRepository requestDapperRepository,
            IAreaUnitService areaUnitService, ICompanyService companyService, IContractService contractService,
            ILocationDapperRepository locationDapperRepository, IUnitDapperRepository unitDapperRepository, int? userId = null)
        {
            InitializeComponent();
            _serviceProvider = serviceProvider;
            _requestDapperRepository = requestDapperRepository;
            _areaUnitService = areaUnitService;
            _companyService = companyService;
            _contractService = contractService;
            this._locationRepository = locationDapperRepository;
            initGrid();
            // اگر UserId پاس داده نشده بود، مقدار پیش‌فرض 1 استفاده می‌شود
            int finalUserId = userId ?? 1;
            _session = SessionManager.GetSession(finalUserId);
            _unitDapperRepository = unitDapperRepository;
        }

        private void simpleButton1_Click(object sender, EventArgs e)
        {
            try
            {
                var CompanyManagementForm = _serviceProvider.GetRequiredService<frmCompanyManagment>();
                CompanyManagementForm.ShowDialog();
            }
            catch (Exception ex)
            {
                MessageBox.Show($"An error occurred: {ex.Message}");
            }

        }
        private async Task LoadDataIntoGrid()
        {
            int pageNumber = 1;
            int pageSize = 100;
            bool moreData = true;

            progressBar1.Visible = true;
            progressBar1.Style = ProgressBarStyle.Continuous;
            progressBar1.Maximum = 100;
            progressBar1.Value = 0;

            progressLabel.Visible = true;
            progressLabel.Text = "0%";

            int totalRecords = await _requestDapperRepository.GetTotalRecordCount(); // دریافت تعداد کل رکوردها

            List<MaterialIssueVoucherDto> allData = new List<MaterialIssueVoucherDto>();

            try
            {
                while (moreData)
                {
                    var data = await _requestDapperRepository.MaterialIssueVoucherFillGrid(pageNumber, pageSize);

                    if (data.Any())
                    {
                        allData.AddRange(data);
                        gridControl1.DataSource = allData;

                        pageNumber++;
                        int percentage = (int)((double)allData.Count / totalRecords * 100);

                        progressBar1.Value = percentage;
                        progressLabel.Text = $"{percentage}%";
                    }
                    else
                    {
                        moreData = false;
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error loading data: " + ex.Message);
            }
            finally
            {
                progressBar1.Visible = false;
                progressLabel.Visible = false;
            }
        }
        private async void initGrid()
        {
            // پنهان کردن ProgressBar پیش از بارگیری داده‌ها
            progressBar1.Visible = false;

            // بارگیری داده‌ها به صورت تکه‌تکه
            await LoadDataIntoGrid();
        }
        private void gridView1_RowCellStyle(object sender, DevExpress.XtraGrid.Views.Grid.RowCellStyleEventArgs e)
        {
            if (e.RowHandle >= 0)
            {
                object holdCellValue = gridView1.GetRowCellValue(e.RowHandle, "Hold");
                if (holdCellValue != null && holdCellValue is bool)
                {
                    bool holdValue = (bool)holdCellValue;

                    if (holdValue)
                    {
                        e.Appearance.BackColor = Color.Tan; // Set the background color to brown for rows where Hold is true
                    }
                }
            }
        }

        private void gridView1_SelectionChanged(object sender, DevExpress.Data.SelectionChangedEventArgs e)
        {
            // Get the count of selected rows
            int selectedRowCount = gridView1.SelectedRowsCount;

            // Update the text of your label
            labelControl3.Text = $"Selected Rows: {selectedRowCount}";
        }

        private async void xtraTabControl1_SelectedPageChanged(object sender, DevExpress.XtraTab.TabPageChangedEventArgs e)
        {
            // Check if the selected page is xtraTabPage2
            if (e.Page == xtraTabPage2)
            {
                lookUpEditAreaUnit.Properties.DataSource = _areaUnitService.GetAllAreaUnits();
                gridLookUpEdit3.Properties.DataSource = await _companyService.GetAllCompaniesAsync();
                //lookUpEditContract.Properties.DataSource = await _contractService.GetAllContractsAsync();
                //repositoryItemLookUpLocation.DataSource = await _locationRepository.GetAllAsync();
                //repositoryItemLookUpEditUnit.DataSource = _unitDapperRepository.GetAll();

                var nextMIVNumberString = await _requestDapperRepository.NextMivNumber();

                // تبدیل string به int و مقداردهی پیش فرض اگر رشته null یا خالی بود
                int nextMIVNumber = int.TryParse(nextMIVNumberString, out int parsedValue) ? parsedValue : 0;

                // افزایش یک به شماره MIV
                int mivNumber = nextMIVNumber;

                // شماره را به صورت 6 رقمی نمایش بده
                labelControl11.Text = $"MIV-{mivNumber.ToString("D6")}";
            }
        }




        //private List<dynamic> allItems = new List<dynamic>();
        //private async void btnApply_Click(object sender, EventArgs e)
        //{
        //    // Get the selected rows from gridView1
        //    var selectedRows = gridView1.GetSelectedRows();

        //    // Create a list to hold the selected ItemIds
        //    var selectedItemIds = new List<int>();

        //    // Iterate through the selected rows and extract ItemId from the second column
        //    foreach (int rowHandle in selectedRows)
        //    {
        //        object itemIdObject = gridView1.GetRowCellValue(rowHandle, "ItemId");
        //        object holdObject = gridView1.GetRowCellValue(rowHandle, "Hold");
        //        bool hold = false; // Default to false if holdObject is null or invalid

        //        if (holdObject != null && holdObject != DBNull.Value)
        //        {
        //            hold = Convert.ToBoolean(holdObject);
        //        }

        //        if (itemIdObject != null && itemIdObject is int itemId && !hold)
        //        {
        //            // Add the itemId to the list if it's not already present
        //            if (!selectedItemIds.Contains(itemId))
        //            {
        //                selectedItemIds.Add(itemId);
        //            }
        //        }
        //    }

        //    // Fetch all LocItems and their Balance for the selected ItemIds
        //    if (selectedItemIds.Any())
        //    {
        //        var locItems = await _requestDapperRepository.GetLocItemOFSelectedItemID_FOR_ISSUE_VOUCHER(selectedItemIds);

        //        // Append the new items to the existing list
        //        foreach (var locItem in locItems)
        //        {
        //            if (!allItems.Any(item => item.ItemId == locItem.ItemId && item.LocItemID == locItem.LocItemID))
        //            {
        //                allItems.Add(locItem);
        //            }
        //        }
        //    }

        //    // Assign the updated list to the DataSource of gridControl2
        //    gridControl2.DataSource = null; // Clear DataSource to avoid overwriting
        //    gridControl2.DataSource = allItems;

        //    // Update gridView6 to reflect changes
        //    UpdateGridView6();

        //    // Switch to xtraTabPage2
        //    xtraTabControl1.SelectedTabPage = xtraTabPage2;
        //}

        //private void UpdateGridView6()
        //{
        //    gridView6.BeginUpdate();

        //    // Remove the rows with Balance = 0 from the grid
        //    for (int i = gridView6.RowCount - 1; i >= 0; i--)
        //    {
        //        object balanceValue = gridView6.GetRowCellValue(i, "Balance");
        //        if (balanceValue != null && Convert.ToDecimal(balanceValue) == 0)
        //        {
        //            gridView6.DeleteRow(i);
        //        }
        //    }

        //    gridView6.EndUpdate();
        //}
        //private async void btnApply_Click(object sender, EventArgs e)
        //{
        //    // Get the selected rows from gridView1
        //    var selectedRows = gridView1.GetSelectedRows();

        //    // Create a list to hold the selected ItemIds
        //    var selectedItemIds = new List<int>();

        //    // Iterate through the selected rows and extract ItemId from the second column
        //    foreach (int rowHandle in selectedRows)
        //    {
        //        object itemIdObject = gridView1.GetRowCellValue(rowHandle, "ItemId");
        //        object holdObject = gridView1.GetRowCellValue(rowHandle, "Hold");
        //        bool hold = false;

        //        if (holdObject != null && holdObject != DBNull.Value)
        //        {
        //            hold = Convert.ToBoolean(holdObject);
        //        }

        //        if (itemIdObject != null && itemIdObject is int itemId && !hold)
        //        {
        //            if (!selectedItemIds.Contains(itemId))
        //            {
        //                selectedItemIds.Add(itemId);
        //            }
        //        }
        //    }

        //    // Fetch all LocItems and their Balance for the selected ItemIds
        //    if (selectedItemIds.Any())
        //    {
        //        var dataTable = await _requestDapperRepository.GetLocItemOFSelectedItemID_FOR_ISSUE_VOUCHER(selectedItemIds);

        //        // Assign the updated DataTable to the DataSource of gridControl2
        //        gridControl2.DataSource = null; // Clear DataSource to avoid overwriting
        //        gridControl2.DataSource = dataTable;

        //        // Update gridView6 to reflect changes
        //        UpdateGridView6();

        //        // Switch to xtraTabPage2
        //        xtraTabControl1.SelectedTabPage = xtraTabPage2;
        //    }
        //}
        private async void btnApply_Click(object sender, EventArgs e)
        {
            // Get the selected rows from gridView1
            var selectedRows = gridView1.GetSelectedRows();

            // Create a list to hold the selected ItemIds
            var selectedItemIds = new List<int>();

            // Iterate through the selected rows and extract ItemId from the second column
            foreach (int rowHandle in selectedRows)
            {
                object itemIdObject = gridView1.GetRowCellValue(rowHandle, "ItemId");
                object holdObject = gridView1.GetRowCellValue(rowHandle, "Hold");
                bool hold = false; // Default to false if holdObject is null or invalid

                if (holdObject != null && holdObject != DBNull.Value)
                {
                    hold = Convert.ToBoolean(holdObject);
                }

                if (itemIdObject != null && itemIdObject is int itemId && !hold)
                {
                    // Add the itemId to the list if it's not already present
                    if (!selectedItemIds.Contains(itemId))
                    {
                        selectedItemIds.Add(itemId);
                    }
                }
            }

            // Fetch all LocItems and their Balance for the selected ItemIds
            if (selectedItemIds.Any())
            {
                DataTable newDataTable = await _requestDapperRepository.GetLocItemOFSelectedItemID_FOR_ISSUE_VOUCHER(selectedItemIds);

                if (gridControl2.DataSource is DataTable existingDataTable)
                {
                    foreach (DataRow newRow in newDataTable.Rows)
                    {
                        int itemId = (int)newRow["ItemId"];
                        int locItemId = (int)newRow["LocItemID"];

                        // Check if the row with the same ItemId already exists
                        bool itemExists = existingDataTable.AsEnumerable()
                            .Any(row => row.Field<int>("ItemId") == itemId && row.Field<int>("LocItemID") == locItemId);

                        if (!itemExists)
                        {
                            // Add new row if it does not exist
                            existingDataTable.ImportRow(newRow);
                        }
                    }

                    // Assign the updated DataTable to the DataSource of gridControl2
                    gridControl2.DataSource = existingDataTable;
                }
                else
                {
                    // If there is no existing DataTable, set the new one as the DataSource
                    gridControl2.DataSource = newDataTable;
                }
            }

            // Update gridView6 to reflect changes
            UpdateGridView6();

            // Switch to xtraTabPage2
            xtraTabControl1.SelectedTabPage = xtraTabPage2;
        }

        private void UpdateGridView6()
        {
            gridView6.BeginUpdate();

            // Remove the rows with Balance = 0 from the grid
            for (int i = gridView6.RowCount - 1; i >= 0; i--)
            {
                object balanceValue = gridView6.GetRowCellValue(i, "Balance");
                if (balanceValue != null && Convert.ToDecimal(balanceValue) == 0)
                {
                    gridView6.DeleteRow(i);
                }
            }

            gridView6.EndUpdate();
        }

        private List<int> redRows = new List<int>(); // List to store row indexes that should be red
        private void gridView6_CellValueChanged(object sender, DevExpress.XtraGrid.Views.Base.CellValueChangedEventArgs e)
        {
            if (e.RowHandle >= 0 && e.RowHandle < gridView6.RowCount)
            {
                if (e.Column.FieldName == "QtyIssue" && e.Value != DBNull.Value && e.Value != null)
                {
                    decimal qtyIssueValue;
                    if (decimal.TryParse(e.Value.ToString(), out qtyIssueValue))
                    {
                        // پیدا کردن ردیف در DataTable و ذخیره مقدار
                        var row = gridView6.GetDataRow(e.RowHandle);
                        if (row != null)
                        {
                            row["QtyIssue"] = qtyIssueValue;
                        }
                    }
                    else
                    {
                        MessageBox.Show("Invalid QtyIssue value! Please enter a valid decimal number.", "Invalid Input", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    }
                }
            }
        }

        private void gridView6_CustomUnboundColumnData(object sender, DevExpress.XtraGrid.Views.Base.CustomColumnDataEventArgs e)
        {
            if (e.IsGetData && e.Column.FieldName == "RowNumber")
            {
                // Display the row number (index starts from 0, so add 1 for display)
                e.Value = e.ListSourceRowIndex + 1;
            }
            if (e.IsGetData && e.Column.FieldName == "QtyIssue")
            {
                // بازیابی مقدار QtyIssue از DataTable
                var row = gridView6.GetDataRow(e.ListSourceRowIndex);
                if (row != null)
                {
                    e.Value = row["QtyIssue"];
                }
            }
        }


        private void gridView6_RowCellStyle(object sender, DevExpress.XtraGrid.Views.Grid.RowCellStyleEventArgs e)
        {

            if (e.RowHandle >= 0)
            {
                var row = gridView6.GetDataRow(e.RowHandle);
                if (row != null)
                {
                    decimal qtyIssue = Convert.ToDecimal(row["QtyIssue"]);
                    decimal balance = Convert.ToDecimal(row["Balance"]);

                    if (qtyIssue > balance)
                    {
                        // رنگ‌آمیزی پس‌زمینه ردیف به رنگ قرمز
                        e.Appearance.BackColor = Color.Red;
                        e.Appearance.ForeColor = Color.White; // تغییر رنگ متن برای خوانایی بهتر
                    }
                }
            }
        }

        private bool AnyRedRows()
        {
            return redRows.Any(rowIndex => rowIndex >= 0 && rowIndex < gridView6.RowCount);
        }



        private async void btnRun_Click(object sender, EventArgs e)
        {
            // Check for validation errors
            bool topdetail = false;
            if (gridLookUpEdit3.EditValue == null || gridLookUpEdit3.EditValue.ToString() == "")
            {
                lblCompany.Text = "Invalid";
                lblCompany.ForeColor = Color.Red;
                topdetail = true;
            }
            else
            {
                lblCompany.Text = "Passed";
                lblCompany.ForeColor = Color.DarkOliveGreen;
            }
            if (lookUpEditContract.EditValue == null || lookUpEditContract.EditValue.ToString() == "")
            {
                lblContract.Text = "Invalid";
                lblContract.ForeColor = Color.Red;
                topdetail = true;
            }
            else
            {
                lblContract.Text = "Passed";
                lblContract.ForeColor = Color.DarkOliveGreen;
            }
            if (lookUpEditAreaUnit.EditValue == null || lookUpEditAreaUnit.EditValue.ToString() == "")
            {
                lblAreaUnit.Text = "Invalid";
                lblAreaUnit.ForeColor = Color.Red;
                topdetail = true;
            }
            else
            {
                lblAreaUnit.Text = "Passed";
                lblAreaUnit.ForeColor = Color.DarkOliveGreen;
            }
            if (topdetail == true)
            {
                MessageBox.Show("Please Select and Enter Valid Data For Top Of Form ;).", "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }
            if (gridView6.RowCount == 0)
            {
                MessageBox.Show("Grid is empty.", "Information", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return;
            }
            else if (AnyEmptyQtyIssueRows())
            {
                MessageBox.Show("Some rows have empty or zero values in the QtyIssue column. Please fill them before running the operation.", "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
            if (txtMrcNo.Text.Trim() == "")
            {
                MessageBox.Show("Please Fill Mrc.No Field ;)", "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
            // Your existing validation logic...
            if (topdetail || gridView6.RowCount == 0 || AnyRedRows() || AnyEmptyQtyIssueRows() || txtMrcNo.Text.Trim() == "")
            {
                // Show relevant messages and return if validation fails
                return;
            }
            bool resuli = await _requestDapperRepository.CheckMrcDuplicate(Convert.ToInt32(gridLookUpEdit3.EditValue), txtMrcNo.Text.Trim());
            if (resuli)
            {
                MessageBox.Show("Duplicate Mrc.No Found , Please Check Mrc.No !", "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }
            // Prepare the data to be sent to the database
            List<RequestDto> requestMivs = new List<RequestDto>();
            for (int i = 0; i < gridView6.RowCount; i++)
            {
                object qtyIssueValue = gridView6.GetRowCellValue(i, "QtyIssue");
                object locItemIDValue = gridView6.GetRowCellValue(i, "LocItemID");

                if (qtyIssueValue != null && locItemIDValue != null)
                {
                    decimal qtyIssue = Convert.ToDecimal(qtyIssueValue);
                    int locItemID = Convert.ToInt32(locItemIDValue);

                    var requestMiv = new RequestDto()
                    {
                        CompanyID = Convert.ToInt32(gridLookUpEdit3.EditValue),
                        ContractId = Convert.ToInt32(lookUpEditContract.EditValue),
                        MRCNO = txtMrcNo.Text.Trim(),
                        AreaUnitID = Convert.ToInt32(lookUpEditAreaUnit.EditValue),
                        ReqMivQty = qtyIssue,
                        ReserveMivQty = qtyIssue,
                        LocItemID = locItemID
                    };

                    requestMivs.Add(requestMiv);
                }
            }

            // Send the batch to the database and get the new MIV numbers
            var newMIVNumbers = await _requestDapperRepository.InsertRequestBatchWithReturnMivNumberAsync(requestMivs, _session.UserID);

            // Display new MIV numbers
            StringBuilder nextMIVNumbersStringBuilder = new StringBuilder();
            foreach (var nextMIVNum in newMIVNumbers)
            {
                nextMIVNumbersStringBuilder.AppendLine(nextMIVNum);
            }
            MessageBox.Show($"MIV Numbers:\n{nextMIVNumbersStringBuilder.ToString()}");

            // Clear the grid and perform other UI updates as needed
            gridView6.ClearSorting(); // Clear sorting to avoid exceptions
            gridView6.BeginUpdate();
            for (int i = gridView6.RowCount - 1; i >= 0; i--)
            {
                gridView6.DeleteRow(i);
            }
            gridView6.EndUpdate();
            xtraTabControl1.SelectedTabPage = xtraTabPage3;


            // Add MIV numbers to the AccordionControl
            AccordionControlElement group = new AccordionControlElement
            {
                Text = "Mrc.No: " + txtMrcNo.Text.Trim(),
                Style = ElementStyle.Group, // تنظیم استایل به عنوان گروه
                Expanded = true // اطمینان از باز بودن گروه
            };

            // ایجاد آیتم‌ها
            foreach (var nextMIVNum in newMIVNumbers)
            {
                // اضافه کردن فاصله برای نمایش وسط‌چین
                string mivText = "           MIV-" + nextMIVNum + "          "; // فاصله برای شبیه وسط‌چین کردن

                AccordionControlElement item = new AccordionControlElement
                {
                    Text = mivText, // متن با فاصله
                    Style = ElementStyle.Item, // آیتم عادی
                    Tag = nextMIVNum // ذخیره شماره MIV یا اطلاعات مرتبط
                };

                // تنظیم ترازبندی متن به صورت وسط‌چین
                item.Appearance.Normal.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center;

                // Attach event handler for item click
                item.Click += (sender, e) =>
                {
                    string mivNumber = item.Tag.ToString();

                    // بررسی وضعیت ToggleSwitch برای بارگذاری گزارش مناسب
                    if (toggleSwitch1.IsOn)
                    {
                        // بارگذاری گزارش برای عقب
                        LoadReportREAR(mivNumber);
                    }
                    else
                    {
                        // بارگذاری گزارش برای جلو
                        LoadReportFRONT(mivNumber);
                    }
                };

                // اضافه کردن آیتم به گروه
                group.Elements.Add(item);
            }

            // اضافه کردن گروه به AccordionControl
            accordionControl1.Elements.Add(group);


            // Clear inputs and reset UI state
            txtMrcNo.Text = "";
            labelControl8_Click(null, null);
        }
        private bool AnyEmptyQtyIssueRows()
        {
            for (int i = 0; i < gridView6.RowCount; i++)
            {
                object qtyIssueObject = gridView6.GetRowCellValue(i, "QtyIssue");
                if (qtyIssueObject == null || string.IsNullOrEmpty(qtyIssueObject.ToString()) || (Convert.ToDecimal(qtyIssueObject).Equals(0.00)) || (Convert.ToDecimal(qtyIssueObject).Equals(0)))
                {
                    return true; // At least one row has an empty QtyIssue value
                }
            }
            return false; // No row has an empty QtyIssue value
        }
        private void NavBarItem_LinkClicked(object sender, NavBarLinkEventArgs e)
        {
            var item = sender as NavBarItem;
            if (item != null)
            {
                string mivNumber = item.Tag.ToString();
                if (toggleSwitch1.IsOn)
                {
                    // بارگذاری گزارش برای عقب
                    LoadReportREAR(mivNumber);
                }
                else
                {
                    // بارگذاری گزارش برای جلو
                    LoadReportFRONT(mivNumber);
                }
            }
        }

        private async void LoadReportFRONT(string mivNumber)
        {
            int ONOFFDEL = 0;
            if (toggleSwitch2.IsOn)
            {
                ONOFFDEL = 1;
            }
            else
            {
                ONOFFDEL = 0;
            }
            // Create an instance of the report
            MivReportFront report = new MivReportFront(ONOFFDEL);
            // Set the MivNumber parameter
            //report.Parameters["MivNumber"].Value = mivNumber;

            // Fetch data from the database based on the MIV number
            var requestData = await _requestDapperRepository.GetDataFromDatabaseAsync(mivNumber);

            // Bind the fetched data to the report
            report.DataSource = requestData;

            // Load the report layout and display it
            documentViewer1.DocumentSource = report;
            report.CreateDocument();
            //documentViewer1.BringToFront();
        }
        private async void LoadReportREAR(string mivNumber)
        {
            // Create an instance of the report
            MivReportREAR report = new MivReportREAR();
            // Set the MivNumber parameter
            //report.Parameters["MivNumber"].Value = mivNumber;

            // Fetch data from the database based on the MIV number
            var requestData = await _requestDapperRepository.GetDataFromDatabaseREARAsync(mivNumber);

            // Bind the fetched data to the report
            report.DataSource = requestData;

            // Load the report layout and display it
            documentViewer1.DocumentSource = report;
            report.CreateDocument();
            //documentViewer1.BringToFront();
        }

        private async void labelControl10_Click(object sender, EventArgs e)
        {
            //    if (gridLookUpEdit3.EditValue != null)
            //    {
            //        using (var unitOfWork = new UnitOfWork(new DatabaseContext()))
            //        {
            //            // Load data asynchronously
            //            lookUpEditContract.Properties.DataSource = await Task.Run(() => unitOfWork.CompanyContractRepository.GetAllCompanyContractByCompanyId(Convert.ToInt32(gridLookUpEdit3.EditValue)).ToList());
            //        }
            //    }
            //    else
            //    {
            //        XtraMessageBox.Show("Please First Select Company...", "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            //    }
        }

        private void lookUpEditContract_EditValueChanged(object sender, EventArgs e)
        {
            labelControl10_Click(null, null);
        }

        private async void gridLookUpEdit3_EditValueChanged(object sender, EventArgs e)
        {
            if (gridLookUpEdit3.EditValue != null)
            {

                // Load data asynchronously
                lookUpEditContract.Properties.DataSource = await Task.Run(() => _contractService.GetAllContractsByCompanyidAsync(Convert.ToInt32(gridLookUpEdit3.EditValue)));
                // Show null text
                lookUpEditContract.EditValue = null;
            }
        }

        private void labelControl8_Click(object sender, EventArgs e)
        {
            //using (var unitOfWork = new UnitOfWork(new DatabaseContext()))
            //{
            //    var nextMIVNumber = unitOfWork.DapperRepository.GetNextMivNumber();

            //    //return nextMIVNumber;
            //    labelControl11.Text = "MIV-" + nextMIVNumber;
            //}
        }

        private void gridView1_CustomUnboundColumnData(object sender, DevExpress.XtraGrid.Views.Base.CustomColumnDataEventArgs e)
        {
            if (e.IsGetData && e.Column.FieldName == "RowNumber")
            {
                // Display the row number (index starts from 0, so add 1 for display)
                e.Value = e.ListSourceRowIndex + 1;
            }
        }

        private void simpleButton3_Click(object sender, EventArgs e)
        {
            // شروع حلقه روی تمام ردیف‌ها
            for (int i = 0; i < gridView6.RowCount; i++)
            {
                // چک کردن اینکه آیا ردیف معتبر است
                if (!gridView6.IsDataRow(i))
                    continue;

                // گرفتن مقدار ReserveMivQty از ستون مرتبط
                var BalanceQty = gridView6.GetRowCellValue(i, "Balance");

                // کپی کردن مقدار ReserveMivQty به DelMivQty
                gridView6.SetRowCellValue(i, "QtyIssue", BalanceQty);
            }
        }

        private void gridControl2_Click(object sender, EventArgs e)
        {

        }
    }
}
