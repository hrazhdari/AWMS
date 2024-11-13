namespace AWMS.dto
{
    public class NewMrvDto
    {
        public decimal ReqMrvQty { get; set; }
        public decimal DelMrvQty { get; set; }
        public decimal DelMrvRejQty { get; set; }
        public int LocItemID { get; set; }
        public string Remark { get; set; }
        public string RequestNO { get; set; }
        public int? SelectedLocation { get; set; }
        public string typeName { get; set; }
    }


}
