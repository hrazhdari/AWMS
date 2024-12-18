using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AWMS.dto
{
    public class MrvUpdateDto
    {
        public int RowNumber { get; set; }
        public string RequestNO { get; set; }
        public string MRVNO { get; set; }
        public string CompanyName { get; set; }
        public int ItemId { get; set; }
        public int LocItemID { get; set; }
        public int ReqLocItemID { get; set; }
        public string PLName { get; set; }
        public string PK { get; set; }
        public string ItemOfPk { get; set; }
        public string Tag { get; set; }
        public string Description { get; set; }
        public string UnitName { get; set; }
        public decimal ReqMrvQty { get; set; }
        public decimal DelMrvQty { get; set; }
        public decimal DelMrvRejQty { get; set; }
        public string LocationName { get; set; }
        public int LocationID { get; set; }
        public string ScopeName { get; set; }
        public string RemarkLocitemID { get; set; }
        public string RemarkRequests { get; set; }
        public int PLocItemIDforMRV { get; set; }
        public string MRCNO { get; set; }
        public DateTime DelDate { get; set; }
        public int? ParentLocItemID { get; set; }
    }
}
