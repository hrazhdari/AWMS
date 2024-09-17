namespace AWMS.dto
{
    public class SearchLocItemDto
    {
        public DateTime? ArrivalDate { get; set; }
        public string Project { get; set; }
        public string PoName { get; set; }
        public string Vendor { get; set; }
        public string ArchiveNO { get; set; }
        public int ItemId { get; set; }
        public int LocItemID { get; set; }
        public string PLName { get; set; }
        public string LocationName { get; set; }
        public int PK { get; set; }
        public string ItemOfPk { get; set; }
        public string Tag { get; set; }
        public string Description { get; set; }
        public string UnitName { get; set; }
        public decimal QtyPL { get; set; } // مقدار Qty در بسته‌بندی‌ها
        public decimal QtyInLoc { get; set; } // مقدار Qty در LocItems
        public decimal Balance { get; set; }
        public decimal Inventory { get; set; }
        public decimal TotalReturnAcceptQty { get; set; }
        public decimal ReqMivQty { get; set; }
        public decimal DelMivQty { get; set; }
        public decimal ReserveMivQty { get; set; }
        public decimal NISQty { get; set; }
        public decimal RejectQty { get; set; }
        public string Discipline { get; set; }
        public string Scope { get; set; }
        public string HeatNo { get; set; }
        public string Supplier { get; set; }
        public string BatchNo { get; set; }
        public string Remark { get; set; }
        public bool Hold { get; set; }
    }

}
