using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace AWMS.datalayer.Entities.Configurations
{
    public class RequestConfiguration : IEntityTypeConfiguration<Request>
    {
        public void Configure(EntityTypeBuilder<Request> builder)
        {
            builder.HasKey(r => r.ReqLocItemID);

            builder.Property(r => r.RequestNO)
                .HasMaxLength(100)
                .IsUnicode(false);

            builder.Property(r => r.ReqMivQty)
                .HasPrecision(18, 2);

            builder.Property(r => r.ReserveMivQty)
                .HasPrecision(18, 2);

            builder.Property(r => r.DelMivQty)
                .HasPrecision(18, 2);

            builder.Property(r => r.ReqMivRejQty)
                .HasPrecision(18, 2);

            builder.Property(r => r.ReserveMivRejQty)
                .HasPrecision(18, 2);

            builder.Property(r => r.DelMivRejQty)
                .HasPrecision(18, 2);

            builder.Property(r => r.ReqMrvQty)
                .HasPrecision(18, 2);

            builder.Property(r => r.DelMrvQty)
                .HasPrecision(18, 2);

            builder.Property(r => r.ReqHmvQty)
                .HasPrecision(18, 2);


            builder.Property(r => r.DelHmvQty)
                .HasPrecision(18, 2);

            builder.Property(r => r.DelHmvRejQty)
                .HasPrecision(18, 2);

            builder.Property(r => r.DelMrvRejQty)
                .HasPrecision(18, 2);

            builder.Property(r => r.ReqDate)
                .HasColumnType("date");

            builder.Property(r => r.IssuedDate)
                .HasColumnType("date");

            builder.Property(r => r.ApprovedDate)
                .HasColumnType("date");

            builder.Property(r => r.DelDate)
                .HasColumnType("date");

            builder.Property(r => r.PLocItemIDforMRV)
                .IsRequired(false) // اختیاری بودن فیلد
                .HasComment("Parent LocItemID for MRV process"); // توضیحی برای این فیلد اضافه می‌کند


            // پیکربندی رابطه بین Request و LocItem
            builder.HasOne(r => r.LocItem)
                .WithMany(li => li.Requests)
                .HasForeignKey(r => r.LocItemID)
                .OnDelete(DeleteBehavior.Restrict);

            // اضافه کردن ایندکس‌ها
            builder.HasIndex(r => r.LocItemID).HasDatabaseName("IX_Request_LocItemID");
            builder.HasIndex(r => r.CompanyID).HasDatabaseName("IX_Request_CompanyID");
            builder.HasIndex(r => r.TypeID).HasDatabaseName("IX_Request_TypeID");
        }
    }
}
