using AWMS.app.Forms.frmBase;
using AWMS.app.Forms.frmSmall;
using AWMS.app.Forms.RibbonChange;
using AWMS.app.Forms.RibbonMaterial;
using AWMS.app.Forms.RibbonMsr;
using AWMS.app.Forms.RibbonSearch;
using AWMS.app.Forms.RibbonSetting;
using AWMS.app.Forms.RibbonUser;
using AWMS.app.Forms.RibbonVoucher;
using AWMS.app.Utility;
using AWMS.core.Interfaces;
using AWMS.dapper.Repositories;
using DevExpress.XtraBars;
using DevExpress.XtraBars.Ribbon;
using DevExpress.XtraSplashScreen;
using Microsoft.Extensions.DependencyInjection;
using Newtonsoft.Json;
using System.IO;
using System.Windows.Controls.Ribbon;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.StartPanel;

namespace AWMS.app.Forms
{
    public partial class frmMain : DevExpress.XtraBars.Ribbon.RibbonForm
    {
        private readonly IServiceProvider _serviceProvider;
        private readonly UserContext _userContext;

        public frmMain(IServiceProvider serviceProvider, UserContext userContext)
        {
            InitializeComponent();
            _serviceProvider = serviceProvider;
            _userContext = userContext;
            this.Icon = Properties.Resources.warehouse2024;
            ApplyRolePermissions();
            barStaticItem2.Caption = " :: " + DateMiladiShamsi.DateMiladi() + " : " + DateMiladiShamsi.DateShamsi();
        }

        private void frmMain_Load(object sender, EventArgs e)
        {
            if (_userContext != null)
            {
                barStaticItem3.Caption = $"Welcome, {_userContext.Username}";
                LoadSkin(_userContext.Username);
            }
        }
        private async void ApplyRolePermissions()
        {
            // دریافت RoleID کاربر از UserContext
            var roleId = _userContext.RoleID;

            // دریافت دسترسی‌های نقش از جدول ApplicationPermissions
            var repository = _serviceProvider.GetService<IUserDapperRepository>();
            var permissions = await repository.GetPermissionsByRoleIdAsync(roleId);

            if (permissions == null || !permissions.Any()) return;

            // فعال یا غیرفعال کردن تب‌ها بر اساس دسترسی‌ها
            foreach (DevExpress.XtraBars.Ribbon.RibbonPage page in ribbonControl1.Pages)
            {
                var permission = permissions.FirstOrDefault(p => p.RibbonPageName == page.Name);

                if (permission != null)
                {
                    page.Visible = permission.IsEnabled; // نمایش تب اگر مجوز فعال باشد

                    // غیرفعال کردن گروه‌ها در این تب
                    foreach (DevExpress.XtraBars.Ribbon.RibbonPageGroup group in page.Groups)
                    {
                        group.Enabled = permission.IsEnabled; // غیرفعال کردن گروه‌ها
                    }

                    // جلوگیری از انتخاب تب اگر غیرفعال باشد
                    if (!permission.IsEnabled)
                    {
                        // برای جلوگیری از انتخاب تب
                        page.Visible = true; // تب نمایش داده می‌شود
                        ribbonControl1.SelectedPage = null; // از انتخاب تب جلوگیری می‌شود
                    }
                }
                else
                {
                    page.Visible = false; // مخفی کردن تب
                }
            }


        }

