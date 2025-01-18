using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AWMS.dto
{
    public class AllMRCDto
    {
        public int MrcId { get; set; }
        public string? ToCompany { get; set; }
        public string? MrcName { get; set; }
        public string? MrcDescription { get; set; }
        public int? PK { get; set; }
        public int? ItemOfPk { get; set; }
        public string? Tag { get; set; }
        public string? Description { get; set; }
        public string? Unit { get; set; }
        public decimal? Qty { get; set; }
        public string? Size1 { get; set; }
        public string? Size2 { get; set; }
        public string? BatchNo { get; set; }
        public string? DocNo { get; set; }
        public string? Remark { get; set; }
        public string? EnteredBy { get; set; }
        public DateTime? EnteredDate { get; set; }
        public string? EditedBy { get; set; }
        public DateTime? EditedDate { get; set; }
    }
}
