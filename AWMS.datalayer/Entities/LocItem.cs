using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace AWMS.datalayer.Entities
{
    public class LocItem
    {
        public LocItem()
        {
            EditedDate = DateTime.Now;
        }
        [Key]
        public int LocItemID { get; set; }
        public int? ParentLocItemID { get; set; } // این فیلد را اضافه کنید
        public int LocationID { get; set; }
        public int ItemId { get; set; }
        public decimal? Qty { get; set; }
        public decimal? OverQty { get; set; }
        public decimal? ShortageQty { get; set; }
        public decimal? DamageQty { get; set; }
        public decimal? RejectQty { get; set; }
        public decimal? NISQty { get; set; }
        public int? EnteredBy { get; set; }
        public string? RemarkLocitemID { get; set; }
        // ایجاد ارتباط با LocItem والد
        [ForeignKey(nameof(ParentLocItemID))]
        public virtual LocItem ParentLocItem { get; set; }
        [DataType(DataType.Date)]
        public DateTime? EnteredDate { get; set; }
        public int? EditedBy { get; set; }
        [DataType(DataType.Date)]
        public DateTime? EditedDate { get; private set; }
        [ForeignKey(nameof(ItemId))]
        public virtual Item Item { get; set; }
        [ForeignKey(nameof(LocationID))]
        public virtual Location Location { get; set; }

        public virtual ICollection<Request> Requests { get; set; }

    }
}