        private void CompanybarButtonItem_ItemClick(object sender, ItemClickEventArgs e)
        {
            try
            {
                SplashScreenManager.ShowForm(this, typeof(frmWait), true, true, true, false);
                var CompanyManagementForm = _serviceProvider.GetRequiredService<frmCompanyManagment>();
                CompanyManagementForm.MdiParent = this;
                CompanyManagementForm.Show();
            }
            catch (Exception ex)
            {
                MessageBox.Show($"An error occurred: {ex.Message}");
            }
            finally
            {
                SplashScreenManager.CloseForm();
            }
        }
        private void barBtnContracts_ItemClick(object sender, ItemClickEventArgs e)
        {
            try
            {
                SplashScreenManager.ShowForm(this, typeof(frmWait), true, true, true, false);
                var CompanyContractForm = ActivatorUtilities.CreateInstance<frmCompanyContract>(_serviceProvider, _userContext.UserId);
                CompanyContractForm.MdiParent = this;
                CompanyContractForm.Show();
            }
            catch (Exception ex)
            {
                MessageBox.Show($"An error occurred: {ex.Message}");
            }
            finally
            {
                SplashScreenManager.CloseForm();
            }
        }
        private void MrbarButtonItem_ItemClick(object sender, ItemClickEventArgs e)
        {
            try
            {
                SplashScreenManager.ShowForm(this, typeof(frmWait), true, true, true, false);
                var MrManagementForm = _serviceProvider.GetRequiredService<frmMr>();
                MrManagementForm.MdiParent = this;
                MrManagementForm.Show();
            }
            catch (Exception ex)
            {
                MessageBox.Show($"An error occurred: {ex.Message}");
            }
            finally
            {
                SplashScreenManager.CloseForm();
            }
        }

        private void PoBarButtonItem_ItemClick(object sender, ItemClickEventArgs e)
        {
            try
            {
                SplashScreenManager.ShowForm(this, typeof(frmWait), true, true, true, false);
                var PoManagementForm = _serviceProvider.GetRequiredService<frmPo>();
                PoManagementForm.MdiParent = this;
                PoManagementForm.Show();
            }
            catch (Exception ex)
            {
                MessageBox.Show($"An error occurred: {ex.Message}");
            }
            finally
            {
                SplashScreenManager.CloseForm();
            }
        }

        private void barBtnPl_ItemClick(object sender, ItemClickEventArgs e)
        {
            try
            {
                SplashScreenManager.ShowForm(this, typeof(frmWait), true, true, true, false);
                var PlManagementForm = ActivatorUtilities.CreateInstance<frmPl>(
                    _serviceProvider,
                    _userContext.UserId,  // به درستی پارامتر userId ارسال می‌شود
                    _serviceProvider.GetRequiredService<IPackingListDapperRepository>(),
                    _serviceProvider.GetRequiredService<IServiceProvider>(),
                    _serviceProvider.GetRequiredService<IDescriptionForPkService>(),
                    _serviceProvider.GetRequiredService<IIrnService>(),
                    _serviceProvider.GetRequiredService<IShipmentService>(),
                    _serviceProvider.GetRequiredService<IAreaUnitService>(),
                    _serviceProvider.GetRequiredService<IVendorService>(),
                    _serviceProvider.GetRequiredService<ISupplierService>(),
                    _serviceProvider.GetRequiredService<IDesciplineService>(),
                    _serviceProvider.GetRequiredService<IMrService>(),
                    _serviceProvider.GetRequiredService<IPoService>()
                );
                PlManagementForm.MdiParent = this;
                PlManagementForm.Show();
            }
            catch (Exception ex)
            {
                MessageBox.Show($"An error occurred: {ex.Message}");
            }
            finally
            {
                SplashScreenManager.CloseForm();
            }
        }

        private void barBtnPk_ItemClick(object sender, ItemClickEventArgs e)
        {
            try
            {
                SplashScreenManager.ShowForm(this, typeof(frmWait), true, true, true, false);
                var PkManagementForm = ActivatorUtilities.CreateInstance<frmPK>(_serviceProvider, _userContext.UserId);
                PkManagementForm.MdiParent = this;
                PkManagementForm.Show();
            }
            catch (Exception ex)
            {
                MessageBox.Show($"An error occurred: {ex.Message}");
            }
            finally
            {
                SplashScreenManager.CloseForm();
            }
        }

        private void barButtonItem8_ItemClick(object sender, ItemClickEventArgs e)
        {
            try
            {
                SplashScreenManager.ShowForm(this, typeof(frmWait), true, true, true, false);
                var ItemLocManagementForm = ActivatorUtilities.CreateInstance<frmItemLoc>(_serviceProvider, _userContext.UserId);
                ItemLocManagementForm.MdiParent = this;
                ItemLocManagementForm.Show();
            }
            catch (Exception ex)
            {
                MessageBox.Show($"An error occurred: {ex.Message}");
            }
            finally
            {
                SplashScreenManager.CloseForm();
            }
        }

