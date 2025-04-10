﻿using AWMS.app.Forms;
using AWMS.app.Forms.frmSmall;
using AWMS.app.Forms.RibbonChange;
using AWMS.app.Forms.RibbonMaterial;
using AWMS.app.Forms.RibbonSearch;
using AWMS.app.Forms.RibbonUser;
using AWMS.app.Forms.RibbonVoucher;
using AWMS.app.Forms.RibbonMsr;
using AWMS.app.Forms.RibbonSetting;
using AWMS.core;
using AWMS.core.Interfaces;
using AWMS.core.Services;
using AWMS.dapper;
using AWMS.dapper.Repositories;
using AWMS.datalayer;
using AWMS.datalayer.Context;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using System.IO;
using System.Text;

namespace AWMS.app
{
    static class Program
    {
        [STAThread]
        static void Main()
        {
            // Register encoding provider for supporting different code pages
            Encoding.RegisterProvider(CodePagesEncodingProvider.Instance);

            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);

            // ساخت Host برای استفاده از DI
            var host = CreateHostBuilder().Build();

            // ایجاد Scope برای دریافت سرویس‌ها
            using (var serviceScope = host.Services.CreateScope())
            {
                var services = serviceScope.ServiceProvider;
                try
                {
                    // دریافت فرم اصلی از سرویس‌ها
                    var form = services.GetRequiredService<frmLogin>();
                    Application.Run(form);
                }
                catch (Exception ex)
                {
                    // هندل کردن خطاها
                    Console.WriteLine($"An error occurred: {ex.Message}");
                }
            }
        }

        // تنظیمات اولیه Host
        private static IHostBuilder CreateHostBuilder() =>
            Host.CreateDefaultBuilder()
                .ConfigureServices((context, services) =>
                {
                    // بارگذاری تنظیمات از فایل appsettings.json
                    IConfiguration configuration = LoadConfiguration();
                    string connectionString = configuration.GetConnectionString("DefaultConnection")!;

                    // افزودن DbContext و UnitOfWork به سرویس‌ها
                    services.AddDbContext<AWMScontext>(options =>
                        options.UseSqlServer(connectionString));
                    services.AddScoped<IUnitOfWork, UnitOfWork>();

                    //EF Repositories
                    services.AddScoped<IMrService, MrService>();
                    services.AddScoped<IPoService, PoService>();
                    services.AddScoped<IDescriptionForPkService, DescriptionForPkService>();
                    services.AddScoped<IIrnService, IrnService>();
                    services.AddScoped<IShipmentService, ShipmentService>();
                    services.AddScoped<IAreaUnitService, AreaUnitService>();
                    services.AddScoped<ISupplierService, SupplierService>();
                    services.AddScoped<IVendorService, VendorService>();
                    services.AddScoped<IDesciplineService, DesciplineService>();
                    services.AddScoped<ICompanyService, CompanyService>();
                    services.AddScoped<IContractService, ContractService>();


                    //Dapper Repositories
                    services.AddScoped<IPackingListDapperRepository, PackingListDapperRepository>();
                    services.AddScoped<IPackageDapperRepository, PackageDapperRepository>();
                    services.AddScoped<IUnitDapperRepository, UnitDapperRepository>();
                    services.AddScoped<IScopeDapperRepository, ScopeDapperRepository>();
                    services.AddScoped<ILocationDapperRepository, LocationDapperRepository>();
                    services.AddScoped<IItemDapperRepository, ItemDapperRepository>();
                    services.AddScoped<ILocItemDapperRepository, LocItemDapperRepository>();
                    services.AddScoped<IUserDapperRepository, UserDapperRepository>();
                    services.AddScoped<IRequestDapperRepository, RequestDapperRepository>();
                    services.AddScoped<ISearchDapperRepository, SearchDapperRepository>();
                    services.AddScoped<IChangeDapperRepository, ChangeDapperRepository>();
                    services.AddScoped<IUploadDapperRepository, UploadDapperRepository>();
                    services.AddScoped<IApproveDapperRepository, ApproveDapperRepository>();
                    services.AddScoped<IMrvDapperRepository, MrvDapperRepository>();
                    services.AddScoped<IHmvDapperRepository, HmvDapperRepository>();
                    services.AddScoped<IInspectionDapperRepository, InspectionDapperRepository>();
                    services.AddScoped<IMrcDapperRepository, MrcDapperRepository>();

                    // افزودن سرویس‌های فرم‌ها به سرویس‌ها
                    services.AddTransient<frmMain>();
                    services.AddTransient<frmCompanyManagment>();
                    services.AddTransient<frmCompanyContract>();
                    services.AddTransient<frmMr>();
                    services.AddTransient<frmPo>();
                    services.AddTransient<frmPl>();
                    services.AddTransient<frmDescriptionForPKPL>();
                    services.AddTransient<frmIRN>();
                    services.AddTransient<frmShipment>();
                    services.AddTransient<frmAreaUnit>();
                    services.AddTransient<frmSupplier>();
                    services.AddTransient<frmVendor>();
                    services.AddTransient<frmPK>();
                    services.AddTransient<frmItemLoc>();
                    services.AddTransient<frmViewPackingList>();
                    services.AddTransient<frmLogin>();
                    services.AddTransient<frmImportPackingList>();
                    services.AddTransient<frmIssueVoucher>();
                    services.AddTransient<frmPrint>();
                    services.AddTransient<frmSearchItem>();
                    services.AddTransient<frmSearchMiv>();
                    services.AddTransient<frmChangeLocation>();
                    services.AddTransient<frmUpload>();
                    services.AddTransient<PDFS>();
                    services.AddTransient<frmApprove>();
                    services.AddTransient<frmMRV>();
                    services.AddTransient<frmHMV>();
                    services.AddTransient<frmBio>();
                    services.AddTransient<frmUpdateMrv>();
                    services.AddTransient<frmUpdateHmv>();
                    services.AddTransient<frmRegisterIvr>();
                    services.AddTransient<frmRegisterMsr>();
                    services.AddTransient<frmMsrRev>();
                    services.AddTransient<frmPlChecking>();
                    services.AddTransient<frmPrintMSR>();
                    services.AddTransient<frmOpiList>();
                    services.AddTransient<frmImportMrc>();
                    services.AddTransient<frmManageMrc>();
                    services.AddTransient<frmAddUser>();
                    services.AddTransient<frmManageUser>();
                    services.AddTransient<frmMoveItem>();
                    services.AddTransient<frmDatabaseSetting>();


                    services.AddTransient<frmChangeFormat>();
                    services.AddTransient<r>();




                    services.AddScoped<UserContext>(); // اضافه کردن UserContext به صورت Scoped
                });

        // بارگذاری تنظیمات از فایل appsettings.json
        private static IConfiguration LoadConfiguration()
        {
            return new ConfigurationBuilder()
                .SetBasePath(Directory.GetCurrentDirectory())
                .AddJsonFile("appsettings.json", optional: false, reloadOnChange: true)
                .Build();
        }
    }
}
