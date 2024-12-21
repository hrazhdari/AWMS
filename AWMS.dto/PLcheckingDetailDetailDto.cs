using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AWMS.dto
{
    public class PLcheckingDetailDetailDto
    {
        public string PK { get; set; }
        public string ItemOfPk { get; set; }
        public string Tag { get; set; }
        public string Description { get; set; }
        public string UnitName { get; set; }
        public decimal? Qty { get; set; }
        public decimal? OverQty { get; set; }
        public decimal? ShortageQty { get; set; }
        public decimal? MaterialRec { get; set; }
        public decimal? DamageQty { get; set; }
        public string ScopeName { get; set; }
        public string BatchNo { get; set; }
        public decimal? ItemNetW { get; set; }
        public decimal? ItemGrossW { get; set; }
        public decimal? Price { get; set; }
        public string BaseMaterial { get; set; }
        public string LocationName { get; set; }
    }

}