        private void barButtonItem9_ItemClick(object sender, ItemClickEventArgs e)
        {
            try
            {
                SplashScreenManager.ShowForm(this, typeof(frmWait), true, true, true, false);
                var viewPackingListForm = ActivatorUtilities.CreateInstance<frmViewPackingList>(_serviceProvider, _userContext.UserId);
                viewPackingListForm.MdiParent = this;
                viewPackingListForm.Show();
            }
            catch (Exception ex)
            {
                MessageBox.Show($"An error occurred: {ex.Message}");
            }
            finally
            {
                SplashScreenManager.CloseForm();
            }
        }

        private void barbtnImportPackingList_ItemClick(object sender, ItemClickEventArgs e)
        {
            try
            {
                SplashScreenManager.ShowForm(this, typeof(frmWait), true, true, true, false);
                var ImportPackingListForm = ActivatorUtilities.CreateInstance<frmImportPackingList>(_serviceProvider, _userContext.UserId);
                ImportPackingListForm.MdiParent = this;
                ImportPackingListForm.Show();
            }
            catch (Exception ex)
            {
                MessageBox.Show($"An error occurred: {ex.Message}");
            }
            finally
            {
                SplashScreenManager.CloseForm();
            }
        }

        private void btnmiv_ItemClick(object sender, ItemClickEventArgs e)
        {
            try
            {
                SplashScreenManager.ShowForm(this, typeof(frmWait), true, true, true, false);
                var ImportPackingListForm = ActivatorUtilities.CreateInstance<frmIssueVoucher>(_serviceProvider);//, _userContext.UserId);
                ImportPackingListForm.MdiParent = this;
                ImportPackingListForm.Show();
            }
            catch (Exception ex)
            {
                MessageBox.Show($"An error occurred: {ex.Message}");
            }
            finally
            {
                SplashScreenManager.CloseForm();
            }
        }

        private void barButtonItem14_ItemClick(object sender, ItemClickEventArgs e)
        {
            try
            {
                SplashScreenManager.ShowForm(this, typeof(frmWait), true, true, true, false);
                var ImportPackingListForm = ActivatorUtilities.CreateInstance<frmSearchItem>(_serviceProvider);//, _userContext.UserId);
                ImportPackingListForm.MdiParent = this;
                ImportPackingListForm.Show();
            }
            catch (Exception ex)
            {
                MessageBox.Show($"An error occurred: {ex.Message}");
            }
            finally
            {
                SplashScreenManager.CloseForm();
            }
        }

        private void barButtonItem13_ItemClick(object sender, ItemClickEventArgs e)
        {
            try
            {
                SplashScreenManager.ShowForm(this, typeof(frmWait), true, true, true, false);
                var ImportPackingListForm = ActivatorUtilities.CreateInstance<frmSearchLocItem>(_serviceProvider);//, _userContext.UserId);
                ImportPackingListForm.MdiParent = this;
                ImportPackingListForm.Show();
            }
            catch (Exception ex)
            {
                MessageBox.Show($"An error occurred: {ex.Message}");
            }
            finally
            {
                SplashScreenManager.CloseForm();
            }
        }
        private void barButtonItem2_ItemClick(object sender, ItemClickEventArgs e)
        {
            try
            {
                SplashScreenManager.ShowForm(this, typeof(frmWait), true, true, true, false);
                var ImportPackingListForm = ActivatorUtilities.CreateInstance<frmSearchMiv>(_serviceProvider);//, _userContext.UserId);
                ImportPackingListForm.MdiParent = this;
                ImportPackingListForm.Show();
            }
            catch (Exception ex)
            {
                MessageBox.Show($"An error occurred: {ex.Message}");
            }
            finally
            {
                SplashScreenManager.CloseForm();
            }
        }
        private void barButtonItem4_ItemClick(object sender, ItemClickEventArgs e)
        {
            try
            {
                SplashScreenManager.ShowForm(this, typeof(frmWait), true, true, true, false);
                var frmPrint = ActivatorUtilities.CreateInstance<frmPrint>(_serviceProvider);//, _userContext.UserId);
                frmPrint.MdiParent = this;
                frmPrint.Show();
            }
            catch (Exception ex)
            {
                MessageBox.Show($"An error occurred: {ex.Message}");
            }
            finally
            {
                SplashScreenManager.CloseForm();
            }
        }

