namespace AWMS.dto
{
    public class HmvAbleDto
    {
        public int LocItemID { get; set; }
        public string RequestNO { get; set; }
        public string TypeName { get; set; }
        public int ItemId { get; set; }
        public string Tag { get; set; }
        public string Description { get; set; }
        public string UnitName { get; set; }
        public decimal TotalDelMivQty { get; set; }
        public decimal TotalDelMivRejQty { get; set; }
        public decimal MrvHmvAvailableQty { get; set; }
        public decimal TotalReqMrvQty { get; set; }
        public decimal TotalDelMrvQty { get; set; }
        public decimal TotalDelMrvRejQty { get; set; }
        public decimal TotalDelHmvQty { get; set; }
        public decimal TotalDelHmvRejQty { get; set; }
        public decimal TotalGetHmvQty { get; set; }
        public decimal TotalGetHmvRejQty { get; set; }
    }

}
