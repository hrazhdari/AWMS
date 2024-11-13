using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace AWMS.datalayer.Entities.Configurations
{
    public class LocItemConfiguration : IEntityTypeConfiguration<LocItem>
    {
        public void Configure(EntityTypeBuilder<LocItem> builder)
        {
            builder.HasKey(li => li.LocItemID);

            builder.Property(li => li.Qty)
                .HasColumnType("decimal(18,2)");
          
            builder.Property(l => l.FlagMIVorHMV)
                .HasColumnType("tinyint")
                .IsRequired(false) // فیلد اختیاری است
                .HasComment("Flag for MIV or HMV status");

            builder.Property(li => li.OverQty)
                .HasColumnType("decimal(18,2)");

            builder.Property(li => li.ShortageQty)
                .HasColumnType("decimal(18,2)");

            builder.Property(li => li.DamageQty)
                .HasColumnType("decimal(18,2)");

            builder.Property(li => li.RejectQty)
                .HasColumnType("decimal(18,2)");

            builder.Property(li => li.NISQty)
                .HasColumnType("decimal(18,2)");

            builder.Property(li => li.EnteredDate)
                .HasColumnType("date");

            builder.Property(li => li.EditedDate)
                .HasColumnType("date");

            builder.Property(i => i.RemarkLocitemID)
                .HasMaxLength(300)
                .IsRequired(false);  // فیلد اختیاری

            // پیکربندی رابطه بین LocItem و Item
            builder.HasOne(li => li.Item)
                .WithMany(i => i.LocItems)
                .HasForeignKey(li => li.ItemId)
                .OnDelete(DeleteBehavior.Cascade);

            // پیکربندی رابطه بین LocItem و Location
            builder.HasOne(li => li.Location)
                .WithMany(l => l.LocItems)
                .HasForeignKey(li => li.LocationID)
                .OnDelete(DeleteBehavior.Cascade);

            // پیکربندی رابطه بین LocItem و Request
            builder.HasMany(li => li.Requests)
                .WithOne(r => r.LocItem)
                .HasForeignKey(r => r.LocItemID)
                .OnDelete(DeleteBehavior.Restrict); // ممکن است نیاز به Restrict باشد، بسته به نیاز شما

            //builder.HasOne(li => li.ParentLocItem)
            //    .WithMany()
            //    .HasForeignKey(li => li.ParentLocItemID)
            //    .OnDelete(DeleteBehavior.NoAction);


            // پیکربندی رابطه بین LocItem و ParentLocItem به عنوان nullable (پیش‌فرض null)
            builder.HasOne(li => li.ParentLocItem) // ارتباط با LocItem والد
                .WithMany() // اگر نیازی به دسترسی به فرزندان نیست، اینجا خالی بگذارید
                .HasForeignKey(li => li.ParentLocItemID) // کلید خارجی
                .OnDelete(DeleteBehavior.Restrict); // تنظیم رفتار حذف

            // اضافه کردن ایندکس‌ها
            builder.HasIndex(li => li.LocationID).HasDatabaseName("IX_LocItem_LocationID");
            builder.HasIndex(li => li.ItemId).HasDatabaseName("IX_LocItem_ItemId");
            // اضافه کردن ایندکس‌ها
            builder.HasIndex(li => li.ParentLocItemID).HasDatabaseName("IX_LocItem_ParentLocItemID"); builder.HasIndex(li => li.ParentLocItemID).HasDatabaseName("IX_LocItem_ParentLocItemID"); // ایندکس جدید برای ParentLocItemID
        }

    }
}
