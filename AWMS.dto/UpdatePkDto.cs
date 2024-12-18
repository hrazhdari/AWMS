
namespace AWMS.dto
{
    public class UpdatePkDto
    {
        public int PKID { get; set; }
        public int PLId { get; set; }
        public decimal? NetW { get; set; }
        public decimal? GrossW { get; set; }
        public string? Dimension { get; set; }
        public string? Volume { get; set; }
        public DateTime? ArrivalDate { get; set; }
        public string? Desciption { get; set; }
        public string? Remark { get; set; }
        public int? EditedBy { get; set; }
    }
}
