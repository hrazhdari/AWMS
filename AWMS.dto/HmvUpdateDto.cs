using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AWMS.dto
{
    public class HmvUpdateDto
    {
        public int RowNumber { get; set; }
        public string RequestNO { get; set; }
        public string HMVNO { get; set; }
        public string fromCompanyName { get; set; }
        public string toCompanyName { get; set; }
        public int ItemId { get; set; }
        public int LocItemID { get; set; }
        public int ReqLocItemID { get; set; }
        public string PLName { get; set; }
        public string PK { get; set; }
        public string ItemOfPk { get; set; }
        public string Tag { get; set; }
        public string Description { get; set; }
        public string UnitName { get; set; }
        public decimal ReqHmvQty { get; set; }
        public decimal DelHmvQty { get; set; }
        public decimal DelHmvRejQty { get; set; }
        public string ScopeName { get; set; }
        public string RemarkRequests { get; set; }
        public string MRCNO { get; set; }
        public DateTime DelDate { get; set; }
    }
}
