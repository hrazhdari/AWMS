using AWMS.app.Forms.RibbonUser;
using AWMS.core.Interfaces;
using AWMS.dapper;
using AWMS.dapper.Repositories;
using AWMS.dto;
using DevExpress.XtraEditors;
using DevExpress.XtraEditors.Repository;
using Microsoft.Extensions.DependencyInjection;
using System.Data;

namespace AWMS.app.Forms.RibbonVoucher
{
    public partial class frmHMV : XtraForm
    {
        private readonly IServiceProvider _serviceProvider;
        private readonly UserSession _session; // اضافه کردن UserSession
        public frmHMV(IServiceProvider serviceProvider, int? userId = null)
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
            lookUpEdit3.Properties.DataSource = await _serviceProvider.GetService<ICompanyService>()!.GetAllCompaniesNameAsync();
            lookUpEditAreaUnit.Properties.DataSource = await _serviceProvider.GetService<IAreaUnitService>()!.GetAllAreaUnitsAsync();

        }
        private async void lookUpEdit3_EditValueChanged(object sender, EventArgs e)
        {
            try
            {
                // Show null text
                lookUpEdit2.EditValue = null;
                // Load data asynchronously
                lookUpEdit2.Properties.DataSource = await Task.Run(() => _serviceProvider.GetService<IContractService>()!.GetAllContractsByCompanyidAsync(Convert.ToInt32(lookUpEdit3.EditValue)));
            }
            catch (Exception ex)
            {
                MessageBox.Show($"An error occurred: {ex.Message}", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
        private async void lookUpEdit1_EditValueChanged(object sender, EventArgs e)
        {
            try
            {
                // Show null text
                lookUpEdit4.EditValue = null;
                // Load data asynchronously
                lookUpEdit4.Properties.DataSource = await Task.Run(() => _serviceProvider.GetService<IContractService>()!.GetAllContractsByCompanyidAsync(Convert.ToInt32(lookUpEdit1.EditValue)));


                gridControl2.DataSource = null;
                gridView2.Columns.Clear();

                if (lookUpEdit1.EditValue != null)
                {
                    int companyId = Convert.ToInt32(lookUpEdit1.EditValue);

                    // Fetch data from the stored procedure
                    //var data = await _hmvDapperRepository.GetAllMaterialHmvableAsync(companyId);
                    var data = await _serviceProvider.GetService<IHmvDapperRepository>()!.GetAllMaterialHmvableAsync(companyId);

                    // Check if data is not empty
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

                        // Custom settings for HmvAvailableQty
                        var HmvAvailableQtyColumn = gridView1.Columns["MrvHmvAvailableQty"];
                        HmvAvailableQtyColumn.Visible = true;  // Make sure it's visible
                        HmvAvailableQtyColumn.OptionsColumn.AllowShowHide = false;  // Prevent the column from being hidden
                        HmvAvailableQtyColumn.AppearanceCell.BackColor = Color.IndianRed;  // Set the background color to purple
                        HmvAvailableQtyColumn.AppearanceCell.ForeColor = Color.White;  // Set the text color to white
                        HmvAvailableQtyColumn.AppearanceCell.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center;  // Center text in cells
                        HmvAvailableQtyColumn.AppearanceHeader.BackColor = Color.IndianRed;  // Set header background color to red
                        HmvAvailableQtyColumn.AppearanceHeader.ForeColor = Color.White;  // Set header text color to white

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
            //dt.Columns.Add("SelectedLocation", typeof(int)); // Column for selected location (as ID)
            dt.Columns.Add("HmvQty", typeof(decimal));  // Column for returned quantity
            dt.Columns.Add("HmvDelQty", typeof(decimal));  // Column for returned quantity
            dt.Columns.Add("HmvRejQty", typeof(decimal));  // Column for returned quantity
            dt.Columns.Add("Remark", typeof(string));  // Column for returned quantity

            return dt;
        }
        private void gridView2_RowCellStyle(object sender, DevExpress.XtraGrid.Views.Grid.RowCellStyleEventArgs e)
        {
            // وسط چین کردن تمام سلول‌ها
            e.Appearance.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center;


            // بررسی اینکه آیا ستون فعلی ReturnedQty است
            if (e.Column.FieldName == "HmvQty")
            {
                e.Appearance.BackColor = Color.LightBlue; // رنگ آبی لایت برای ReturnedQty
                e.Appearance.ForeColor = Color.Black;     // رنگ متن مشکی

                // تنظیمات برای ستون ReturnedQty
                gridView2.Columns["HmvQty"].AppearanceHeader.BackColor = Color.LightBlue;     // رنگ سر ستون همرنگ با رنگ ستون
                gridView2.Columns["HmvQty"].AppearanceCell.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center;  // وسط‌چین کردن محتوای سلول‌ها
            }

            // بررسی اینکه آیا ستون فعلی ReturnedQty است
            if (e.Column.FieldName == "HmvDelQty")
            {
                e.Appearance.BackColor = Color.LightGreen; // رنگ آبی لایت برای ReturnedQty
                e.Appearance.ForeColor = Color.Black;     // رنگ متن مشکی

                // تنظیمات برای ستون ReturnedQty
                gridView2.Columns["HmvDelQty"].AppearanceHeader.BackColor = Color.LightGreen;     // رنگ سر ستون همرنگ با رنگ ستون
                gridView2.Columns["HmvDelQty"].AppearanceCell.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center;  // وسط‌چین کردن محتوای سلول‌ها
            }           // بررسی اینکه آیا ستون فعلی ReturnedQty است
            if (e.Column.FieldName == "HmvRejQty")
            {
                e.Appearance.BackColor = Color.LightSalmon; // رنگ آبی لایت برای ReturnedQty
                e.Appearance.ForeColor = Color.Black;     // رنگ متن مشکی

                // تنظیمات برای ستون ReturnedQty
                gridView2.Columns["HmvRejQty"].AppearanceHeader.BackColor = Color.LightSalmon;     // رنگ سر ستون همرنگ با رنگ ستون
                gridView2.Columns["HmvRejQty"].AppearanceCell.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center;  // وسط‌چین کردن محتوای سلول‌ها
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

            // Configure the grid for numeric input (Returned Quantity)
            RepositoryItemSpinEdit returnedQtySpinEdit = new RepositoryItemSpinEdit();
            returnedQtySpinEdit.MinValue = 0;
            gridView2.Columns["HmvQty"].ColumnEdit = returnedQtySpinEdit;
            gridView2.Columns["HmvQty"].Caption = "Hmv Qty";

            RepositoryItemSpinEdit returnedQtySpinEdit2 = new RepositoryItemSpinEdit();
            returnedQtySpinEdit2.MinValue = 0;
            gridView2.Columns["HmvDelQty"].ColumnEdit = returnedQtySpinEdit2;
            gridView2.Columns["HmvDelQty"].Caption = "Hmv DelQty";

            RepositoryItemSpinEdit returnedQtySpinEdit3 = new RepositoryItemSpinEdit();
            returnedQtySpinEdit3.MinValue = 0;
            gridView2.Columns["HmvRejQty"].ColumnEdit = returnedQtySpinEdit3;
            gridView2.Columns["HmvRejQty"].Caption = "Hmv RejQty";

            // Apply other formatting options if needed (e.g., centering the text)
            foreach (DevExpress.XtraGrid.Columns.GridColumn column in gridView2.Columns)
            {
                column.AppearanceCell.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center;
                column.AppearanceHeader.TextOptions.HAlignment = DevExpress.Utils.HorzAlignment.Center;
            }

        }

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
                    decimal MrvHmvAvailableQty = Convert.ToDecimal(gridView1.GetRowCellValue(selectedRowHandle, "MrvHmvAvailableQty"));
                    string requestNO = gridView1.GetRowCellValue(selectedRowHandle, "RequestNO").ToString();
                    int companyId = Convert.ToInt32(lookUpEdit1.EditValue);

                    // Check if HmvAvailableQty is greater than 0
                    if (MrvHmvAvailableQty <= 0)
                    {
                        MessageBox.Show("MrvHmvAvailableQty must be greater than 0 to move the row.", "Invalid Quantity", MessageBoxButtons.OK, MessageBoxIcon.Warning);
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
                    bool isConditionMet = await _serviceProvider.GetService<IHmvDapperRepository>()!.CheckHmvConditionAsync(locItemId, companyId, requestNO);

                    if (isConditionMet)
                    {
                        // If condition is met, move the row to gridControl2
                        DataRow newRow = dt2.NewRow();

                        // Copy values from selected row in gridControl1 to gridControl2
                        newRow["LocItemID"] = locItemId;
                        newRow["ItemId"] = gridView1.GetRowCellValue(selectedRowHandle, "ItemId");
                        newRow["TypeName"] = gridView1.GetRowCellValue(selectedRowHandle, "TypeName");
                        newRow["RequestNO"] = gridView1.GetRowCellValue(selectedRowHandle, "RequestNO");
                        newRow["DelMivQty"] = gridView1.GetRowCellValue(selectedRowHandle, "TotalDelMivQty");
                        newRow["MrvHmvAvailableQty"] = MrvHmvAvailableQty;
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
            if (e.Column.FieldName == "HmvQty" || e.Column.FieldName == "HmvDelQty" || e.Column.FieldName == "HmvRejQty")
            {
                // دریافت اطلاعات ردیف فعلی
                int currentRow = e.RowHandle;

                // دریافت مقادیر مربوطه
                decimal HmvQty = gridView2.GetRowCellValue(currentRow, "HmvQty") != DBNull.Value
                     ? Convert.ToDecimal(gridView2.GetRowCellValue(currentRow, "HmvQty"))
                     : 0m;
                decimal HmvDelQty = gridView2.GetRowCellValue(currentRow, "HmvDelQty") != DBNull.Value
                    ? Convert.ToDecimal(gridView2.GetRowCellValue(currentRow, "HmvDelQty"))
                    : 0m;
                decimal HmvRejQty = gridView2.GetRowCellValue(currentRow, "HmvRejQty") != DBNull.Value
                    ? Convert.ToDecimal(gridView2.GetRowCellValue(currentRow, "HmvRejQty"))
                    : 0m;
                decimal MrvHmvAvailableQty = Convert.ToDecimal(gridView2.GetRowCellValue(currentRow, "MrvHmvAvailableQty"));
                // محاسبه مقدار مجاز
                decimal allowedQty = (HmvDelQty + HmvRejQty);

                // بررسی شرط
                if (MrvHmvAvailableQty < allowedQty)
                {
                    // Temporarily disable the event handler to avoid a loop
                    gridView2.CellValueChanged -= gridView2_CellValueChanged;


                    MessageBox.Show("Returned Qty  (HmvDelQty + HmvRejQty) must be less than or equal to MrvHmvAvailableQty.", "Invalid Input", MessageBoxButtons.OK, MessageBoxIcon.Warning);

                    // Reset to 0 or another appropriate action
                    gridView2.SetRowCellValue(currentRow, "HmvQty", 0);
                    gridView2.SetRowCellValue(currentRow, "HmvDelQty", 0);
                    gridView2.SetRowCellValue(currentRow, "HmvRejQty", 0);

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

        private async void btnInsertHmv_Click(object sender, EventArgs e)
        {
            // Convert to int after ensuring selection
            int companyId = Convert.ToInt32(lookUpEdit1.EditValue);
            int companyId2 = Convert.ToInt32(lookUpEdit3.EditValue);
            int contractId2 = Convert.ToInt32(lookUpEdit2.EditValue);
            int contractId = Convert.ToInt32(lookUpEdit4.EditValue);

            try
            {
                // Check if there are any rows in the grid
                if (gridView2.RowCount == 0)
                {
                    MessageBox.Show("There are no rows in the grid to insert.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    return; // Stop execution if the grid is empty
                }

                string hmvNo = txtHmvNo.Text.Trim();
                if (string.IsNullOrEmpty(hmvNo))
                {
                    MessageBox.Show("Please enter the HMV number.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    txtHmvNo.Focus();
                    return;
                }

              

                // بررسی تکراری بودن شماره HMV
                bool isDuplicate = await _serviceProvider.GetService<IHmvDapperRepository>()!.CheckHmvNameAsync(companyId, hmvNo);

                if (isDuplicate)
                {
                    var dialogResult = MessageBox.Show("The HMV number is duplicate. Do you want to continue?", "Duplicate HMV Number",
                                                        MessageBoxButtons.YesNo, MessageBoxIcon.Warning);

                    if (dialogResult == DialogResult.No)
                    {
                        // کاربر تصمیم به ادامه ندادن گرفته است
                        return;
                    }
                }

                // ادامه‌ی عملیات موردنظر در صورت تایید کاربر یا عدم وجود تکرار
               
                // Check if companyId is selected
                if (lookUpEdit1.EditValue == null)
                {
                    MessageBox.Show("\"Please select the company that intends to deliver materials to another contractor.\"", "Error", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    lookUpEdit1.Focus();
                    return;
                }
                // Check if companyId is selected
                if (lookUpEdit3.EditValue == null)
                {
                    MessageBox.Show("\"Please select the company that intends to receive materials from another contractor.\"", "Error", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    lookUpEdit3.Focus();
                    return;
                }

                // Check if contractId is selected
                if (lookUpEdit4.EditValue == null)
                {
                    MessageBox.Show("\"Please select the contract of the delivering company.\"", "Error", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    lookUpEdit4.Focus();
                    return;
                }
                // Check if contractId is selected
                if (lookUpEdit2.EditValue == null)
                {
                    MessageBox.Show("\"Please select the contract of the receiving company.\"", "Error", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    lookUpEdit2.Focus();
                    return;
                }

            

                int areaUnitId = 1; // Hardcoded as per your instruction
                int issuedBy = _session.UserID; // Assuming this is defined elsewhere
                DateTime delDate = dateEdit1.EditValue != null ? Convert.ToDateTime(dateEdit1.EditValue) : DateTime.Today;

                var requestHmvs = new List<NewHmvDto>();

                for (int i = 0; i < gridView2.RowCount; i++)
                {
                    decimal returnedQty = gridView2.GetRowCellValue(i, "HmvQty") != DBNull.Value
                        ? Convert.ToDecimal(gridView2.GetRowCellValue(i, "HmvQty"))
                        : 0m;
                    decimal returnedDelQty = gridView2.GetRowCellValue(i, "HmvDelQty") != DBNull.Value
                        ? Convert.ToDecimal(gridView2.GetRowCellValue(i, "HmvDelQty"))
                        : 0m;
                    decimal returnedRejQty = gridView2.GetRowCellValue(i, "HmvRejQty") != DBNull.Value
                        ? Convert.ToDecimal(gridView2.GetRowCellValue(i, "HmvRejQty"))
                        : 0m;

                    if (returnedQty == 0m)
                    {
                        if (returnedDelQty == 0m && returnedRejQty == 0m)
                        {
                            MessageBox.Show($"Row {i + 1}: 'HmvQty' is 0. Either 'HmvDelQty' or 'HmvRejQty' must have a value.", "Missing Required Field", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                            return; // Stop execution
                        }
                    }

                    if (returnedDelQty == 0m && returnedRejQty == 0m)
                    {
                        MessageBox.Show($"Row {i + 1}: 'HmvDelQty' is 0. 'HmvRejQty' must have a value.", "Missing Required Field", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                        return; // Stop execution
                    }

                    var newHmvDto = new NewHmvDto
                    {
                        LocItemID = Convert.ToInt32(gridView2.GetRowCellValue(i, "LocItemID")),
                        HmvQty = gridView2.GetRowCellValue(i, "HmvQty") != DBNull.Value
                                    ? Convert.ToDecimal(gridView2.GetRowCellValue(i, "HmvQty"))
                                    : 0m,
                        HmvDelQty = gridView2.GetRowCellValue(i, "HmvDelQty") != DBNull.Value
                                    ? Convert.ToDecimal(gridView2.GetRowCellValue(i, "HmvDelQty"))
                                    : 0m,
                        HmvRejQty = gridView2.GetRowCellValue(i, "HmvRejQty") != DBNull.Value
                                   ? Convert.ToDecimal(gridView2.GetRowCellValue(i, "HmvRejQty"))
                                   : 0m,
                        Remark = gridView2.GetRowCellValue(i, "Remark")?.ToString() ?? string.Empty,
                        RequestNO = gridView2.GetRowCellValue(i, "RequestNO")?.ToString() ?? string.Empty,
                        typeName = gridView2.GetRowCellValue(i, "TypeName")?.ToString() ?? string.Empty
                    };

                    // Add to the list
                    requestHmvs.Add(newHmvDto);
                }

                // Call the InsertHmvBatchAsync method to insert the batch
                string newHmvNumber = await _serviceProvider.GetService<IHmvDapperRepository>()!.InsertHmvBatchAsync(companyId, companyId2, contractId, contractId2, hmvNo, areaUnitId, issuedBy, delDate, requestHmvs);
                txtHmvNo.Text = "";
                lookUpEdit1_EditValueChanged(null, null);
                MessageBox.Show($"New HMV created with number: HMV-{newHmvNumber}", "Success", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            catch (Exception ex)
            {
                // Handle errors
                MessageBox.Show($"Error: {ex.Message}", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

    }
}