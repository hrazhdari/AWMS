using System.ComponentModel.DataAnnotations;

namespace AWMS.datalayer.Entities
{
    public class Supplier
    {
        public Supplier()
        {

        }
        [Key]
        public int SupplierId { get; set; }
        [Required]
        [MaxLength(200)]
        public string SupplierName { get; set; }
        [MaxLength(500)]
        public string? SupplierRemark { get; set; }
        [DataType(DataType.Date)]
        public DateTime? EnteredDate { get; set; }
        public virtual ICollection<PackingList> PackingLists { get; set; }
    }
}
