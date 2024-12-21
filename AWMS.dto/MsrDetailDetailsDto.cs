using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AWMS.dto
{
    public class MsrDetailDetailsDto
    {
        public int PLId { get; set; }              // شناسه بسته‌بندی
        public int PK { get; set; }                // شناسه پکیج
        public string ItemOfPk { get; set; }       // آیتم مربوط به پکیج
        public string Tag { get; set; }            // برچسب
        public string Description { get; set; }    // توضیحات
        public string UnitName { get; set; }       // نام واحد
        public decimal Qty { get; set; }            // مقدار
        public decimal QtyRec { get; set; }         // مقدار دریافتی
        public decimal OverQty { get; set; }        // مقدار بیش از حد
        public decimal ShortageQty { get; set; }    // مقدار کمبود
        public decimal DamageQty { get; set; }      // مقدار آسیب
        public decimal RejectQty { get; set; }      // مقدار رد شده
        public decimal NetW { get; set; }           // وزن خالص
        public decimal GrossW { get; set; }         // وزن ناخالص
        public string LocationName { get; set; }   // نام مکان
        public string Remark { get; set; }         // توضیحات اضافی
        public string ScopeName { get; set; }         // توضیحات اضافی
    }

}
