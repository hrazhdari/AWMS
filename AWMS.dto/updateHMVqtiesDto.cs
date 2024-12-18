using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AWMS.dto
{
    public class updateHMVqtiesDto
    {
        public int LocItemID { get; set; }        // شناسه منحصر به فرد LocItem
        public int ReqLocItemID { get; set; }        // شناسه منحصر به فرد LocItem
        public decimal ReqHmvQty { get; set; }       // شناسه موقعیت جدید
        public decimal DelHmvQty { get; set; }       // شناسه موقعیت جدید
        public decimal DelHmvRejQty { get; set; }       // شناسه موقعیت جدید
        public string HMVRequest { get; set; }       // شناسه موقعیت جدید
        public int EditedBy { get; set; }      // کاربری که تغییرات را ایجاد کرده است
        public DateTime EditedDate { get; set; }  // تاریخ و زمان ویرایش
    }
}
