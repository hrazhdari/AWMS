using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace AWMS.datalayer.Entities.Configurations
{
    public class PermissionConfiguration : IEntityTypeConfiguration<ApplicationPermission>
    {
        public void Configure(EntityTypeBuilder<ApplicationPermission> builder)
        {
            // پیکربندی کلید اصلی
            builder.HasKey(ap => ap.PermissionID);

            // پیکربندی کلید خارجی Role
            builder.HasOne(ap => ap.Role)
                .WithMany() // اینجا می‌توانید رابطه معکوس را هم اضافه کنید
                .HasForeignKey(ap => ap.RoleID)
                .OnDelete(DeleteBehavior.Restrict); // در صورت حذف Role، دسترسی‌ها حذف نشوند

            // پیکربندی خصوصیات
            builder.Property(ap => ap.RibbonPageName)
                .IsRequired()
                .HasMaxLength(50); // محدود کردن طول RibbonPageName به 50 کاراکتر

            builder.Property(ap => ap.IsEnabled)
                .IsRequired(); // IsEnabled الزامی است

            // تنظیم نام جدول در دیتابیس
            builder.ToTable("ApplicationPermissions");

            // اضافه کردن داده‌های پیش‌فرض (اختیاری)
            builder.HasData(
                new ApplicationPermission { PermissionID = 1, RoleID = 1, RibbonPageName = "ribbonPage1", IsEnabled = true },
                new ApplicationPermission { PermissionID = 2, RoleID = 1, RibbonPageName = "ribbonPage2", IsEnabled = true },
                new ApplicationPermission { PermissionID = 3, RoleID = 1, RibbonPageName = "ribbonPage3", IsEnabled = true },
                new ApplicationPermission { PermissionID = 4, RoleID = 1, RibbonPageName = "ribbonPage4", IsEnabled = true },
                new ApplicationPermission { PermissionID = 5, RoleID = 1, RibbonPageName = "ribbonPage5", IsEnabled = true },
                new ApplicationPermission { PermissionID = 6, RoleID = 1, RibbonPageName = "ribbonPage6", IsEnabled = true },
                new ApplicationPermission { PermissionID = 7, RoleID = 1, RibbonPageName = "ribbonPage7", IsEnabled = true },
                new ApplicationPermission { PermissionID = 8, RoleID = 1, RibbonPageName = "ribbonPage8", IsEnabled = true },
                new ApplicationPermission { PermissionID = 9, RoleID = 1, RibbonPageName = "ribbonPage9", IsEnabled = true },
                new ApplicationPermission { PermissionID = 10, RoleID = 1, RibbonPageName = "ribbonPage10", IsEnabled = true },
                new ApplicationPermission { PermissionID = 11, RoleID = 1, RibbonPageName = "ribbonPage11", IsEnabled = true },
                new ApplicationPermission { PermissionID = 12, RoleID = 1, RibbonPageName = "ribbonPage12", IsEnabled = true },
                new ApplicationPermission { PermissionID = 13, RoleID = 1, RibbonPageName = "ribbonPage13", IsEnabled = true },
                new ApplicationPermission { PermissionID = 14, RoleID = 1, RibbonPageName = "ribbonPage14", IsEnabled = true },
                new ApplicationPermission { PermissionID = 15, RoleID = 1, RibbonPageName = "ribbonPage15", IsEnabled = true },
                new ApplicationPermission { PermissionID = 16, RoleID = 1, RibbonPageName = "ribbonPage16", IsEnabled = true },
                new ApplicationPermission { PermissionID = 17, RoleID = 1, RibbonPageName = "ribbonPage17", IsEnabled = true },
                new ApplicationPermission { PermissionID = 18, RoleID = 1, RibbonPageName = "ribbonPage18", IsEnabled = true }
            );
        }
    }
}
