using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AWMS.dto
{
        public class MoveItemPackingDetailDto
        {
           // public int PLId { get; set; }
            //public int? LocItemID { get; set; }
            public int? ItemId { get; set; }
            public string? Tag { get; set; }
            public string? Description { get; set; }
            public string? UnitName { get; set; }
        }
}