        private void barButtonItem10_ItemClick(object sender, ItemClickEventArgs e)
        {
            try
            {
                var ImportPackingListForm = ActivatorUtilities.CreateInstance<r>(_serviceProvider);//, _userContext.UserId);
                ImportPackingListForm.ShowDialog();
            }
            catch (Exception ex)
            {
                MessageBox.Show($"An error occurred: {ex.Message}");
            }
        }

        private void barButtonItem3_ItemClick(object sender, ItemClickEventArgs e)
        {
            try
            {
                SplashScreenManager.ShowForm(this, typeof(frmWait), true, true, true, false);
                var frmChangeLocation = ActivatorUtilities.CreateInstance<frmChangeLocation>(_serviceProvider, _userContext.UserId);
                frmChangeLocation.MdiParent = this;
                frmChangeLocation.Show();
            }
            catch (Exception ex)
            {
                MessageBox.Show($"An error occurred: {ex.Message}");
            }
            finally
            {
                SplashScreenManager.CloseForm();
            }
        }

        private void barButtonItem12_ItemClick(object sender, ItemClickEventArgs e)
        {
            try
            {
                var frmUpload = ActivatorUtilities.CreateInstance<frmUpload>(_serviceProvider, _userContext.UserId);
                frmUpload.ShowDialog();
            }
            catch (Exception ex)
            {
                MessageBox.Show($"An error occurred: {ex.Message}");
            }
        }

        private void barButtonItem15_ItemClick(object sender, ItemClickEventArgs e)
        {
            try
            {
                SplashScreenManager.ShowForm(this, typeof(frmWait), true, true, true, false);
                var PDFS = ActivatorUtilities.CreateInstance<PDFS>(_serviceProvider, _userContext.UserId);
                PDFS.MdiParent = this;
                PDFS.Show();
            }
            catch (Exception ex)
            {
                MessageBox.Show($"An error occurred: {ex.Message}");
            }
            finally
            {
                SplashScreenManager.CloseForm();
            }
        }

        private void barButtonItem16_ItemClick(object sender, ItemClickEventArgs e)
        {
            try
            {
                SplashScreenManager.ShowForm(this, typeof(frmWait), true, true, true, false);
                var frmApprove = ActivatorUtilities.CreateInstance<frmApprove>(_serviceProvider, _userContext.UserId);
                frmApprove.MdiParent = this;
                frmApprove.Show();
            }
            catch (Exception ex)
            {
                MessageBox.Show($"An error occurred: {ex.Message}");
            }
            finally
            {
                SplashScreenManager.CloseForm();
            }
        }

        private void barButtonItem17_ItemClick(object sender, ItemClickEventArgs e)
        {
            try
            {
                SplashScreenManager.ShowForm(this, typeof(frmWait), true, true, true, false);
                var frmMRV = ActivatorUtilities.CreateInstance<frmMRV>(_serviceProvider, _userContext.UserId);
                frmMRV.MdiParent = this;
                frmMRV.Show();
            }
            catch (Exception ex)
            {
                MessageBox.Show($"An error occurred: {ex.Message}");
            }
            finally
            {
                SplashScreenManager.CloseForm();
            }
        }

        private void barButtonItem18_ItemClick(object sender, ItemClickEventArgs e)
        {

            try
            {
                var frmBio = ActivatorUtilities.CreateInstance<frmBio>(_serviceProvider, _userContext.UserId);
                frmBio.ShowDialog();
            }
            catch (Exception ex)
            {
                MessageBox.Show($"An error occurred: {ex.Message}");
            }
        }

