namespace AWMS.dto
{
    public class ChangeLocDto
    {
        public DateTime? ArrivalDate { get; set; }
        public string ArchiveNO { get; set; }
        public DateTime? MARDate { get; set; }
        public DateTime? ExpiredDate { get; set; }
        public string OPINO { get; set; }
        public string PLNO { get; set; }
        public string Project { get; set; }
        public string PoName { get; set; }
        public string Vendor { get; set; }
        public int ItemId { get; set; }
        public int ParentLocItemID { get; set; }
        public string RemarkLocitemID { get; set; }
        public string PLName { get; set; }
        public string PK { get; set; }
        public string ItemOfPk { get; set; }
        public string Tag { get; set; }
        public string Description { get; set; }
        public string UnitName { get; set; }
        public decimal QtyPL { get; set; }
        public decimal QtyInLoc { get; set; }
        public decimal BalanceWithRejectAndNIS { get; set; }
        public decimal BalanceWithReject { get; set; }
        public decimal Balance { get; set; }
        public decimal Inventory { get; set; }
        public string Discipline { get; set; }
        public string Scope { get; set; }
        public string HeatNo { get; set; }
        public string BatchNo { get; set; }
        public string Remark { get; set; }
        public bool Hold { get; set; }
        public decimal ReturnQty { get; set; }
        public decimal ReqMivQty { get; set; }
        public decimal DelMivQty { get; set; }
        public decimal ReserveMivQty { get; set; }
        public decimal NISQty { get; set; }
        public decimal RejectQty { get; set; }
        public decimal DelMivRejQty { get; set; }
        //public decimal DelMrvRejQty { get; set; }
        public decimal OverQty { get; set; }
        public decimal ShortageQty { get; set; }
        public decimal DamageQty { get; set; }
        public string SupplierName { get; set; }
        public int LocItemID { get; set; }
        public string LocationName { get; set; }
        public int LocationID { get; set; }
    }
}
