using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AWMS.dto
{
    public class PDFsectionMIVDto
    {
        public string RequestNO { get; set; }
        public string DPF { get; set; } // RequestPDF به DPF تغییر نام داده شده است
        public string MRCNO { get; set; }
        public string MRVNO { get; set; }
        public string HMVNO { get; set; }
        public string IssuedBy { get; set; }
        public DateTime? IssuedDate { get; set; }
        public string ApprovedBy { get; set; }
        public DateTime? ApprovedDate { get; set; }
    }
}
