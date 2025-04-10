using AWMS.dapper.Repositories;
using AWMS.dto;
using DevExpress.XtraEditors;
using Microsoft.Extensions.DependencyInjection;
using Newtonsoft.Json;
using System;
using System.IO;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace AWMS.app.Forms.RibbonUser
{
    public partial class frmManageUser : XtraForm
    {
        private readonly IServiceProvider _serviceProvider;

        public frmManageUser(IServiceProvider serviceProvider)
        {
            InitializeComponent();
            _serviceProvider = serviceProvider;

            this.KeyDown += new KeyEventHandler(frmAddUser_KeyDown);
            this.AcceptButton = btnUpdateRolePermission;
            loadLookup();
            loaddatagrid();
        }

        private async void loaddatagrid()
        {
            repositoryItemLookUpEditRole.DataSource = await _serviceProvider.GetService<IUserDapperRepository>()!.GetAllRolesAsync();
            gridControl1.DataSource = await _serviceProvider.GetService<IUserDapperRepository>()!.GetAllUsersAsync();
        }

        // بارگذاری داده‌های مربوط به نقش‌ها
        private async void loadLookup()
        {
            var roles = await _serviceProvider.GetService<IUserDapperRepository>()!.GetAllRolesAsync();

            // فیلتر کردن یوزر Admin
            var filteredRoles = roles.Where(role => role.RoleName != "Admin").ToList();

            LookupRole.Properties.DataSource = filteredRoles;
            //LookupRole.Properties.DataSource = roles;
        }



        // مدیریت کلید Enter برای فشردن دکمه افزودن کاربر
        private void frmAddUser_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Enter)
            {
                btnAddUser_Click(sender, e);
            }
        }

        // بررسی تکراری بودن نام کاربری
        private async Task<bool> IsUsernameExistsAsync(string username)
        {
            var user = await _serviceProvider.GetService<IUserDapperRepository>()!.GetUserByUsernameAsync(username);
            return user != null;
        }

        // افزودن کاربر جدید
        private async void btnAddUser_Click(object sender, EventArgs e)
        {
            //string username = txtUserName.Text.Trim();
            //string password = txtPassword.Text.Trim();
            //var roleID = (int)LookupRole.EditValue;
            //string roleName = LookupRole.Text; // نام نقش برای نمایش

            //// Check if the username already exists
            //if (await IsUsernameExistsAsync(username))
            //{
            //    XtraMessageBox.Show("The entered username is already taken. Please choose a different username.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            //    return;
            //}

            //// Validate the inputs
            //if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(password))
            //{
            //    XtraMessageBox.Show("Please fill in all the fields.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            //    return;
            //}

            //// Show confirmation dialog with the entered details
            //string message = $"Please confirm the following details before saving:\n\n" +
            //                 $"Username: {username}\n" +
            //                 $"Role: {roleName}\n" +
            //                 $"RoleID: {roleID}\n" +
            //                 $"Password: {password}\n\n" + // نمایش پسورد (در محیط واقعی ممکن است این بخش حذف شود)
            //                 "Do you want to proceed?";
            //var confirmation = XtraMessageBox.Show(message, "Confirm Details", MessageBoxButtons.YesNo, MessageBoxIcon.Question);

            //if (confirmation != DialogResult.Yes)
            //{
            //    // If the user cancels, return without saving
            //    return;
            //}

            //// Create a new user model
            //var newUser = new UserDto
            //{
            //    Username = username,
            //    PasswordHash = password, // Storing the password as is, without hashing
            //    RoleID = roleID
            //};

            //// Add the new user to the database
            //var userId = await _serviceProvider.GetService<IUserDapperRepository>()!.AddUserAsync(newUser);

            //// Display success message
            //if (userId > 0)
            //{
            //    XtraMessageBox.Show("The new user has been successfully added.", "Success", MessageBoxButtons.OK, MessageBoxIcon.Information);
            //    // Optionally, you can close the form or clear the fields
            //    this.Close();
            //}
            //else
            //{
            //    XtraMessageBox.Show("There was an error adding the user.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            //}
        }

        private void panelControl1_Paint(object sender, PaintEventArgs e)
        {

        }

        private void chkAllowEdit_CheckedChanged(object sender, EventArgs e)
        {
            if (chkAllowEdit.Checked) { gridView1.OptionsBehavior.ReadOnly = false; } else { gridView1.OptionsBehavior.ReadOnly = true; }
        }

        private void simpleButton1_Click(object sender, EventArgs e)
        {
            SaveGridData("Excel Files|*.xlsx", "Save Excel File", fileName => gridView1.ExportToXlsx(fileName));
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

        private void LookupRole_EditValueChanged(object sender, EventArgs e)
        {
            // گرفتن RoleID انتخاب‌شده
            var roleId = (int)LookupRole.EditValue;

            // بارگذاری مجوزها برای RoleID
            LoadPermissions(roleId);
        }

        private readonly Dictionary<string, string> _ribbonToCheckboxMap = new Dictionary<string, string>
        {
            { "ribbonPage1", "checkEdit1" },
            { "ribbonPage3", "checkEdit2" },
            { "ribbonPage10", "checkEdit3" },
            { "ribbonPage8", "checkEdit4" },
            { "ribbonPage5", "checkEdit5" },
            { "ribbonPage6", "checkEdit6" },
            { "ribbonPage4", "checkEdit7" },
            { "ribbonPage9", "checkEdit8" },
            { "ribbonPage2", "checkEdit10" },
            { "ribbonPage7", "checkEdit9" },
            { "ribbonPage11", "checkEdit11" }
        };
        private IEnumerable<CheckBox> GetAllCheckBoxes(Control parent)
        {
            var checkboxes = parent.Controls.OfType<CheckBox>();

            foreach (Control child in parent.Controls)
            {
                checkboxes = checkboxes.Concat(GetAllCheckBoxes(child));
            }

            return checkboxes;
        }
        private IEnumerable<CheckEdit> GetAllCheckEdits(Control parent)
        {
            // گرفتن تمام CheckEdit ها در کنترل جاری
            var checkEdits = parent.Controls.OfType<CheckEdit>();

            // بازگشتی برای زیرکنترل‌ها
            foreach (Control child in parent.Controls)
            {
                checkEdits = checkEdits.Concat(GetAllCheckEdits(child));
            }

            return checkEdits;
        }

        private async void LoadPermissions(int roleId)
        {
            // گرفتن تمامی CheckEdit‌های موجود در پنل (و زیرپنل‌ها)
            var checkEdits = GetAllCheckEdits(panelControl1);

            // برداشتن تیک تمامی چک‌باکس‌ها
            foreach (var checkEdit in checkEdits)
            {
                checkEdit.Checked = false;
            }

            // دریافت Repository
            var repository = _serviceProvider.GetService<IUserDapperRepository>();

            // دریافت داده‌ها
            var permissions = await repository.GetPermissionsByRoleIdAsync(roleId);

            // بررسی داده‌های دریافت‌شده
            if (permissions == null || !permissions.Any())
            {
                MessageBox.Show("No permissions were retrieved from the database.", "Info", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return;
            }

            // نمایش داده‌های دریافت‌شده در کنسول
            //string permissionData = string.Join(Environment.NewLine, permissions.Select(p =>
            //    $"PermissionID: {p.PermissionID}, RoleID: {p.RoleID}, RibbonPageName: {p.RibbonPageName}, IsEnabled: {p.IsEnabled}"));
            //MessageBox.Show($"Permissions Retrieved:\n{permissionData}", "Info", MessageBoxButtons.OK, MessageBoxIcon.Information);

            // تنظیم وضعیت CheckEdit‌ها بر اساس داده‌های جدید
            foreach (var permission in permissions)
            {
                // بررسی نگاشت RibbonPageName به نام چک‌باکس
                if (_ribbonToCheckboxMap.TryGetValue(permission.RibbonPageName, out var checkEditName))
                {
                    // پیدا کردن CheckEdit مرتبط
                    var checkEdit = checkEdits.FirstOrDefault(c => c.Name == checkEditName);

                    // به‌روزرسانی وضعیت CheckEdit
                    if (checkEdit != null)
                    {
                        checkEdit.Checked = permission.IsEnabled;
                    }
                    else
                    {
                        MessageBox.Show($"CheckEdit with name {checkEditName} not found.");
                    }
                }
            }
        }

        //private async void btnUpdateRolePermission_Click(object sender, EventArgs e)
        //{
        //    // دریافت RoleID انتخاب‌شده
        //    if (LookupRole.EditValue == null)
        //    {
        //        MessageBox.Show("Please select a role before updating permissions.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
        //        return;
        //    }
        //    var roleId = (int)LookupRole.EditValue;

        //    // گرفتن تمامی CheckEdit‌های موجود در پنل (و زیرکنترل‌ها)
        //    var checkEdits = GetAllCheckEdits(panelControl1);

        //    // ساخت لیست از وضعیت چک‌باکس‌ها
        //    var permissionsToUpdate = checkEdits.Select(checkEdit =>
        //    {
        //        var ribbonPageName = _ribbonToCheckboxMap.FirstOrDefault(x => x.Value == checkEdit.Name).Key;
        //        return new
        //        {
        //            RoleID = roleId,
        //            RibbonPageName = ribbonPageName,
        //            IsEnabled = checkEdit.Checked
        //        };
        //    }).Where(permission => permission.RibbonPageName != null).ToList();

        //    // تبدیل به dynamic
        //    var dynamicPermissions = permissionsToUpdate.Cast<dynamic>().ToList();

        //    // بررسی اینکه آیا لیست خالی است
        //    if (!dynamicPermissions.Any())
        //    {
        //        MessageBox.Show("No permissions found to update.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
        //        return;
        //    }

        //    // نمایش داده‌ها در پیغام قبل از ادامه کار
        //    string dynamicPermissionsData = string.Join(Environment.NewLine, dynamicPermissions.Select(p =>
        //        $"RoleID: {p.RoleID}, RibbonPage: {p.RibbonPageName}, IsEnabled: {p.IsEnabled}"));

        //    MessageBox.Show($"Dynamic Permissions to be updated:\n{dynamicPermissionsData}", "Info", MessageBoxButtons.OK, MessageBoxIcon.Information);

        //    // ارسال داده‌ها به Stored Procedure
        //    var repository = _serviceProvider.GetService<IUserDapperRepository>();
        //    var result = await repository.UpdatePermissionsUsingStoredProcedureAsync(roleId, dynamicPermissions);

        //    // بررسی نتیجه
        //    if (result)
        //    {
        //        MessageBox.Show("Permissions have been successfully updated.", "Success", MessageBoxButtons.OK, MessageBoxIcon.Information);
        //    }
        //    else
        //    {
        //        MessageBox.Show("Failed to update permissions.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
        //    }
        //}

        private async void btnUpdateRolePermission_Click(object sender, EventArgs e)
        {
            // دریافت RoleID انتخاب‌شده
            if (LookupRole.EditValue == null)
            {
                MessageBox.Show("Please select a role before updating permissions.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }
            var roleId = (int)LookupRole.EditValue;

            // گرفتن تمامی CheckEdit‌های موجود در پنل (و زیرکنترل‌ها)
            var checkEdits = GetAllCheckEdits(panelControl1);

            // ساخت لیست از وضعیت چک‌باکس‌ها
            var permissionsToUpdate = checkEdits.Select(checkEdit =>
            {
                var ribbonPageName = _ribbonToCheckboxMap.FirstOrDefault(x => x.Value == checkEdit.Name).Key;
                return new
                {
                    RoleID = roleId,
                    RibbonPageName = ribbonPageName,
                    IsEnabled = checkEdit.Checked
                };
            }).Where(permission => permission.RibbonPageName != null).ToList();

            // بررسی اینکه آیا لیست خالی است
            if (!permissionsToUpdate.Any())
            {
                MessageBox.Show("No permissions found to update.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }

            // نمایش داده‌ها در پیغام قبل از ارسال برای آپدیت
            //string permissionsData = string.Join(Environment.NewLine, permissionsToUpdate.Select(p =>
            //$"RibbonPage: {p.RibbonPageName}, IsEnabled: {p.IsEnabled}"));

            //MessageBox.Show($"Permissions to be updated:\n{permissionsData}", "Info", MessageBoxButtons.OK, MessageBoxIcon.Information);

            // تبدیل لیست به JSON
            var jsonPermissions = JsonConvert.SerializeObject(permissionsToUpdate);

            // ارسال داده‌ها به Stored Procedure
            try
            {
                var repository = _serviceProvider.GetService<IUserDapperRepository>();
                var result = await repository.UpdatePermissionsUsingJsonAsync(roleId, jsonPermissions);

                // بررسی نتیجه
                if (result)
                {
                    MessageBox.Show("Permissions have been successfully updated.", "Success", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
                else
                {
                    MessageBox.Show("Failed to update permissions.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Error occurred while updating permissions: {ex.Message}", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
        private async Task<bool> IsUsernameExistsAsync(string username, int? userId = null)
        {
            var repository = _serviceProvider.GetService<IUserDapperRepository>();
            var user = await repository.GetUserByUsernameAsync(username);

            // اگر userId مشخص شده باشد، یعنی داریم یک کاربر موجود را آپدیت می‌کنیم، بنابراین نباید خود کاربر را چک کنیم
            if (user != null && user.UserID != userId)
            {
                return true;
            }

            return false;
        }

        private async void gridView1_CellValueChanged(object sender, DevExpress.XtraGrid.Views.Base.CellValueChangedEventArgs e)
        {
            // بررسی اینکه آیا تغییر در ستون‌های موردنظر (مثلاً Username یا PasswordHash یا RoleID) رخ داده است
            if (e.Column.FieldName == "Username" || e.Column.FieldName == "PasswordHash" || e.Column.FieldName == "RoleID")
            {
                // دریافت UserID از سطر تغییر یافته
                var userId = Convert.ToInt32(gridView1.GetRowCellValue(e.RowHandle, "UserID"));
                var username = gridView1.GetRowCellValue(e.RowHandle, "Username").ToString();
                var passwordHash = gridView1.GetRowCellValue(e.RowHandle, "PasswordHash").ToString();
                var roleID = Convert.ToInt32(gridView1.GetRowCellValue(e.RowHandle, "RoleID"));

                // دریافت اطلاعات کاربر
                var user = await _serviceProvider.GetService<IUserDapperRepository>().GetUserByIdAsync(userId);

                // اگر کاربر "admin" است، فقط پسورد تغییر کند
                if (user != null && user.Username.ToLower() == "admin")
                {
                    var updatedUser2 = new UserDto
                    {
                        UserID = 1,
                        Username = "Admin",
                        PasswordHash = passwordHash,
                        RoleID = 1
                    };
                    // در اینجا فقط پسورد جدید را به‌روز می‌کنیم
                    //user.PasswordHash = passwordHash;

                    // ارسال درخواست برای بروزرسانی فقط پسورد
                    var result2 = await _serviceProvider.GetService<IUserDapperRepository>().UpdateUserAsync(updatedUser2);

                    if (result2 > 0)
                    {
                        MessageBox.Show("Admin User updated successfully.", "Success", MessageBoxButtons.OK, MessageBoxIcon.Information);
                        loaddatagrid();
                    }
                    else
                    {
                        MessageBox.Show("Failed to update Admin User.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    }

                    return; // پس از بروزرسانی پسورد، دیگر به‌روزرسانی‌های دیگر را انجام نمی‌دهیم
                }

                // بررسی اینکه آیا نام‌کاربری تکراری است
                if (await IsUsernameExistsAsync(username, userId))
                {
                    MessageBox.Show("The username is already taken. Please choose another username.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return;
                }

                // در غیر این صورت، بروزرسانی شامل Username و RoleID و Password انجام می‌شود
                var updatedUser = new UserDto
                {
                    UserID = userId,
                    Username = username,
                    PasswordHash = passwordHash,
                    RoleID = roleID
                };

                // فراخوانی متد Repository برای بروزرسانی کاربر
                var repository = _serviceProvider.GetService<IUserDapperRepository>();
                var result = await repository.UpdateUserAsync(updatedUser);

                // بررسی نتیجه بروزرسانی
                if (result > 0)
                {
                    MessageBox.Show("User updated successfully.", "Success", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    loaddatagrid();
                }
                else
                {
                    MessageBox.Show("Failed to update user.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
        }

        private void btnRefreshData_Click(object sender, EventArgs e)
        {
            loaddatagrid();
        }
    }
}
