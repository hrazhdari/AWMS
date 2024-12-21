using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AWMS.dto
{
    public class PLcheckingHeaderDetailDto
    {
        public int PLId { get; set; }
        public string PLName { get; set; }
        public string ArchiveNO { get; set; }
        public string OPINO { get; set; }
        public decimal? NetW { get; set; }
        public decimal? GrossW { get; set; }
        public DateTime? MARDate { get; set; }
        public string DesciplineName { get; set; }
        public string Username { get; set; }
        public string MrName { get; set; }
        public string VendorName { get; set; }
        public string AreaUnitName { get; set; }
        public string IrnName { get; set; }
        public string SupplierName { get; set; }
        public string PoName { get; set; }
    }

}
