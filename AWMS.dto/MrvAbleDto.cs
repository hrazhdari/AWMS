using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AWMS.dto
{
    public class MrvAbleDto
    {
        public int ItemId { get; set; }
        public int LocItemID { get; set; }
        public string Tag { get; set; }
        public string Description { get; set; }
        public string UnitName { get; set; }
        public decimal TotalReqMivQty { get; set; }
        public decimal TotalReserveMivQty { get; set; }
        public decimal TotalDelMivQty { get; set; }
        public decimal TotalReqMivRejQty { get; set; }
        public decimal TotalReserveMivRejQty { get; set; }
        public decimal TotalDelMivRejQty { get; set; }
        public decimal MrvAvailableQty { get; set; }
        public decimal TotalReqMrvQty { get; set; }
        public decimal TotalDelMrvQty { get; set; }
        public decimal TotalDelMrvRejQty { get; set; }

    }

}
