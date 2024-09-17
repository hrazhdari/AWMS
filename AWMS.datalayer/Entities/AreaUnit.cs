using System.ComponentModel.DataAnnotations;

namespace AWMS.datalayer.Entities
{
    public class AreaUnit
    {
        public AreaUnit()
        {

        }
        [Key]
        public int AreaUnitID { get; set; }
        [Required]
        [MaxLength(200)]
        public string AreaUnitName { get; set; }
        [MaxLength(500)]
        public string? AreaUnitDescription { get; set; }
        public string? AreaUnitTrain { get; set; }
        [DataType(DataType.Date)]
        public DateTime? EnteredDate { get; set; }
        public string? Remark { get; set; }
        public virtual ICollection<PackingList> PackingLists { get; set; }
    }

}
