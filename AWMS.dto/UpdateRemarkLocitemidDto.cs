using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AWMS.dto
{
    public class UpdateRemarkLocitemidDto
    {
        public int LocItemID { get; set; }        // شناسه منحصر به فرد LocItem
        public string RemarkLocitemID { get; set; }       
        public int EditedBy { get; set; }      // کاربری که تغییرات را ایجاد کرده است
        public DateTime EditedDate { get; set; }  // تاریخ و زمان ویرایش
    }
}
