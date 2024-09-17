using System.ComponentModel.DataAnnotations;

namespace AWMS.datalayer.Entities
{
    public class Location
    {
        public Location()
        {
        }
        [Key]
        public int LocationID { get; set; }
        public string LocationName { get; set; }
        public string? LocationWarehouse { get; set; }
        public int? EnteredBy { get; set; }
        [DataType(DataType.Date)]
        public DateTime? EnteredDate { get; set; }
        public int? EditedBy { get; set; }
        [DataType(DataType.Date)]
        public DateTime? EditedDate { get; private set; }
        public virtual ICollection<LocItem> LocItems { get; set; }
    }
}
