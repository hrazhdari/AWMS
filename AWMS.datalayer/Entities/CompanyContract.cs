using System.ComponentModel.DataAnnotations;

namespace AWMS.datalayer.Entities
{
    public class CompanyContract
    {
        public CompanyContract()
        {

            EnteredDate = DateTime.Now;
        }

        [Key]
        public int ContractId { get; set; }
        public int? CompanyID { get; set; }
        public string ContractNumber { get; set; }
        public string ContractDescription { get; set; }
        public string ContractRemark { get; set; }
        public int? EnteredBy { get; set; }
        [DataType(DataType.Date)]
        public DateTime? EnteredDate { get; set; }
        public int? EditedBy { get; set; }
        [DataType(DataType.Date)]
        public DateTime? EditedDate { get; set; }
        public virtual Company Company { get; set; }
    }
}