        private void barButtonItem19_ItemClick(object sender, ItemClickEventArgs e)
        {
            try
            {
                SplashScreenManager.ShowForm(this, typeof(frmWait), true, true, true, false);
                var frmMRV = ActivatorUtilities.CreateInstance<frmHMV>(_serviceProvider, _userContext.UserId);
                frmMRV.MdiParent = this;
                frmMRV.Show();
            }
            catch (Exception ex)
            {
                MessageBox.Show($"An error occurred: {ex.Message}");
            }
            finally
            {
                SplashScreenManager.CloseForm();
            }
        }

        private void frmMain_FormClosing(object sender, FormClosingEventArgs e)
        {
            if (_userContext != null)
            {
                SessionManager.RemoveSession(_userContext.UserId);
                SaveSkin(_userContext.Username);
            }

            Application.Exit();
        }

        private void barBtnUpdateMRV_ItemClick(object sender, ItemClickEventArgs e)
        {
            try
            {
                SplashScreenManager.ShowForm(this, typeof(frmWait), true, true, true, false);
                var frmUpdateMRV = ActivatorUtilities.CreateInstance<frmUpdateMrv>(_serviceProvider, _userContext.UserId);
                frmUpdateMRV.MdiParent = this;
                frmUpdateMRV.Show();
            }
            catch (Exception ex)
            {
                MessageBox.Show($"An error occurred: {ex.Message}");
            }
            finally
            {
                SplashScreenManager.CloseForm();
            }
        }

        private void barButtonItem21_ItemClick(object sender, ItemClickEventArgs e)
        {
            try
            {
                SplashScreenManager.ShowForm(this, typeof(frmWait), true, true, true, false);
                var frmUpdateHmv = ActivatorUtilities.CreateInstance<frmUpdateHmv>(_serviceProvider, _userContext.UserId);
                frmUpdateHmv.MdiParent = this;
                frmUpdateHmv.Show();
            }
            catch (Exception ex)
            {
                MessageBox.Show($"An error occurred: {ex.Message}");
            }
            finally
            {
                SplashScreenManager.CloseForm();
            }
        }

        private void barButtonItem20_ItemClick(object sender, ItemClickEventArgs e)
        {
            try
            {
                SplashScreenManager.ShowForm(this, typeof(frmWait), true, true, true, false);
                var frmRegisterIvr = _serviceProvider.GetRequiredService<frmRegisterIvr>();
                frmRegisterIvr.MdiParent = this;
                frmRegisterIvr.Show();
            }
            catch (Exception ex)
            {
                MessageBox.Show($"An error occurred: {ex.Message}");
            }
            finally
            {
                SplashScreenManager.CloseForm();
            }
        }

        private void barButtonItem22_ItemClick(object sender, ItemClickEventArgs e)
        {
            try
            {
                SplashScreenManager.ShowForm(this, typeof(frmWait), true, true, true, false);
                var frmRegisterMsr = _serviceProvider.GetRequiredService<frmRegisterMsr>();
                frmRegisterMsr.MdiParent = this;
                frmRegisterMsr.Show();
            }
            catch (Exception ex)
            {
                MessageBox.Show($"An error occurred: {ex.Message}");
            }
            finally
            {
                SplashScreenManager.CloseForm();
            }
        }

        private void barButtonItem23_ItemClick(object sender, ItemClickEventArgs e)
        {
            try
            {
                SplashScreenManager.ShowForm(this, typeof(frmWait), true, true, true, false);
                var frmMsrRev = _serviceProvider.GetRequiredService<frmMsrRev>();
                frmMsrRev.MdiParent = this;
                frmMsrRev.Show();
            }
            catch (Exception ex)
            {
                MessageBox.Show($"An error occurred: {ex.Message}");
            }
            finally
            {
                SplashScreenManager.CloseForm();
            }
        }

        private void barButtonItem24_ItemClick(object sender, ItemClickEventArgs e)
        {
            try
            {
                SplashScreenManager.ShowForm(this, typeof(frmWait), true, true, true, false);
                var frmChangeFormat = _serviceProvider.GetRequiredService<frmChangeFormat>();
                frmChangeFormat.MdiParent = this;
                frmChangeFormat.Show();
            }
            catch (Exception ex)
            {
                MessageBox.Show($"An error occurred: {ex.Message}");
            }
            finally
            {
                SplashScreenManager.CloseForm();
            }
        }

