namespace AWMS.dto
{
    public class MivListDto
    {
        public int RowNumber { get; set; } // شمارنده ردیف
        public int ReqLocItemID { get; set; }
        public int LocItemID { get; set; }
        public int CompanyID { get; set; }
        public int? CompanyID2 { get; set; }
        public int ContractId { get; set; }
        public int? ContractId2 { get; set; }
        public int AreaUnitID { get; set; }
        public int VendorID { get; set; }
        public int TypeID { get; set; }
        public string RequestNO { get; set; }
        public DateTime ReqDate { get; set; }
        public string Item { get; set; }
        public decimal ReqMivQty { get; set; }
        public decimal ReserveMivQty { get; set; }
        public decimal DelMivQty { get; set; }
        public decimal? ReqMivRejQty { get; set; }
        public decimal? ReserveMivRejQty { get; set; }
        public decimal? DelMivRejQty { get; set; }
        public decimal? ReqMrvQty { get; set; }
        public decimal? DelMrvQty { get; set; }
        public decimal? DelMrvRejQty { get; set; }
        public decimal? ReqHmvQty { get; set; }
        public decimal? DelHmvQty { get; set; }
        public decimal? DelHmvRejQty { get; set; }
        public string IssuedBy { get; set; }
        public DateTime? IssuedDate { get; set; }
        public int? ApprovedBy { get; set; }
        public DateTime? ApprovedDate { get; set; }
        public DateTime? DelDate { get; set; }
        public string Remark { get; set; }
        public string MRCNO { get; set; }
        public string MRVNO { get; set; }
        public string HMVNO { get; set; }
        public string RequestPDF { get; set; }
        public int RequestTypeTypeID { get; set; }
        public string UnitName { get; set; }
        public int ItemId { get; set; }
        public string CompanyName { get; set; }
        public string ContractNumber { get; set; }
    }

}
