namespace AWMS.dto
{
    public class MaterialIssueVoucherDto
    {
        public DateTime? ArrivalDate { get; set; }
        public string Project { get; set; }
        public string Po { get; set; }
        public int VendorId { get; set; }
        public int ItemId { get; set; }
        public string PLName { get; set; }
        public int PK { get; set; }
        public string ItemOfPk { get; set; }
        public string Tag { get; set; }
        public string Description { get; set; }
        public string Unit { get; set; }
        public decimal QtyPL { get; set; } // مقدار Qty در بسته‌بندی‌ها
        public decimal QtyInLoc { get; set; } // مقدار Qty در LocItems
        public decimal Balance { get; set; }
        public decimal Inventory { get; set; }
        public string Discipline { get; set; }
        public string Scope { get; set; }
        public string HeatNo { get; set; }
        public string BatchNo { get; set; }
        public string Remark { get; set; }
        public bool Hold { get; set; }
    }

}
