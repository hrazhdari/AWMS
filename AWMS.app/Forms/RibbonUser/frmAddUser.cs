using AWMS.dapper.Repositories;
using AWMS.dto;
using DevExpress.XtraEditors;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace AWMS.app.Forms.RibbonUser
{
    public partial class frmAddUser : XtraForm
    {
        private readonly IServiceProvider _serviceProvider;

        public frmAddUser(IServiceProvider serviceProvider)
        {
            InitializeComponent();
            _serviceProvider = serviceProvider;

            this.KeyDown += new KeyEventHandler(frmAddUser_KeyDown);
            this.AcceptButton = btnAddUser;
            loadLookup();
        }

        // بارگذاری داده‌های مربوط به نقش‌ها
        private async void loadLookup()
        {
            LookupRole.Properties.DataSource = await _serviceProvider.GetService<IUserDapperRepository>()!.GetAllRolesAsync();
        }

        // ریست کردن فیلدهای ورودی
        private void simpleButton1_Click(object sender, EventArgs e)
        {
            txtPassword.Text = "";
            txtUserName.Text = "";
            txtUserName.Focus();
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
            string username = txtUserName.Text.Trim();
            string password = txtPassword.Text.Trim();
            var roleID = (int)LookupRole.EditValue;
            string roleName = LookupRole.Text; // نام نقش برای نمایش

            // Check if the username already exists
            if (await IsUsernameExistsAsync(username))
            {
                XtraMessageBox.Show("The entered username is already taken. Please choose a different username.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }

            // Validate the inputs
            if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(password))
            {
                XtraMessageBox.Show("Please fill in all the fields.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }

            // Show confirmation dialog with the entered details
            string message = $"Please confirm the following details before saving:\n\n" +
                             $"Username: {username}\n" +
                             $"Role: {roleName}\n" +
                             $"RoleID: {roleID}\n" +
                             $"Password: {password}\n\n" + // نمایش پسورد (در محیط واقعی ممکن است این بخش حذف شود)
                             "Do you want to proceed?";
            var confirmation = XtraMessageBox.Show(message, "Confirm Details", MessageBoxButtons.YesNo, MessageBoxIcon.Question);

            if (confirmation != DialogResult.Yes)
            {
                // If the user cancels, return without saving
                return;
            }

            // Create a new user model
            var newUser = new UserDto
            {
                Username = username,
                PasswordHash = password, // Storing the password as is, without hashing
                RoleID = roleID
            };

            // Add the new user to the database
            var userId = await _serviceProvider.GetService<IUserDapperRepository>()!.AddUserAsync(newUser);

            // Display success message
            if (userId > 0)
            {
                XtraMessageBox.Show("The new user has been successfully added.", "Success", MessageBoxButtons.OK, MessageBoxIcon.Information);
                // Optionally, you can close the form or clear the fields
                this.Close();
            }
            else
            {
                XtraMessageBox.Show("There was an error adding the user.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

    }
}
