namespace AWMS.dto
{
    public class ImportMrcDto
    {
        public int? ToCompanyID { get; set; }
        public string? MrcName { get; set; }
        public string? MrcDescription { get; set; }
        public int? PK { get; set; }
        public int? ItemOfPk { get; set; }
        public string? Tag { get; set; }
        public string? Description { get; set; }
        public string? UnitID { get; set; }
        public decimal? Qty { get; set; }
        public string? Size1 { get; set; }
        public string? Size2 { get; set; }
        public string? BatchNo { get; set; }
        public string? DocNo { get; set; }
        public string? Remark { get; set; }
        public int? EnteredBy { get; set; }
        public DateTime? EnteredDate { get; set; }
    }
}
