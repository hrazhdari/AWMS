using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AWMS.dto
{
    public class InspectionNotHaveMsrDto
    {
        public string? PoName { get; set; }
        public string? IrnName { get; set; }
        public int PLId { get; set; }
        public string? PLName { get; set; }
        public string? OPINO { get; set; }
        public string? Project { get; set; }
        public string? VendorName { get; set; }
        public string? SupplierName { get; set; }
        public decimal? NetW { get; set; }
        public decimal? GrossW { get; set; }
        public string? IVR_NO { get; set; }
        public string? IVR_IFR { get; set; }
        public string? DesciplineName { get; set; }
        public string? MSRNO { get; set; }
        public DateTime? MSRDate { get; set; }
    }

}
