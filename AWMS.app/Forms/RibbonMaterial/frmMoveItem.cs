using AWMS.app.Forms.RibbonUser;
using AWMS.core.Interfaces;
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
using Microsoft.Extensions.DependencyInjection;
using System.Diagnostics;
using AWMS.dapper.Repositories;
using DevExpress.XtraEditors.Repository;
using AWMS.dto;
using AWMS.dapper;

namespace AWMS.app.Forms.RibbonMaterial
{
    public partial class frmMoveItem : DevExpress.XtraEditors.XtraForm
    {
        private readonly IServiceProvider _serviceProvider;
        private readonly UserSession _session;

        public frmMoveItem(ISupplierService supplierService, IServiceProvider serviceProvider, int? userId = null)
        {
            InitializeComponent();
            _serviceProvider = serviceProvider;

            int finalUserId = userId ?? 1; // استفاده از userId یا مقدار پیش‌فرض
            _session = SessionManager.GetSession(finalUserId);
            lookupPLLoad();
        }

        private async void lookupPLLoad()
        {
            var LookupLoad = await _serviceProvider.GetService<IPackingListDapperRepository>()!.GetAllPackingListNamesAsync();
            lookUpEdit1.Properties.DataSource = LookupLoad;
            lookUpEdit2.Properties.DataSource = LookupLoad;
        }

        private void frmMoveItem_Load(object sender, EventArgs e)
        {

        }

