using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace AWMS.datalayer.Entities
{
    public class Mrc
    {
        public Mrc()
        {
           
        }

        [Key]
        public int MrcId { get; set; }
        public int? ToCompanyID { get; set; }
        public string? MrcName { get; set; }
        public string? MrcDescription { get; set; }
        public int? PK { get; set; }
        public int? ItemOfPk { get; set; }
        public string? Tag { get; set; }
        public string? Description { get; set; }
        public int? UnitID { get; set; }
        public decimal? Qty { get; set; }
        public string? Size1 { get; set; }
        public string? Size2 { get; set; }
        public string? BatchNo { get; set; }
        public string? DocNo { get; set; }
        public string? Remark { get; set; }
        public int? EnteredBy { get; set; }
        [DataType(DataType.Date)]
        public DateTime? EnteredDate { get; set; }
        public int? EditedBy { get; set; }
        [DataType(DataType.Date)]
        public DateTime? EditedDate { get; set; }

        [ForeignKey(nameof(UnitID))]
        public virtual Unit Unit { get; set; }
        [ForeignKey(nameof(ToCompanyID))]
        public virtual Company Company { get; set; }
    }
}
