using AWMS.app.Forms.RibbonUser;
using AWMS.core;
using AWMS.core.Interfaces;
using AWMS.dapper.Repositories;
using DevExpress.XtraEditors;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace AWMS.app.Forms.RibbonVoucher
{
    public partial class frmMRV : XtraForm
    {
        private readonly IServiceProvider _serviceProvider;
        private readonly ICompanyService _companyService;
        private readonly IContractService _contractService;
        private readonly IMrvDapperRepository _mrvDapperRepository;
        private readonly UserSession _session; // اضافه کردن UserSession
        public frmMRV(IServiceProvider serviceProvider, ICompanyService companyDapperRepository, IContractService contractRepository, IMrvDapperRepository mrvDapperRepository, int? userId = null)
        {
            InitializeComponent();
            _serviceProvider = serviceProvider;
            int finalUserId = userId ?? 1;
            _session = SessionManager.GetSession(finalUserId);
            _companyService = companyDapperRepository;
            _contractService = contractRepository;
            _mrvDapperRepository = mrvDapperRepository;
            loadEditLookupCompany();
        }

        private async void loadEditLookupCompany()
        {
            lookUpEdit1.Properties.DataSource = await _companyService.GetAllCompaniesNameAsync();
        }

        private void btnShowAllIssued_Click(object sender, EventArgs e)
        {

        }

        private async void lookUpEdit1_EditValueChanged(object sender, EventArgs e)
        {

            if (lookUpEdit1.EditValue != null)
            {

                // Load data asynchronously
                lookUpEdit2.Properties.DataSource = await Task.Run(() => _contractService.GetAllContractsByCompanyidAsync(Convert.ToInt32(lookUpEdit1.EditValue)));
                // Show null text
                lookUpEdit2.EditValue = null;
            }
        }
    }
}
