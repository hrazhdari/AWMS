namespace AWMS.dto
{
    public class ApproveMivDto
    {
        public string CompanyName { get; set; } // Companies.CompanyName
        public string ContractNumber { get; set; } // CompanyContracts.ContractNumber
        public int ReqLocItemID { get; set; } // Requests.ReqLocItemID
        public string PLName { get; set; } // SubQuery.PLName
        public string PK { get; set; } // SubQuery.PK
        public string ItemOfPk { get; set; } // SubQuery.ItemOfPk
        public string Tag { get; set; } // SubQuery.Tag
        public string Description { get; set; } // SubQuery.Description
        public string UnitName { get; set; } // SubQuery.UnitName
        public string RequestNO { get; set; } // Requests.RequestNO
        public decimal ReqMivQty { get; set; } // Requests.ReqMivQty
        public decimal ReserveMivQty { get; set; } // Requests.ReserveMivQty
        public decimal DelMivQty { get; set; } // Requests.DelMivQty
        public DateTime ReqDate { get; set; } // Requests.ReqDate
        public string MRCNO { get; set; } // Requests.MRCNO
        public string IssuedBy { get; set; } // Requests.IssuedBy
        public DateTime? IssuedDate { get; set; } // Requests.IssuedDate
        public string ApprovedBy { get; set; } // Requests.ApprovedBy
        public DateTime? ApprovedDate { get; set; } // Requests.ApprovedDate
        public string LocationName { get; set; } // SubQuery.LocationName
        public string ScopeName { get; set; } // SubQuery.ScopeName
    }
}