        private async void lookUpEdit1_EditValueChanged(object sender, EventArgs e)
        {
            int plid;

            // بررسی انتخاب مقدار توسط کاربر
            if (lookUpEdit1.EditValue == null || string.IsNullOrWhiteSpace(lookUpEdit1.EditValue.ToString()))
            {
                MessageBox.Show("Please select a valid Packing List (PL) before proceeding.", "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }
            else
            {
                plid = Convert.ToInt32(lookUpEdit1.EditValue);
            }
            gridControl1.DataSource = await _serviceProvider.GetService<IPackingListDapperRepository>()!.GetPackingListMoveItemDetailsAsync(plid);
        }

        // تابع برای دریافت داده‌ها و تنظیمات LookupEdit
        private async Task LoadPackagesIntoLookupEdit(int plId)
        {
            var packageRepo = _serviceProvider.GetService<IPackageDapperRepository>();

            if (packageRepo != null)
            {
                try
                {
                    // دریافت داده‌ها از بانک به صورت Async
                    var packages = await Task.Run(() => packageRepo.GetPackageByPLId(plId));

                    // بارگذاری داده‌ها در LookupEdit (فرض کنیم lookUpEdit3 وجود دارد)
                    lookUpEdit3.Properties.DataSource = packages; // تنظیم منبع داده
                    //lookUpEdit3.Properties.DisplayMember = "PK";  // فیلدی که نمایش داده می‌شود
                    //lookUpEdit3.Properties.ValueMember = "PKID"; // فیلدی که به عنوان مقدار انتخابی ذخیره می‌شود
                    //lookUpEdit3.Properties.NullText = "Select Package"; // متن پیش‌فرض
                }
                catch (Exception ex)
                {
                    // مدیریت خطا در صورت بروز مشکل در دریافت داده‌ها
                    MessageBox.Show($"Error while loading packages: {ex.Message}", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
            else
            {
                MessageBox.Show("Package repository service not found.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        // رویداد EditValueChanged برای lookUpEdit2
        private async void lookUpEdit2_EditValueChanged(object sender, EventArgs e)
        {
            if (lookUpEdit2.EditValue is int selectedPLId)
            {
                await LoadPackagesIntoLookupEdit(selectedPLId);
            }
            else
            {
                MessageBox.Show("Invalid PL ID selected.", "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
        }

        private async void simpleButton2_Click(object sender, EventArgs e)
        {
            try
            {
                // گرفتن مقادیر از کنترل‌ها
                int plid = Convert.ToInt32(lookUpEdit2.EditValue ?? 0);
                int pk = Convert.ToInt32(textEdit1.Text ?? "0");

                decimal netWeight = 0;
                decimal grossWeight = 0;
                string volume = "0";
                string descripPK = "Build in Move Item Form";
                string remarkPl = "Build in Move Item Form";
                DateTime arDate = DateTime.Now;
                var userId = _session.UserID; // گرفتن UserID از نشست کاربر

                if (plid <= 0 || pk <= 0)
                {
                    XtraMessageBox.Show("Invalid PLId or PK value!", "Error", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    return;
                }

                // دریافت سرویس ریپازیتوری و چک کردن تکراری بودن
                var packageRepo = _serviceProvider.GetService<IPackageDapperRepository>();

                if (packageRepo == null)
                {
                    XtraMessageBox.Show("Package repository service not found!", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return;
                }

                // بررسی وجود داشتن PK برای PLId
                bool pkExists = packageRepo.CheckPkExist(plid, pk);
                if (pkExists)
                {
                    XtraMessageBox.Show("This PK already exists for the selected PLId.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    return;
                }

                // ساختن آبجکت DTO
                var newpack = new PackageDto()
                {
                    PLId = plid,
                    PK = pk,
                    NetW = netWeight,
                    GrossW = grossWeight,
                    Volume = volume,
                    Desciption = descripPK,
                    Remark = remarkPl,
                    ArrivalDate = arDate,
                    EnteredBy = userId,
                    EnteredDate = DateTime.Now
                };

                // ذخیره داده
                bool isAdded = await Task.Run(() => packageRepo.AddPackage(newpack));

                if (isAdded)
                {
                    XtraMessageBox.Show("PK record added successfully!", "Success", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    await LoadPackagesIntoLookupEdit(plid);
                }
                else
                {
                    XtraMessageBox.Show("Failed to add PK record. Please try again.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
            catch (Exception ex)
            {
                // مدیریت خطاهای احتمالی
                XtraMessageBox.Show($"An error occurred: {ex.Message}", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void simpleButton1_Click(object sender, EventArgs e)
        {
            try
            {
                // 1. بررسی اینکه آیا آیتمی از GridControl1 انتخاب شده است یا نه
                var selectedRowHandle = gridView1.FocusedRowHandle; // گرفتن ردیف انتخاب شده
                if (selectedRowHandle < 0)
                {
                    XtraMessageBox.Show("No item selected.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    return;
                }

                // 2. بررسی اینکه آیا از lookUpEdit3 یک PK انتخاب شده است یا نه
                int selectedPkId = Convert.ToInt32(lookUpEdit3.EditValue);
                if (selectedPkId <= 0)
                {
                    XtraMessageBox.Show("Please select a PK from Package's.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    return;
                }

                // 3. دریافت داده از گرید انتخاب شده
                var item = gridView1.GetRow(selectedRowHandle) as MoveItemPackingDetailDto; // تبدیل به نوع صحیح

                // 4. تغییر PKID در دیتابیس
                int itemId = item.ItemId.GetValueOrDefault(); // اگر ItemId نال باشد، مقدار پیش‌فرض 0 خواهد بود

                if (itemId == 0)
                {
                    XtraMessageBox.Show("ItemId is invalid.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return;
                }

                // 5. تغییر PKID در دیتابیس
                bool isUpdated = _serviceProvider.GetService<IItemDapperRepository>().ChangePKidOfItemid(selectedPkId, itemId); // آپدیت PKID

                if (!isUpdated)
                {
                    XtraMessageBox.Show("Failed to update PKID in database. Please check the data.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return;
                }

                // 6. انتقال آیتم از GridControl1 به GridControl2
                var grid2DataSource = gridControl2.DataSource as BindingList<MoveItemPackingDetailDto>;
                if (grid2DataSource == null)
                {
                    grid2DataSource = new BindingList<MoveItemPackingDetailDto>(); // اگر DataSource برای GridControl2 خالی است، آن را ایجاد کنید
                    gridControl2.DataSource = grid2DataSource;
                }

                grid2DataSource.Add(item); // اضافه کردن ردیف به GridControl2

                // 7. حذف آیتم از GridControl1
                gridView1.DeleteRow(selectedRowHandle); // حذف ردیف از GridControl1

                // 8. بروزرسانی داده‌های GridControl2
                gridControl2.RefreshDataSource(); // اطمینان از اینکه گرید داده‌های جدید را نمایش دهد
                gridControl1.RefreshDataSource(); // اطمینان از اینکه گرید داده‌های حذف‌شده را نمایش دهد

                XtraMessageBox.Show("PKID updated and item transferred successfully!", "Success", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            catch (Exception ex)
            {
                // مدیریت خطاهای احتمالی
                XtraMessageBox.Show($"An error occurred: {ex.Message}", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }



    }
}