        private void barButtonItem25_ItemClick(object sender, ItemClickEventArgs e)
        {
            try
            {
                SplashScreenManager.ShowForm(this, typeof(frmWait), true, true, true, false);
                var frmPlChecking = _serviceProvider.GetRequiredService<frmPlChecking>();
                frmPlChecking.MdiParent = this;
                frmPlChecking.Show();
            }
            catch (Exception ex)
            {
                MessageBox.Show($"An error occurred: {ex.Message}");
            }
            finally
            {
                SplashScreenManager.CloseForm();
            }
        }

        private void barButtonItem26_ItemClick(object sender, ItemClickEventArgs e)
        {
            try
            {
                SplashScreenManager.ShowForm(this, typeof(frmWait), true, true, true, false);
                var frmPrintMSR = _serviceProvider.GetRequiredService<frmPrintMSR>();
                frmPrintMSR.MdiParent = this;
                frmPrintMSR.Show();
            }
            catch (Exception ex)
            {
                MessageBox.Show($"An error occurred: {ex.Message}");
            }
            finally
            {
                SplashScreenManager.CloseForm();
            }
        }

        private void barButtonItem27_ItemClick(object sender, ItemClickEventArgs e)
        {
            try
            {
                SplashScreenManager.ShowForm(this, typeof(frmWait), true, true, true, false);
                var frmOpiList = _serviceProvider.GetRequiredService<frmOpiList>();
                frmOpiList.MdiParent = this;
                frmOpiList.Show();
            }
            catch (Exception ex)
            {
                MessageBox.Show($"An error occurred: {ex.Message}");
            }
            finally
            {
                SplashScreenManager.CloseForm();
            }
        }

        private void barButtonItem28_ItemClick(object sender, ItemClickEventArgs e)
        {
            try
            {
                SplashScreenManager.ShowForm(this, typeof(frmWait), true, true, true, false);
                var frmImportMrc = _serviceProvider.GetRequiredService<frmImportMrc>();
                frmImportMrc.MdiParent = this;
                frmImportMrc.Show();
            }
            catch (Exception ex)
            {
                MessageBox.Show($"An error occurred: {ex.Message}");
            }
            finally
            {
                SplashScreenManager.CloseForm();
            }

        }

        private void barButtonItem29_ItemClick(object sender, ItemClickEventArgs e)
        {
            try
            {
                SplashScreenManager.ShowForm(this, typeof(frmWait), true, true, true, false);
                var frmManageMrc = _serviceProvider.GetRequiredService<frmManageMrc>();
                frmManageMrc.MdiParent = this;
                frmManageMrc.Show();
            }
            catch (Exception ex)
            {
                MessageBox.Show($"An error occurred: {ex.Message}");
            }
            finally
            {
                SplashScreenManager.CloseForm();
            }
        }

        private void barButtonItem6_ItemClick(object sender, ItemClickEventArgs e)
        {
            try
            {
                //SplashScreenManager.ShowForm(this, typeof(frmWait), true, true, true, false);
                var frmAddUser = _serviceProvider.GetRequiredService<frmAddUser>();
                // frmAddUser.MdiParent = this;
                frmAddUser.ShowDialog();
            }
            catch (Exception ex)
            {
                MessageBox.Show($"An error occurred: {ex.Message}");
            }
            finally
            {
                //SplashScreenManager.CloseForm();
            }
        }

        private void barButtonItem7_ItemClick(object sender, ItemClickEventArgs e)
        {
            try
            {
                SplashScreenManager.ShowForm(this, typeof(frmWait), true, true, true, false);
                var frmManageUser = _serviceProvider.GetRequiredService<frmManageUser>();
                frmManageUser.MdiParent = this;
                frmManageUser.Show();
            }
            catch (Exception ex)
            {
                MessageBox.Show($"An error occurred: {ex.Message}");
            }
            finally
            {
                SplashScreenManager.CloseForm();
            }

        }

