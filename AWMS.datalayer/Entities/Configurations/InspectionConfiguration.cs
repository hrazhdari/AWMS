using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace AWMS.datalayer.Entities.Configurations
{
    public class InspectionConfiguration : IEntityTypeConfiguration<Inspection>
    {
        public void Configure(EntityTypeBuilder<Inspection> builder)
        {
            // تنظیم کلید اصلی
            builder.HasKey(i => i.PLId); // تغییر کلید اصلی به PLId

            // تعریف کلید خارجی به جدول PackingList
            builder.HasOne(i => i.PackingList)
                .WithMany(pl => pl.Inspections) // اضافه کردن رابطه در کلاس PackingList
                .HasForeignKey(i => i.PLId)
                .OnDelete(DeleteBehavior.Cascade);

            // تعریف ویژگی‌ها و مشخصات آن‌ها
            builder.Property(i => i.IRN_Conflict)
                .IsRequired()
                .HasDefaultValue(false);

            builder.Property(i => i.ThirdParty)
                .IsRequired()
                .HasDefaultValue(false);

            builder.Property(i => i.OPI)
                .IsRequired()
                .HasDefaultValue(false);

            builder.Property(i => i.IcNo)
                .IsRequired()
                .HasDefaultValue(false);

            builder.Property(i => i.Site)
                .IsRequired()
                .HasDefaultValue(false);

            builder.Property(i => i.Laydown)
                .IsRequired()
                .HasDefaultValue(false);

            builder.Property(i => i.Warehouse)
                .IsRequired()
                .HasDefaultValue(false);

            builder.Property(i => i.OSBL)
                .IsRequired()
                .HasDefaultValue(false);

            builder.Property(i => i.VisualInspection)
                .IsRequired()
                .HasDefaultValue(false);

            builder.Property(i => i.QuantityCheck)
                .IsRequired()
                .HasDefaultValue(false);

            builder.Property(i => i.Marking)
                .IsRequired()
                .HasDefaultValue(false);

            builder.Property(i => i.Unloading)
                .IsRequired()
                .HasDefaultValue(false);

            builder.Property(i => i.IVR_NO)
                .HasMaxLength(100);

            builder.Property(i => i.IVR_IFR)
                .HasMaxLength(100);

            builder.Property(i => i.OrderStatus)
                .HasMaxLength(100);

            builder.Property(i => i.Description)
                .HasMaxLength(500);

            builder.Property(i => i.SubProject)
                .HasMaxLength(200);

            builder.Property(i => i.IVRPDF)
                .HasMaxLength(300);

            builder.Property(i => i.IFRPDF)
                .HasMaxLength(300);

            // تنظیمات برای تاریخ‌ها
            builder.Property(i => i.EnteredDate)
                .HasColumnType("datetime2");

            builder.Property(i => i.EditedDate)
                .HasColumnType("datetime2");

            // ایندکس‌ها (در صورت نیاز)
            builder.HasIndex(i => i.PLId).HasDatabaseName("IX_Inspection_PLId");
            builder.HasIndex(i => i.IrnId).HasDatabaseName("IX_Inspection_IrnId");
            builder.HasIndex(i => i.IVR_NO).HasDatabaseName("IX_Inspection_IVR_NO");
            //builder.HasIndex(i => i.IRN_Conflict).HasDatabaseName("IX_Inspection_IRN_Conflict");
        }
    }
}
