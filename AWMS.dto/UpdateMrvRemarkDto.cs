using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AWMS.dto
{
    public class UpdateMrvRemarkDto
    {
        public int LocItemID { get; set; }        // شناسه منحصر به فرد LocItem
        public string RemarkRequests { get; set; }       // شناسه موقعیت جدید
        public string MRVRequest { get; set; }       // شناسه موقعیت جدید
        public int EditedBy { get; set; }      // کاربری که تغییرات را ایجاد کرده است
        public DateTime EditedDate { get; set; }  // تاریخ و زمان ویرایش
    }
}
