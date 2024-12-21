using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AWMS.dto
{
    public class MsrHeaderDetailsDto
    {
        public int PLId { get; set; } // شناسه لیست بسته‌بندی
        public string? PLName { get; set; } // نام لیست بسته‌بندی
        public DateTime? MARDate { get; set; } // تاریخ MAR
        public string? VendorName { get; set; } // نام فروشنده
        public string? IrnName { get; set; } // نام IRN
        public string? SupplierName { get; set; } // نام تامین‌کننده
        public string? PoName { get; set; } // نام PO
        public string? IVR_NO { get; set; } // شماره IVR از Inspection
        public string? MSRNO { get; set; } // شماره MSR
        public DateTime? MSRDate { get; set; } // تاریخ MSR
        public string? MSRRev { get; set; } // بازنگری MSR
    }

}
