using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace AWMS.datalayer.Entities
{
    public class Inspection
    {
        public Inspection()
        {
        }

        [Key]
        public int PLId { get; set; } // استفاده از PLId به عنوان کلید اصلی

        public int? IrnId { get; set; }
        public bool? IRN_Conflict { get; set; }

        public string? IVR_NO { get; set; }
        public string? IVR_IFR { get; set; }
        public string? OrderStatus { get; set; }
        public bool? ThirdParty { get; set; }
        public bool? OPI { get; set; }
        public string? Description { get; set; }
        public string? IcNo { get; set; }
        public string? SubProject { get; set; }
        public bool? Site { get; set; }
        public bool? Laydown { get; set; }
        public bool? Warehouse { get; set; }
        public bool? OSBL { get; set; }
        public bool? VisualInspection { get; set; }
        public bool? QuantityCheck { get; set; }
        public bool? Marking { get; set; }
        public bool? Unloading { get; set; }
        public string? IVRPDF { get; set; }
        public string? IFRPDF { get; set; }

        public int? EnteredBy { get; set; }
        [DataType(DataType.Date)]
        public DateTime? EnteredDate { get; set; }
        public int? EditedBy { get; set; }
        [DataType(DataType.Date)]
        public DateTime? EditedDate { get; private set; }

        // Navigation Property برای اتصال به جدول PackingList
        public virtual PackingList PackingList { get; set; }
    }
}