        private void barButtonItem30_ItemClick(object sender, ItemClickEventArgs e)
        {
            try
            {
                SplashScreenManager.ShowForm(this, typeof(frmWait), true, true, true, false);
                var frmMoveItem = _serviceProvider.GetRequiredService<frmMoveItem>();
                frmMoveItem.MdiParent = this;
                frmMoveItem.Show();
            }
            catch (Exception ex)
            {
                MessageBox.Show($"An error occurred: {ex.Message}");
            }
            finally
            {
                SplashScreenManager.CloseForm();
            }
        }
        private void barButtonItem31_ItemClick(object sender, ItemClickEventArgs e)
        {
            try
            {
                SplashScreenManager.ShowForm(this, typeof(frmWait), true, true, true, false);
                var frmDatabaseSetting = _serviceProvider.GetRequiredService<frmDatabaseSetting>();
                frmDatabaseSetting.MdiParent = this;
                frmDatabaseSetting.Show();
            }
            catch (Exception ex)
            {
                MessageBox.Show($"An error occurred: {ex.Message}");
            }
            finally
            {
                SplashScreenManager.CloseForm();
            }
        }










        private void LoadSkin(string username)
        {
            // مسیر فایل اسکین در AppData به نام کاربر
            string appDataPath = Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.ApplicationData), "AWMS", username, "skinSettings.json");

            try
            {
                if (File.Exists(appDataPath))
                {
                    string json = File.ReadAllText(appDataPath);
                    var settings = JsonConvert.DeserializeObject<dynamic>(json);

                    // بارگذاری اسکین از فایل
                    string skinName = settings?.SkinName;
                    if (!string.IsNullOrEmpty(skinName))
                    {
                        DevExpress.LookAndFeel.UserLookAndFeel.Default.SkinName = skinName;
                    }
                    else
                    {
                        // اگر اسکین در فایل پیدا نشد، از اسکین پیش‌فرض استفاده می‌کنیم
                        DevExpress.LookAndFeel.UserLookAndFeel.Default.SkinName = "Office 2019 Colorful"; // اسکین پیش‌فرض
                    }
                }
                else
                {
                    // اگر فایل اسکین پیدا نشد، از اسکین پیش‌فرض استفاده می‌کنیم
                    DevExpress.LookAndFeel.UserLookAndFeel.Default.SkinName = "Office 2019 Colorful"; // اسکین پیش‌فرض
                }
            }
            catch (Exception ex)
            {
                // در صورت بروز هر گونه خطا، اسکین پیش‌فرض اعمال می‌شود
                DevExpress.LookAndFeel.UserLookAndFeel.Default.SkinName = "Office 2019 Colorful"; // اسکین پیش‌فرض

                // لاگ خطا یا نمایش پیغام خطا (در صورت تمایل)
                //Console.WriteLine("Error loading skin: " + ex.Message);
            }
        }



        private void SaveSkin(string username)
        {
            // مسیر فایل اسکین در AppData به نام کاربر
            string appDataPath = Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.ApplicationData), "AWMS", username, "skinSettings.json");

            try
            {
                // اگر پوشه‌ی مورد نظر وجود ندارد، آن را ایجاد می‌کنیم
                string directory = Path.GetDirectoryName(appDataPath);
                if (!Directory.Exists(directory))
                {
                    Directory.CreateDirectory(directory);
                }

                // ایجاد شیء تنظیمات
                var settings = new
                {
                    SkinName = DevExpress.LookAndFeel.UserLookAndFeel.Default.SkinName
                };

                // تبدیل تنظیمات به JSON
                string json = JsonConvert.SerializeObject(settings);

                // ذخیره تنظیمات در فایل
                File.WriteAllText(appDataPath, json);
            }
            catch (Exception ex)
            {
                // در صورت بروز هرگونه خطا، پیغام خطا نمایش داده نمی‌شود و فقط در کنسول لاگ می‌شود
                //Console.WriteLine("Error saving skin: " + ex.Message);
            }
        }

 
    }
}
