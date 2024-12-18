using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AWMS.dto
{
    public class HmvInfoDto
    {
        public int RequestNO { get; set; }
        public string HMVNO { get; set; }
        public string fromCompanyName { get; set; }
        public string toCompanyName { get; set; }
    }
}
