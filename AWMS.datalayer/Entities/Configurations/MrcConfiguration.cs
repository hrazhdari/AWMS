using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Microsoft.EntityFrameworkCore;

namespace AWMS.datalayer.Entities.Configurations
{
    public class MrcConfiguration : IEntityTypeConfiguration<Mrc>
    {
        public void Configure(EntityTypeBuilder<Mrc> builder)
        {
            // تنظیم کلید اصلی
            builder.HasKey(i => i.MrcId);

            // تنظیم نوع داده برای فیلدهای مختلف
            builder.Property(i => i.Qty).HasColumnType("decimal(18,2)");

            // تنظیم حداکثر طول برای فیلدهای مختلف
            builder.Property(i => i.Tag).HasMaxLength(500);
            builder.Property(i => i.Description).HasMaxLength(500);
            builder.Property(i => i.BatchNo).HasMaxLength(500);
            builder.Property(i => i.DocNo).HasMaxLength(500);
            builder.Property(i => i.Remark).HasMaxLength(500);
            builder.Property(i => i.Size1).HasMaxLength(50);
            builder.Property(i => i.Size2).HasMaxLength(50);
            builder.Property(i => i.MrcName).HasMaxLength(200);
            builder.Property(i => i.MrcDescription).HasMaxLength(1000);

            // تنظیم نوع داده برای تاریخ‌ها
            builder.Property(i => i.EnteredDate).HasColumnType("date");
            builder.Property(i => i.EditedDate).HasColumnType("date");

            // اضافه کردن ایندکس‌ها
            builder.HasIndex(i => i.UnitID).HasDatabaseName("IX_Item_UnitID");
            builder.HasIndex(i => i.ToCompanyID).HasDatabaseName("IX_Item_ToCompanyID");

            // تنظیم روابط
            builder.HasOne(i => i.Unit)
                   .WithMany()
                   .HasForeignKey(i => i.UnitID)
                   .OnDelete(DeleteBehavior.Restrict)
                   .HasConstraintName("FK_Mrc_Unit");

            builder.HasOne(i => i.Company)
                   .WithMany()
                   .HasForeignKey(i => i.ToCompanyID)
                   .OnDelete(DeleteBehavior.Restrict)
                   .HasConstraintName("FK_Mrc_Company");
        }
    }
}
