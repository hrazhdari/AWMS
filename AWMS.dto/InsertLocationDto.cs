namespace AWMS.dto
{
    public class InsertLocationDto
    {
        public int LocationID { get; set; }
        public string LocationName { get; set; }
        public string LocationWarehouse { get; set; }
        public int EnteredBy { get; set; }
        public DateTime EnteredDate { get; set; }
    }
}
