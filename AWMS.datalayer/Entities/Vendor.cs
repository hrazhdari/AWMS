using System.ComponentModel.DataAnnotations;

namespace AWMS.datalayer.Entities
{
    public class Vendor
    {
        public Vendor()
        {
        }
        [Key]
        public int VendorID { get; set; }
        [Required]
        [MaxLength(200)]
        public string VendorName { get; set; }
        [MaxLength(500)]
        public string? VendorContractNO { get; set; }
        [MaxLength(500)]
        public string? VendorContractDescription { get; set; }
        [MaxLength(500)]
        public string? VendorAbbreviation { get; set; }
        [DataType(DataType.Date)]
        public DateTime? EnteredDate { get; set; }
        public int? Local_Foreign { get; set; }
        public string? Remark { get; set; }
        public virtual ICollection<PackingList> PackingLists { get; set; }
    }
}
