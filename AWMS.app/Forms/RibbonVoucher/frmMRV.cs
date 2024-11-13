using AWMS.app.Forms.RibbonUser;
using AWMS.core.Interfaces;
using AWMS.dapper.Repositories;
using AWMS.dto;
using DevExpress.XtraEditors;
using DevExpress.XtraEditors.Repository;
using System.Data;
using Microsoft.Extensions.DependencyInjection;
namespace AWMS.app.Forms.RibbonVoucher
{
    public partial class frmMRV : XtraForm
    {
        private readonly IServiceProvider _serviceProvider;
        private readonly UserSession _session; // اضافه کردن UserSession
        public frmMRV(IServiceProvider serviceProvider, int? userId = null)
        {
            InitializeComponent();
            _serviceProvider = serviceProvider;
            int finalUserId = userId ?? 1;
            _session = SessionManager.GetSession(finalUserId);
  
            loadEditLookupCompany();

            // ثبت رویداد CellValueChanged
            gridView2.CellValueChanged += gridView2_CellValueChanged;
        }

        private async void loadEditLookupCompany()
        {
            lookUpEdit1.Properties.DataSource = await _serviceProvider.GetService<ICompanyService>()!.GetAllCompaniesNameAsync();
            locationlookupForm.Properties.DataSource = await _serviceProvider.GetService<ILocationDapperRepository>()!.GetAllAsync();
        }
        private async void lookUpEdit1_EditValueChanged(object sender, EventArgs e)
        {
            try
            {
                // Show null text
                lookUpEdit2.EditValue = null;
                // Load data asynchronously
                lookUpEdit2.Properties.DataSource = await Task.Run(() =>  _serviceProvider.GetService<IContractService>()!.GetAllContractsByCompanyidAsync(Convert.ToInt32(lookUpEdit1.EditValue)));


                gridControl2.DataSource = null;
                gridView2.Columns.Clear();

                if (lookUpEdit1.EditValue != null)
                {
                    int companyId = Convert.ToInt32(lookUpEdit1.EditValue);

                    // Fetch data from the stored procedure
                    var data =  await _serviceProvider.GetService<IMrvDapperRepository>()!.GetAllMaterialMrvableAsync(companyId);

                    // Check if data is not emptyk
                    if (data != null && data.Any())
                    {
                        // Bind the data to gridControl1
                        gridControl1.DataSource = data;

                        // Set all columns invisible initially
                        foreach (DevExpress.XtraGrid.Columns.GridColumn column in gridView1.Columns)
                        {
                            column.Visible = false;  // Hide all columns by default
                            column.AppearanceCell.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center;  // Center text in cells
                            column.AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center; // Center text in headers
                            column.AppearanceHeader.BackColor = Color.Yellow;  // Set default header background color to yellow
                            column.AppearanceHeader.ForeColor = Color.Black;  // Set default header text color to black
                        }

                        // Specify the columns you want to show and set their visibility and appearance
                        gridView1.Columns["LocItemID"].Visible = true;
                        gridView1.Columns["RequestNO"].Visible = true;
                        gridView1.Columns["TotalDelMivQty"].Visible = true;
                        gridView1.Columns["TotalDelMivRejQty"].Visible = true;
                        gridView1.Columns["TotalDelMrvQty"].Visible = true;
                        gridView1.Columns["TotalDelMrvRejQty"].Visible = true;
                        gridView1.Columns["TotalDelHmvQty"].Visible = true;
                        gridView1.Columns["TotalDelHmvRejQty"].Visible = true;
                        gridView1.Columns["TotalGetHmvQty"].Visible = true;
                        gridView1.Columns["TotalGetHmvRejQty"].Visible = true;
                        gridView1.Columns["Tag"].Visible = true;
                        gridView1.Columns["Description"].Visible = true;
                        gridView1.Columns["UnitName"].Visible = true; 

                        // Custom settings for MrvAvailableQty
                        var mrvAvailableQtyColumn = gridView1.Columns["MrvHmvAvailableQty"];
                        mrvAvailableQtyColumn.Visible = true;  // Make sure it's visible
                        mrvAvailableQtyColumn.OptionsColumn.AllowShowHide = false;  // Prevent the column from being hidden
                        mrvAvailableQtyColumn.AppearanceCell.BackColor = Color.IndianRed;  // Set the background color to purple
                        mrvAvailableQtyColumn.AppearanceCell.ForeColor = Color.White;  // Set the text color to white
                        mrvAvailableQtyColumn.AppearanceCell.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center;  // Center text in cells
                        mrvAvailableQtyColumn.AppearanceHeader.BackColor = Color.IndianRed;  // Set header background color to red
                        mrvAvailableQtyColumn.AppearanceHeader.ForeColor = Color.White;  // Set header text color to white

                        // Change the color of the focused row (selected row)
                        gridView1.Appearance.FocusedRow.BackColor = Color.LightBlue;  // Light blue for focused row
                        gridView1.Appearance.FocusedRow.ForeColor = Color.Black;      // Black text in focused row
                        gridView1.Appearance.SelectedRow.BackColor = Color.LightBlue; // Light blue for selected row
                        gridView1.Appearance.SelectedRow.ForeColor = Color.Black;     // Black text in selected row

                        // Optionally, if you want to highlight the entire row (not just cell), you can use this:
                        gridView1.OptionsSelection.EnableAppearanceFocusedCell = false;  // Disable cell-focused style
                    }


                    else
                    {
                        gridControl1.DataSource = null; // Clear the grid if no data
                        MessageBox.Show("No data found for the selected company.", "Information", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    }
                }
                else
                {
                    MessageBox.Show("Please select a company first.", "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show($"An error occurred: {ex.Message}", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
        private DataTable CreateGridControl2Table()
        {
            // Create a new DataTable instance
            DataTable dt = new DataTable();

            // Define the columns you want to display in gridControl2
            dt.Columns.Add("LocItemID", typeof(int));     // Column for LocItemID
            dt.Columns.Add("ItemId", typeof(int));        // Column for ItemId
            dt.Columns.Add("RequestNO", typeof(string));  // Column for RequestNO
            dt.Columns.Add("TypeName", typeof(string));  // Column for RequestNO
            dt.Columns.Add("Tag", typeof(string));        // Column for Tag
            dt.Columns.Add("Description", typeof(string));// Column for Description
            dt.Columns.Add("DelMivQty", typeof(decimal)); // Column for DelMivQty
            dt.Columns.Add("MrvHmvAvailableQty", typeof(decimal)); // Column for DelMivQty
            //dt.Columns.Add("DelMrvQty", typeof(decimal)); // Column for DelMrvQty
            //dt.Columns.Add("DelMrvRejQty", typeof(decimal)); // Column for DelMrvRejQty
            //dt.Columns.Add("MRCNO", typeof(string));      // Column for MRCNO
            dt.Columns.Add("UnitName", typeof(string));   // Column for UnitName
            //dt.Columns.Add("LastLocation", typeof(string)); // Column for LocationName

            // New columns
            dt.Columns.Add("SelectedLocation", typeof(int)); // Column for selected location (as ID)
            dt.Columns.Add("ReturnedQty", typeof(decimal));  // Column for returned quantity
            dt.Columns.Add("ReturnedDelQty", typeof(decimal));  // Column for returned quantity
            dt.Columns.Add("ReturnedRejQty", typeof(decimal));  // Column for returned quantity
            dt.Columns.Add("Remark", typeof(string));  // Column for returned quantity

            return dt;
        }
        private void gridView2_RowCellStyle(object sender, DevExpress.XtraGrid.Views.Grid.RowCellStyleEventArgs e)
        {
            // وسط چین کردن تمام سلول‌ها
            e.Appearance.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center;

            // بررسی اینکه آیا ستون فعلی SelectedLocation است
            if (e.Column.FieldName == "SelectedLocation")
            {
                e.Appearance.BackColor = Color.Lavender;  // رنگ بنفش لایت برای SelectedLocation
                e.Appearance.ForeColor = Color.Black;     // رنگ متن مشکی

                // تنظیمات برای ستون SelectedLocation
                gridView2.Columns["SelectedLocation"].AppearanceHeader.BackColor = Color.Lavender;  // رنگ سر ستون همرنگ با رنگ ستون
                gridView2.Columns["SelectedLocation"].AppearanceCell.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center; // وسط‌چین کردن محتوای سلول‌ها

            }

            // بررسی اینکه آیا ستون فعلی ReturnedQty است
            if (e.Column.FieldName == "ReturnedQty")
            {
                e.Appearance.BackColor = Color.LightBlue; // رنگ آبی لایت برای ReturnedQty
                e.Appearance.ForeColor = Color.Black;     // رنگ متن مشکی

                // تنظیمات برای ستون ReturnedQty
                gridView2.Columns["ReturnedQty"].AppearanceHeader.BackColor = Color.LightBlue;     // رنگ سر ستون همرنگ با رنگ ستون
                gridView2.Columns["ReturnedQty"].AppearanceCell.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center;  // وسط‌چین کردن محتوای سلول‌ها
            }

            // بررسی اینکه آیا ستون فعلی ReturnedQty است
            if (e.Column.FieldName == "ReturnedDelQty")
            {
                e.Appearance.BackColor = Color.LightGreen; // رنگ آبی لایت برای ReturnedQty
                e.Appearance.ForeColor = Color.Black;     // رنگ متن مشکی

                // تنظیمات برای ستون ReturnedQty
                gridView2.Columns["ReturnedDelQty"].AppearanceHeader.BackColor = Color.LightGreen;     // رنگ سر ستون همرنگ با رنگ ستون
                gridView2.Columns["ReturnedDelQty"].AppearanceCell.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center;  // وسط‌چین کردن محتوای سلول‌ها
            }           // بررسی اینکه آیا ستون فعلی ReturnedQty است
            if (e.Column.FieldName == "ReturnedRejQty")
            {
                e.Appearance.BackColor = Color.LightSalmon; // رنگ آبی لایت برای ReturnedQty
                e.Appearance.ForeColor = Color.Black;     // رنگ متن مشکی

                // تنظیمات برای ستون ReturnedQty
                gridView2.Columns["ReturnedRejQty"].AppearanceHeader.BackColor = Color.LightSalmon;     // رنگ سر ستون همرنگ با رنگ ستون
                gridView2.Columns["ReturnedRejQty"].AppearanceCell.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center;  // وسط‌چین کردن محتوای سلول‌ها
            }
            if (e.Column.FieldName == "Remark")
            {
                e.Appearance.BackColor = Color.LightSkyBlue; // رنگ آبی لایت برای ReturnedQty
                e.Appearance.ForeColor = Color.Black;     // رنگ متن مشکی

                // تنظیمات برای ستون ReturnedQty
                gridView2.Columns["Remark"].AppearanceHeader.BackColor = Color.LightSkyBlue;     // رنگ سر ستون همرنگ با رنگ ستون
                gridView2.Columns["Remark"].AppearanceCell.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center;  // وسط‌چین کردن محتوای سلول‌ها
            }

        }
        private void ConfigureGridControl2Columns()
        {
            // Configure the grid for Location LookUpEdit column
            RepositoryItemLookUpEdit locationLookUpEdit = new RepositoryItemLookUpEdit();
            locationLookUpEdit.DataSource =  _serviceProvider.GetService<ILocationDapperRepository>()!.GetAllLocLocationChange(); // Assuming this method gets location data
            locationLookUpEdit.DisplayMember = "LocationName";
            locationLookUpEdit.ValueMember = "LocationID"; // ValueMember باید نام ستون باشد
            locationLookUpEdit.ShowHeader = false; // Hide the header

            // Add the LookUpEdit repository item to the column
            gridView2.Columns["SelectedLocation"].ColumnEdit = locationLookUpEdit;
            gridView2.Columns["SelectedLocation"].Caption = "Select Location";

            // Set the default value for each row in gridControl2
            int selectedLocationID = Convert.ToInt32(locationlookupForm.EditValue);

            // Check if a valid location is selected
            if (selectedLocationID == 0)
            {
                MessageBox.Show("Please select a valid location.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }

            // Update all rows in gridControl2 to have the default selected location
            for (int i = 0; i < gridView2.DataRowCount; i++)
            {
                gridView2.SetRowCellValue(i, "SelectedLocation", selectedLocationID);
            }

            // Configure the grid for numeric input (Returned Quantity)
            RepositoryItemSpinEdit returnedQtySpinEdit = new RepositoryItemSpinEdit();
            returnedQtySpinEdit.MinValue = 0;
            gridView2.Columns["ReturnedQty"].ColumnEdit = returnedQtySpinEdit;
            gridView2.Columns["ReturnedQty"].Caption = "Returned Qty";

            // Apply other formatting options if needed (e.g., centering the text)
            foreach (DevExpress.XtraGrid.Columns.GridColumn column in gridView2.Columns)
            {
                column.AppearanceCell.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center;
                column.AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center;
            }

        }

        //private async void btnSendForward_Click(object sender, EventArgs e)
        //{
        //    try
        //    {
        //        // Get selected row from gridControl1
        //        var selectedRowHandle = gridView1.FocusedRowHandle;
        //        if (selectedRowHandle >= 0) // Check if a row is selected
        //        {
        //            // Get the values for LocItemID and RequestNO
        //            int locItemId = (int)gridView1.GetRowCellValue(selectedRowHandle, "LocItemID");
        //            //string requestNo = gridView1.GetRowCellValue(selectedRowHandle, "RequestNO").ToString();
        //            int companyId = Convert.ToInt32(lookUpEdit1.EditValue);

        //            // Get the current data source of gridControl2
        //            DataTable dt2 = gridControl2.DataSource as DataTable ?? CreateGridControl2Table();
        //            // Call this method when setting up gridControl2 after adding data to it

        //            // Check if the row is already present in gridControl2
        //            bool isAlreadyMoved = dt2.AsEnumerable().Any(row =>
        //                row.Field<int>("LocItemID") == locItemId); //&&
        //                //row.Field<string>("RequestNO") == requestNo);

        //            if (isAlreadyMoved)
        //            {
        //                MessageBox.Show("This row has already been moved to the second grid.", "Duplicate Entry", MessageBoxButtons.OK, MessageBoxIcon.Warning);
        //                return; // Exit the function without moving the row
        //            }

        //            // Call the stored procedure to check the condition
        //            bool isConditionMet = await _mrvDapperRepository.CheckMrvConditionAsync(locItemId, companyId);

        //            if (isConditionMet)
        //            {
        //                // If condition is met, move the row to gridControl2
        //                DataRow newRow = dt2.NewRow();

        //                // Copy values from selected row in gridControl1 to gridControl2
        //                newRow["LocItemID"] = locItemId;
        //                newRow["ItemId"] = gridView1.GetRowCellValue(selectedRowHandle, "ItemId");
        //                //newRow["RequestNO"] = requestNo;
        //                newRow["DelMivQty"] = gridView1.GetRowCellValue(selectedRowHandle, "TotalDelMivQty");
        //                //newRow["DelRejMivQty"] = gridView1.GetRowCellValue(selectedRowHandle, "TotalDelMivRejQty");
        //                //newRow["DelMrvQty"] = gridView1.GetRowCellValue(selectedRowHandle, "DelMrvQty");
        //                newRow["MrvAvailableQty"] = gridView1.GetRowCellValue(selectedRowHandle, "MrvAvailableQty");
        //                newRow["Tag"] = gridView1.GetRowCellValue(selectedRowHandle, "Tag");
        //                newRow["Description"] = gridView1.GetRowCellValue(selectedRowHandle, "Description");
        //                //newRow["MRCNO"] = gridView1.GetRowCellValue(selectedRowHandle, "MRCNO");
        //                newRow["UnitName"] = gridView1.GetRowCellValue(selectedRowHandle, "UnitName");
        //                //newRow["LastLocation"] = gridView1.GetRowCellValue(selectedRowHandle, "LocationName");

        //                dt2.Rows.Add(newRow);
        //                gridControl2.DataSource = dt2;
        //                ConfigureGridControl2Columns();

        //            }
        //            else
        //            {
        //                MessageBox.Show("The condition is not met for moving this row.", "Condition Not Met", MessageBoxButtons.OK, MessageBoxIcon.Warning);
        //            }
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        MessageBox.Show($"An error occurred: {ex.Message}", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
        //    }
        //}

        private async void btnSendForward_Click(object sender, EventArgs e)
        {
            try
            {
                // Get selected row from gridControl1
                var selectedRowHandle = gridView1.FocusedRowHandle;
                if (selectedRowHandle >= 0) // Check if a row is selected
                {
                    // Get the values for LocItemID and RequestNO
                    int locItemId = (int)gridView1.GetRowCellValue(selectedRowHandle, "LocItemID");
                    decimal mrvAvailableQty = Convert.ToDecimal(gridView1.GetRowCellValue(selectedRowHandle, "MrvHmvAvailableQty"));
                    string requestNO = gridView1.GetRowCellValue(selectedRowHandle, "RequestNO").ToString();
                    int companyId = Convert.ToInt32(lookUpEdit1.EditValue);

                    // Check if MrvAvailableQty is greater than 0
                    if (mrvAvailableQty <= 0)
                    {
                        MessageBox.Show("MrvAvailableQty must be greater than 0 to move the row.", "Invalid Quantity", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                        return; // Exit the function without moving the row
                    }

                    // Get the current data source of gridControl2
                    DataTable dt2 = gridControl2.DataSource as DataTable ?? CreateGridControl2Table();
                    // Call this method when setting up gridControl2 after adding data to it

                    // Check if the row is already present in gridControl2
                    bool isAlreadyMoved = dt2.AsEnumerable().Any(row =>
                        row.Field<int>("LocItemID") == locItemId &&
                        row.Field<string>("RequestNO") == requestNO);

                    if (isAlreadyMoved)
                    {
                        MessageBox.Show("This row has already been moved to the second grid.", "Duplicate Entry", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                        return; // Exit the function without moving the row
                    }


                    // Call the stored procedure to check the condition
                    bool isConditionMet = await  _serviceProvider.GetService<IMrvDapperRepository>()!.CheckMrvConditionAsync(locItemId, companyId, requestNO);

                    if (isConditionMet)
                    {
                        // If condition is met, move the row to gridControl2
                        DataRow newRow = dt2.NewRow();

                        // Copy values from selected row in gridControl1 to gridControl2
                        newRow["LocItemID"] = locItemId;
                        newRow["ItemId"] = gridView1.GetRowCellValue(selectedRowHandle, "ItemId");
                        newRow["RequestNO"] = gridView1.GetRowCellValue(selectedRowHandle, "RequestNO");
                        newRow["TypeName"] = gridView1.GetRowCellValue(selectedRowHandle, "TypeName");
                        newRow["DelMivQty"] = gridView1.GetRowCellValue(selectedRowHandle, "TotalDelMivQty");
                        newRow["MrvHmvAvailableQty"] = mrvAvailableQty;
                        newRow["Tag"] = gridView1.GetRowCellValue(selectedRowHandle, "Tag");
                        newRow["Description"] = gridView1.GetRowCellValue(selectedRowHandle, "Description");
                        newRow["UnitName"] = gridView1.GetRowCellValue(selectedRowHandle, "UnitName");

                        dt2.Rows.Add(newRow);
                        gridControl2.DataSource = dt2;
                        ConfigureGridControl2Columns();
                    }
                    else
                    {
                        MessageBox.Show("The condition is not met for moving this row.", "Condition Not Met", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show($"An error occurred: {ex.Message}", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void gridView2_CellValueChanged(object sender, DevExpress.XtraGrid.Views.Base.CellValueChangedEventArgs e)
        {
            if (e.Column.FieldName == "ReturnedQty" || e.Column.FieldName == "ReturnedDelQty" || e.Column.FieldName == "ReturnedRejQty")
            {
                // دریافت اطلاعات ردیف فعلی
                int currentRow = e.RowHandle;

                // دریافت مقادیر مربوطه
                decimal ReturnedQty = gridView2.GetRowCellValue(currentRow, "ReturnedQty") != DBNull.Value
                     ? Convert.ToDecimal(gridView2.GetRowCellValue(currentRow, "ReturnedQty"))
                     : 0m;
                //decimal delMivQty = Convert.ToDecimal(gridView2.GetRowCellValue(currentRow, "DelMivQty"));
                //decimal delMrvQty = Convert.ToDecimal(gridView2.GetRowCellValue(currentRow, "DelMrvQty"));
                decimal delMrvRejQty = Convert.ToDecimal(gridView2.GetRowCellValue(currentRow, "DelMrvRejQty"));
                decimal mrvAvailableQty = Convert.ToDecimal(gridView2.GetRowCellValue(currentRow, "MrvHmvAvailableQty"));
                decimal ReturnedDelQty = gridView2.GetRowCellValue(currentRow, "ReturnedDelQty") != DBNull.Value
                    ? Convert.ToDecimal(gridView2.GetRowCellValue(currentRow, "ReturnedDelQty"))
                    : 0m;
                decimal ReturnedRejQty = gridView2.GetRowCellValue(currentRow, "ReturnedRejQty") != DBNull.Value
                    ? Convert.ToDecimal(gridView2.GetRowCellValue(currentRow, "ReturnedRejQty"))
                    : 0m;

                // محاسبه مقدار مجاز
                decimal allowedQty = (ReturnedDelQty + ReturnedRejQty);//delMrvQty + delMrvRejQty;

                // بررسی شرط
                if (mrvAvailableQty < allowedQty)
                {
                    // Temporarily disable the event handler to avoid a loop
                    gridView2.CellValueChanged -= gridView2_CellValueChanged;

                    //MessageBox.Show("Returned Qty must be less than or equal to DelMivQty - (DelMrvQty + DelMrvRejQty + ReturnedDelQty + ReturnedRejQty).", "Invalid Input", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    MessageBox.Show("Returned Qty  (ReturnedDelQty + ReturnedRejQty) must be less than or equal to MrvHmvAvailableQty.", "Invalid Input", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    //MessageBox.Show("Returned Qty  (ReturnedDelQty) must be less than or equal to MrvAvailableQty.", "Invalid Input", MessageBoxButtons.OK, MessageBoxIcon.Warning);

                    // Reset to 0 or another appropriate action
                    gridView2.SetRowCellValue(currentRow, "ReturnedQty", 0);
                    gridView2.SetRowCellValue(currentRow, "ReturnedDelQty", 0);
                    gridView2.SetRowCellValue(currentRow, "ReturnedRejQty", 0);

                    // Re-enable the event handler
                    gridView2.CellValueChanged += gridView2_CellValueChanged;
                }
            }
        }


        private void btnSendBack_Click(object sender, EventArgs e)
        {
            try
            {
                // Check if a row is selected in gridControl2
                if (gridView2.SelectedRowsCount > 0)
                {
                    // Get the index of the selected row
                    int selectedRowIndex = gridView2.FocusedRowHandle;

                    // Remove the selected row from the grid
                    gridView2.DeleteRow(selectedRowIndex);
                }
                else
                {
                    MessageBox.Show("Please select a row to remove.", "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show($"An error occurred: {ex.Message}", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void locationlookupForm_EditValueChanged(object sender, EventArgs e)
        {
            try
            {
                // Get the selected LocationID from locationlookupForm
                int selectedLocationID = Convert.ToInt32(locationlookupForm.EditValue);

                if (selectedLocationID == 0)
                {
                    MessageBox.Show("Please select a valid location.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return;
                }

                // Get the current DataTable from gridControl2
                DataTable dt2 = gridControl2.DataSource as DataTable;

                // Check if the DataTable is null or empty, and return if no rows are found
                if (dt2 == null || dt2.Rows.Count == 0)
                {
                    // No data in gridControl2, so we do nothing and return
                    return;
                }

                // Iterate through each row in gridControl2 and update LocationID
                foreach (DataRow row in dt2.Rows)
                {
                    // Update the SelectedLocation column with the new selected location ID
                    row["SelectedLocation"] = selectedLocationID;
                }

                // Refresh the gridControl2 to reflect the updated values
                gridControl2.RefreshDataSource();
            }
            catch (Exception ex)
            {
                MessageBox.Show($"An error occurred: {ex.Message}", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private async void btnInsertMrv_Click(object sender, EventArgs e)
        {
            try
            {
                // Convert to int after ensuring selection
                int companyId = Convert.ToInt32(lookUpEdit1.EditValue);
                int contractId = Convert.ToInt32(lookUpEdit2.EditValue);

                // Check if there are any rows in the grid
                if (gridView2.RowCount == 0)
                {
                    MessageBox.Show("There are no rows in the grid to insert.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    return; // Stop execution if the grid is empty
                }

                string mrvNo = txtMrvNo.Text.Trim();
                if (string.IsNullOrEmpty(mrvNo))
                {
                    MessageBox.Show("Please enter the MRV number.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    txtMrvNo.Focus();
                    return;
                }
              
                // بررسی تکراری بودن شماره Mrv
                bool isDuplicate = await _serviceProvider.GetService<IMrvDapperRepository>()!.CheckMrvNameAsync(companyId, mrvNo);

                if (isDuplicate)
                {
                    var dialogResult = MessageBox.Show("The MRV number is duplicate. Do you want to continue?", "Duplicate MRV Number",
                                                        MessageBoxButtons.YesNo, MessageBoxIcon.Warning);

                    if (dialogResult == DialogResult.No)
                    {
                        // کاربر تصمیم به ادامه ندادن گرفته است
                        return;
                    }
                }


                // Check if companyId is selected
                if (lookUpEdit1.EditValue == null)
                {
                    MessageBox.Show("Please select a company.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    lookUpEdit1.Focus();
                    return;
                }

                // Check if contractId is selected
                if (lookUpEdit2.EditValue == null)
                {
                    MessageBox.Show("Please select a contract.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    lookUpEdit2.Focus();
                    return;
                }

                

                int areaUnitId = 1; // Hardcoded as per your instruction
                int issuedBy = _session.UserID; // Assuming this is defined elsewhere
                DateTime delDate = dateEdit1.EditValue != null ? Convert.ToDateTime(dateEdit1.EditValue) : DateTime.Today;

                // Create a list of NewMrvDto objects
                var requestMrvs = new List<NewMrvDto>();

                for (int i = 0; i < gridView2.RowCount; i++)
                {
                    var selectedLocation = gridView2.GetRowCellValue(i, "SelectedLocation") != DBNull.Value
                        ? Convert.ToInt32(gridView2.GetRowCellValue(i, "SelectedLocation"))
                        : 0;  // Set to 0 if null

                    // Check if the location is missing
                    if (selectedLocation == 0)
                    {
                        MessageBox.Show($"Row {i + 1} does not have a location selected. Please select a location.", "Missing Location", MessageBoxButtons.OK, MessageBoxIcon.Warning);

                        // Navigate to LocationLookupForm
                        locationlookupForm.Focus();
                        // Stop further processing
                        return;
                    }
                    // Check ReturnedQty (ReqMrvQty)
                    decimal returnedQty = gridView2.GetRowCellValue(i, "ReturnedQty") != DBNull.Value
                        ? Convert.ToDecimal(gridView2.GetRowCellValue(i, "ReturnedQty"))
                        : 0m;
                    decimal returnedDelQty = gridView2.GetRowCellValue(i, "ReturnedDelQty") != DBNull.Value
                        ? Convert.ToDecimal(gridView2.GetRowCellValue(i, "ReturnedDelQty"))
                        : 0m;
                    decimal returnedRejQty = gridView2.GetRowCellValue(i, "ReturnedRejQty") != DBNull.Value
                        ? Convert.ToDecimal(gridView2.GetRowCellValue(i, "ReturnedRejQty"))
                        : 0m;

                    // If ReturnedQty is 0, either ReturnedDelQty or ReturnedRejQty must be non-zero
                    if (returnedQty == 0m)
                    {
                        if (returnedDelQty == 0m && returnedRejQty == 0m)
                        {
                            MessageBox.Show($"Row {i + 1}: 'ReturnedQty' is 0. Either 'ReturnedDelQty' or 'ReturnedRejQty' must have a value.", "Missing Required Field", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                            //MessageBox.Show($"Row {i + 1}: 'ReturnedQty' is 0. Either 'ReturnedDelQty' must have a value.", "Missing Required Field", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                            return; // Stop execution
                        }
                    }

                    //If ReturnedDelQty is 0, ReturnedRejQty must have a value
                    if (returnedDelQty == 0m && returnedRejQty == 0m)
                    {
                        MessageBox.Show($"Row {i + 1}: 'ReturnedDelQty' is 0. 'ReturnedRejQty' must have a value.", "Missing Required Field", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                        //MessageBox.Show($"Row {i + 1}: 'ReturnedDelQty' must have a value.", "Missing Required Field", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                        return; // Stop execution
                    }

                    var newMrvDto = new NewMrvDto
                    {
                        LocItemID = Convert.ToInt32(gridView2.GetRowCellValue(i, "LocItemID")),
                        ReqMrvQty = gridView2.GetRowCellValue(i, "ReturnedQty") != DBNull.Value
                                    ? Convert.ToDecimal(gridView2.GetRowCellValue(i, "ReturnedQty"))
                                    : 0m,
                        DelMrvQty = gridView2.GetRowCellValue(i, "ReturnedDelQty") != DBNull.Value
                                    ? Convert.ToDecimal(gridView2.GetRowCellValue(i, "ReturnedDelQty"))
                                    : 0m,
                        DelMrvRejQty = gridView2.GetRowCellValue(i, "ReturnedRejQty") != DBNull.Value
                                   ? Convert.ToDecimal(gridView2.GetRowCellValue(i, "ReturnedRejQty"))
                                   : 0m,
                        Remark = gridView2.GetRowCellValue(i, "Remark")?.ToString() ?? string.Empty,
                        RequestNO = gridView2.GetRowCellValue(i, "RequestNO")?.ToString() ?? string.Empty,
                        typeName = gridView2.GetRowCellValue(i, "TypeName")?.ToString() ?? string.Empty,
                        SelectedLocation = selectedLocation
                    };

                    // Add to the list
                    requestMrvs.Add(newMrvDto);
                }

                // Call the InsertMrvBatchAsync method to insert the batch
                string newMrvNumber = await  _serviceProvider.GetService<IMrvDapperRepository>()!.InsertMrvBatchAsync(companyId, contractId, mrvNo, areaUnitId, issuedBy, delDate, requestMrvs);
                //MessageBox.Show(newMrvNumber);
                txtMrvNo.Text = "";
                lookUpEdit1_EditValueChanged(null, null);
                //lookUpEdit1.Refresh();
                //gridControl2.DataSource = null;
                //gridView2.Columns.Clear();
                // Display the  new MRV number
                MessageBox.Show($"New MRV created with number: MRV-{newMrvNumber}", "Success", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            catch (Exception ex)
            {
                // Handle errors
                MessageBox.Show($"Error: {ex.Message}", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

    }
}