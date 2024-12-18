using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AWMS.dto
{
    public class UpdateMRVqtiesDto
    {
        public int LocItemID { get; set; }        // شناسه منحصر به فرد LocItem
        public int ReqLocItemID { get; set; }        // شناسه منحصر به فرد LocItem
        public int PLocItemIDforMRV { get; set; }        // شناسه منحصر به فرد LocItem
        public decimal ReqMrvQty { get; set; }       // شناسه موقعیت جدید
        public decimal DelMrvQty { get; set; }       // شناسه موقعیت جدید
        public decimal DelMrvRejQty { get; set; }       // شناسه موقعیت جدید
        public string MRVRequest { get; set; }       // شناسه موقعیت جدید
        public int EditedBy { get; set; }      // کاربری که تغییرات را ایجاد کرده است
        public DateTime EditedDate { get; set; }  // تاریخ و زمان ویرایش
    }
}
