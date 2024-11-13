using AWMS.app.Forms.frmSmall;
using AWMS.app.Forms.RibbonUser;
using AWMS.core.Interfaces;
using AWMS.dapper.Repositories;
using AWMS.dto;
using DevExpress.XtraEditors;
using Microsoft.Extensions.DependencyInjection;
using System.IO;

namespace AWMS.app.Forms.RibbonChange
{
    public partial class frmChangeLocation : XtraForm
    {
        private readonly IServiceProvider _serviceProvider;
        private readonly UserSession _session; // اضافه کردن UserSession
        public frmChangeLocation(IServiceProvider serviceProvider, int? userId = null)
        {
            InitializeComponent();
            _serviceProvider = serviceProvider;
            // اگر UserId پاس داده نشده بود، مقدار پیش‌فرض 1 استفاده می‌شود
            int finalUserId = userId ?? 1;
            _session = SessionManager.GetSession(finalUserId);
            initGrid();
        }

        private async void LoadDataIntoGrid3()
        {
            try
            {
                gridControl1.DataSource = await _serviceProvider.GetService<ICompanyService>()!.GetAllCompaniesNameAsync();
                lookUpEditlocation.Properties.DataSource = _serviceProvider.GetService<ILocationDapperRepository>()!.GetAllLocLocationChange();
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
            LoadDataIntoGrid3();
        }
        private void labelControl4_Click_1(object sender, EventArgs e)
        {
            btnRefreshArchiveNO_Click(null, null);
        }

        private void btnRefreshArchiveNO_Click(object sender, EventArgs e)
        {
            // ذخیره کردن شاخص ردیف فوکوس‌شده فعلی
            int focusedRowHandle = gridView1.FocusedRowHandle;

            // رفرش کردن گرید
            initGrid();

            // بررسی اینکه آیا ردیف قبلی هنوز موجود است و بازگرداندن فوکوس به آن
            if (focusedRowHandle >= 0 && focusedRowHandle < gridView1.RowCount)
            {
                gridView1.FocusedRowHandle = focusedRowHandle;
            }

            // نمایش پیام بعد از رفرش
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


        private async void simpleButton3_Click_1(object sender, EventArgs e)
        {
            // Get values from textboxes
            string locationName = txtLocation.Text.Trim();
            string locationWarehouse = txtWarehouse.Text.Trim();

            // Check if the input values are not empty
            if (string.IsNullOrWhiteSpace(locationName) || string.IsNullOrWhiteSpace(locationWarehouse))
            {
                MessageBox.Show("Please fill in all the fields.");
                return;
            }


            // Create DTO to send to AddAsync method
            var locationDto = new InsertLocationDto
            {
                LocationName = locationName,
                LocationWarehouse = locationWarehouse,
                EnteredBy = _session.UserID, // Use UserId from session
                EnteredDate = DateTime.Now // Current date as entered date
            };

            try
            {
                // Save the information using AddAsync method
                await _serviceProvider.GetService<ILocationDapperRepository>()!.AddAsync(locationDto);
                MessageBox.Show("New location has been successfully saved.");
                lookUpEditlocation.Properties.DataSource = _serviceProvider.GetService<ILocationDapperRepository>()!.GetAllLocLocationChange();
                txtLocation.Text = "";
            }
            catch (Exception ex)
            {
                // Handle errors
                MessageBox.Show($"Error saving data: {ex.Message}");
            }
        }


        private async Task<bool> ValidateQtyAndBalance()
        {
            // Check if txtQty is enabled and contains a numeric value
            if (txtQty.Enabled && !string.IsNullOrWhiteSpace(txtQty.Text) && decimal.TryParse(txtQty.Text, out decimal qtyValue))
            {
                // Get selected row from GridView (assuming gridView1 is your GridView)
                int selectedRowHandle = gridView1.FocusedRowHandle;
                if (selectedRowHandle >= 0) // Check if any row is selected
                {
                    // Get the 'Balance' value from the selected row (assuming 'Balance' is the column name)
                    decimal balanceValue = (decimal)gridView1.GetRowCellValue(selectedRowHandle, "Balance");
                    if (qtyValue == 0)
                    {
                        MessageBox.Show("The balance quantity in the textbox cannot be '0'. Please enter a quantity or amount you want to move, considering the unit and the available stock (Balance) at the current location", "Validation Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                        return false;
                    }
                    // Check if balance is greater than zero
                    if (balanceValue > 0)
                    {
                        // Check if qtyValue is valid compared to balanceValue
                        if (qtyValue <= balanceValue)
                        {
                            // Check if the location is selected (lookUpEditLocation is used to select a location)
                            if (lookUpEditlocation.EditValue == null)
                            {
                                MessageBox.Show("Please select a valid location.", "Validation Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                                return false;
                            }

                            // Get the ItemId and existing LocItemID from the selected row
                            int itemId = (int)gridView1.GetRowCellValue(selectedRowHandle, "ItemId");
                            int locItemId = (int)gridView1.GetRowCellValue(selectedRowHandle, "LocItemID");
                            int locationfeli = (int)gridView1.GetRowCellValue(selectedRowHandle, "LocationID");
                            decimal MrvOrNot = (decimal)gridView1.GetRowCellValue(selectedRowHandle, "QtyInLoc");

                            if ((int)lookUpEditlocation.EditValue == locationfeli)
                            {
                                MessageBox.Show("The selected location is the same as the current location.", "Validation Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                                return false;
                            }

                            // Deduct the entered quantity from the current balance
                            decimal newBalance = balanceValue - qtyValue;

                            // Get the selected LocationID
                            int locationId = (int)lookUpEditlocation.EditValue;

                            // Call the stored procedure to update balance and add new LocItem
                            string result = await _serviceProvider.GetService<IChangeDapperRepository>()!.UpdateBalanceAndAddLocItem(itemId, locItemId, qtyValue, locationId, _session.UserID, MrvOrNot);

                            if (result == "Success")
                            {
                                // Update the balance in the current row (assuming you have the appropriate column)
                                gridView1.SetRowCellValue(selectedRowHandle, "Balance", newBalance);
                            }
                            else
                            {
                                MessageBox.Show(result); // نمایش پیغام خطا
                                return false; // عملیات ناموفق
                            }
                        }
                        else
                        {
                            MessageBox.Show("The entered quantity exceeds the available balance.");
                            return false; // Return false if qty exceeds balance
                        }
                    }
                    else
                    {
                        MessageBox.Show("The selected item has no available balance.");
                        return false; // Return false if balance is zero or less
                    }
                }
                else
                {
                    MessageBox.Show("No row selected in the grid.");
                    return false; // Return false if no row is selected
                }
            }
            //else { MessageBox.Show("ddddddddddddddddddd"); }

            return true; // If qty is not enabled or no need to validate, return true
        }

        private async void btnChangeLoc_Click(object sender, EventArgs e)
        {
            // Check if a location is selected in lookUpEditLocation
            if (lookUpEditlocation.EditValue == null)
            {
                MessageBox.Show("Please select a location.");
                return;
            }

            // Get the selected LocationId from lookUpEditLocation
            int selectedLocationId = (int)lookUpEditlocation.EditValue;

            // Check if any rows are selected in gridView1
            if (gridView1.SelectedRowsCount == 0)
            {
                MessageBox.Show("Please select at least one row.");
                return;
            }

            // Get the number of selected rows
            int selectedRowsCount = gridView1.SelectedRowsCount;

            // If only one row is selected, enable txtQty and perform validation
            if (selectedRowsCount == 1)
            {
                // Enable txtQty for single-row selection
                txtQty.Enabled = true;

                // Validate quantity and balance
                bool isValid = await ValidateQtyAndBalance();
                if (!isValid)
                {
                    // If validation fails, stop further execution
                    return;
                }

                // If validation succeeds, stop further execution and return
                MessageBox.Show("Operation was successful.");
                return;
            }
            else
            {
                // If more than one row is selected, disable txtQty and skip validation
                txtQty.Enabled = false;
            }

            // Show confirmation message to the user for multiple row selections
            var result = MessageBox.Show($"You have selected {selectedRowsCount} rows for location change. Are you sure you want to proceed?",
                                         "Confirm Location Change", MessageBoxButtons.YesNo, MessageBoxIcon.Question);

            // If user selects 'No', return without making changes
            if (result == DialogResult.No)
            {
                return;
            }

            // Iterate through selected rows and get LocItemID for each row
            List<int> locItemIds = new List<int>();
            for (int i = 0; i < gridView1.SelectedRowsCount; i++)
            {
                int selectedRowHandle = gridView1.GetSelectedRows()[i];
                if (selectedRowHandle >= 0)
                {
                    int locItemId = (int)gridView1.GetRowCellValue(selectedRowHandle, "LocItemID"); // Assuming "LocItemID" is the column name
                    locItemIds.Add(locItemId);
                }
            }

            // Call the stored procedure to update the LocationId for the selected LocItemIDs
            try
            {
                var resulty = await _serviceProvider.GetService<IChangeDapperRepository>()!.UpdateLocItemsLocationAsync(locItemIds, selectedLocationId, _session.UserID);

                // بررسی نتیجه و نمایش پیام بر اساس وضعیت
                if (resulty == "Success: Location updated successfully.")
                {
                    // Update only the selected rows in the GridView
                    for (int i = 0; i < selectedRowsCount; i++)
                    {
                        int selectedRowHandle = gridView1.GetSelectedRows()[i];
                        if (selectedRowHandle >= 0)
                        {
                            gridView1.SetRowCellValue(selectedRowHandle, "LocationName", lookUpEditlocation.Text);
                            gridView1.SetRowCellValue(selectedRowHandle, "LocationID", selectedLocationId);
                        }
                    }
                    MessageBox.Show("Location updated successfully.");
                }
                else if (resulty.Contains("Error"))
                {
                    MessageBox.Show(resulty, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Error updating location: {ex.Message}");
            }

        }


        private void gridView1_SelectionChanged(object sender, DevExpress.Data.SelectionChangedEventArgs e)
        {
            // Get the number of selected rows in the GridView
            int selectedRowsCount = gridView1.SelectedRowsCount;

            // Check if more than one row is selected
            if (selectedRowsCount > 1)
            {
                // Disable the TextBox if more than one row is selected
                txtQty.Enabled = false;
                btnMivList.Enabled = false;
                btnNis.Enabled = false;
                txtNis.Enabled = false;
                panelControlRemarkLocitemid.Enabled = false;
            }
            else
            {
                // Enable the TextBox if one or no rows are selected
                txtQty.Enabled = true;
                btnMivList.Enabled = true;
                btnNis.Enabled = true;
                txtNis.Enabled = true;
                panelControlRemarkLocitemid.Enabled = true;
            }

        }
        private async void btnNis_Click(object sender, EventArgs e)
        {
            // بررسی مقدار NIS
            if (string.IsNullOrEmpty(txtNis.Text))
            {
                MessageBox.Show("Please enter a value for NIS.");
                return;
            }

            decimal nisQty;
            if (!decimal.TryParse(txtNis.Text, out nisQty))
            {
                MessageBox.Show("Invalid NIS quantity. Please enter a valid number.");
                return;
            }

            // بررسی انتخاب ردیف در gridView
            if (gridView1.SelectedRowsCount == 0)
            {
                MessageBox.Show("Please select a row.");
                return;
            }

            int selectedRowHandle = gridView1.GetSelectedRows()[0];
            if (selectedRowHandle < 0)
            {
                MessageBox.Show("Please select a valid row.");
                return;
            }

            int locItemId = (int)gridView1.GetRowCellValue(selectedRowHandle, "LocItemID");
            decimal currentBalance = Convert.ToDecimal(gridView1.GetRowCellValue(selectedRowHandle, "Balance"));

            try
            {
                // فراخوانی متد برای به‌روزرسانی NISQty
                await _serviceProvider.GetService<IChangeDapperRepository>()!.UpdateNisQtyAsync(locItemId, nisQty, currentBalance);

                // به‌روزرسانی GridView
                gridView1.SetRowCellValue(selectedRowHandle, "NISQty", nisQty);
                //gridView1.SetRowCellValue(selectedRowHandle, "Balance", currentBalance - nisQty);

                MessageBox.Show("NIS quantity updated successfully.");
            }
            catch (ApplicationException ex)
            {
                // نمایش پیام خطا
                MessageBox.Show(ex.Message);
            }
            catch (Exception ex)
            {
                MessageBox.Show($"An error occurred: {ex.Message}");
            }
        }

        private async void btnDate_Click(object sender, EventArgs e)
        {
            // بررسی اینکه آیا تاریخی در txtDate وارد شده است
            if (string.IsNullOrEmpty(txtDate.Text))
            {
                MessageBox.Show("Please enter a valid expire date.");
                return;
            }

            DateTime expireDate;
            if (!DateTime.TryParse(txtDate.Text, out expireDate))
            {
                MessageBox.Show("Invalid date format. Please enter a valid date.");
                return;
            }

            // گرفتن آیتم‌های انتخاب‌شده از GridView
            List<int> selectedItemIds = new List<int>();
            foreach (int rowHandle in gridView1.GetSelectedRows())
            {
                if (rowHandle >= 0)
                {
                    int itemId = (int)gridView1.GetRowCellValue(rowHandle, "ItemId");
                    selectedItemIds.Add(itemId);
                }
            }

            if (selectedItemIds.Count == 0)
            {
                MessageBox.Show("Please select at least one item.");
                return;
            }

            try
            {
                // فراخوانی متد برای به‌روزرسانی ExpireDate
                await _serviceProvider.GetService<IChangeDapperRepository>()!.UpdateExpireDateAsync(selectedItemIds, expireDate);

                // به‌روزرسانی GridView با تاریخ جدید
                foreach (int rowHandle in gridView1.GetSelectedRows())
                {
                    gridView1.SetRowCellValue(rowHandle, "ExpireDate", expireDate);
                }

                MessageBox.Show("Expire dates updated successfully.");
            }
            catch (ApplicationException ex)
            {
                MessageBox.Show(ex.Message);
            }
            catch (Exception ex)
            {
                MessageBox.Show($"An error occurred: {ex.Message}");
            }
        }

        private void btnMivList_Click(object sender, EventArgs e)
        {
            // بررسی اینکه آیا ردیفی انتخاب شده است یا نه
            if (gridView1.FocusedRowHandle >= 0)
            {
                // گرفتن LocItemID از ردیف انتخاب‌شده
                int locItemId = (int)gridView1.GetRowCellValue(gridView1.FocusedRowHandle, "LocItemID");

                var frmMIvListForm = ActivatorUtilities.CreateInstance<frmMIvList>(_serviceProvider, locItemId);//, _userContext.UserId);
                frmMIvListForm.ShowDialog();
                //// ایجاد و باز کردن فرم جدید با ارسال LocItemID به آن
                //frmMIvList requestForm = new frmMIvList(locItemId);
                //requestForm.Show();
            }
            else
            {
                // نمایش پیام اگر هیچ ردیفی انتخاب نشده باشد
                MessageBox.Show("Please select a row first.");
            }
        }
        private async Task<bool> AddRemarkLocitemID()
        {
            // Check if txtQty is enabled and contains a numeric value
            if (panelControlRemarkLocitemid.Enabled && !string.IsNullOrWhiteSpace(txtRemarkLocitemID.Text))
            {
                // Get selected row from GridView (assuming gridView1 is your GridView)
                int selectedRowHandle = gridView1.FocusedRowHandle;
                if (selectedRowHandle >= 0) // Check if any row is selected
                {


                    // Get the ItemId and existing LocItemID from the selected row
                    int itemId = (int)gridView1.GetRowCellValue(selectedRowHandle, "ItemId");
                    int locItemId = (int)gridView1.GetRowCellValue(selectedRowHandle, "LocItemID");

                    // Call the stored procedure to update balance and add new LocItem
                    string result = await _serviceProvider.GetService<IChangeDapperRepository>()!.UpdateRemarkLocItemID(itemId, locItemId, txtRemarkLocitemID.Text, _session.UserID);

                    if (result == "Success")
                    {
                        // Update the balance in the current row (assuming you have the appropriate column)
                        gridView1.SetRowCellValue(selectedRowHandle, "RemarkLocitemID", txtRemarkLocitemID.Text);
                    }
                    else
                    {
                        MessageBox.Show(result); // نمایش پیغام خطا
                        return false; // عملیات ناموفق
                    }

                }
                else
                {
                    MessageBox.Show("PLease Enter Valid Remark");
                    return false; // Return false if no row is selected
                }
            }

            return true;
        }
        private async void simpleButton2_Click_1(object sender, EventArgs e)
        {
            // Get the number of selected rows
            int selectedRowsCount = gridView1.SelectedRowsCount;

            // If only one row is selected, enable txtQty and perform validation
            if (selectedRowsCount == 1)
            {
                // Enable txtQty for single-row selection
                panelControlRemarkLocitemid.Enabled = true;

                // Validate quantity and balance
                bool isValid = await AddRemarkLocitemID();
                if (!isValid)
                {
                    // If validation fails, stop further execution
                    return;
                }

                // If validation succeeds, stop further execution and return
                MessageBox.Show("Operation was successful. Remark is Added To LocitemID");
                return;
            }
            else
            {
                // If more than one row is selected, disable txtQty and skip validation
                panelControlRemarkLocitemid.Enabled = false;
            }
        }

    }
}
