using AWMS.app.Forms.frmBase;
using AWMS.app.Forms.frmSmall;
using AWMS.app.Forms.RibbonChange;
using AWMS.app.Forms.RibbonMaterial;
using AWMS.app.Forms.RibbonMsr;
using AWMS.app.Forms.RibbonSearch;
using AWMS.app.Forms.RibbonUser;
using AWMS.app.Forms.RibbonVoucher;
using AWMS.app.Utility;
using AWMS.core.Interfaces;
using AWMS.dapper.Repositories;
using DevExpress.XtraBars;
using DevExpress.XtraSplashScreen;
using Microsoft.Extensions.DependencyInjection;

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
            barStaticItem2.Caption = " :: " + DateMiladiShamsi.DateMiladi() + " : " + DateMiladiShamsi.DateShamsi();
        }

        private void frmMain_Load(object sender, EventArgs e)
        {
            if (_userContext != null)
            {
                barStaticItem3.Caption = $"Welcome, {_userContext.Username}";
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
    }
}
