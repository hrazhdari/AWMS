using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AWMS.dto
{
    public class ApplicationPermissionDto
    {
        public int PermissionID { get; set; }
        public int RoleID { get; set; }
        public string RibbonPageName { get; set; }
        public bool IsEnabled { get; set; }
    }

}
