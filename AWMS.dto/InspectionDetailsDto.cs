namespace AWMS.dto
{
    public class InspectionDetailsDto
    {
        public int PLId { get; set; }
        public string PLName { get; set; }
        public int? IrnId { get; set; }
        public string IRNName { get; set; }
        public bool IRN_Conflict { get; set; }
        public string IVR_NO { get; set; }
        public string IVR_IFR { get; set; }
        public string OrderStatus { get; set; }
        public bool ThirdParty { get; set; }
        public bool OPI { get; set; }
        public string Description { get; set; }
        public string IcNo { get; set; }
        public string SubProject { get; set; }
        public bool Site { get; set; }
        public bool Laydown { get; set; }
        public bool Warehouse { get; set; }
        public bool OSBL { get; set; }
        public bool? VisualInspection { get; set; }
        public bool? QuantityCheck { get; set; }
        public bool? Marking { get; set; }
        public bool? Unloading { get; set; }
        public string IVRPDF { get; set; }
        public string IFRPDF { get; set; }
        public int? EnteredBy { get; set; }
        public DateTime? EnteredDate { get; set; }
        public int? EditedBy { get; set; }
        public DateTime? EditedDate { get; set; }
    }
}
