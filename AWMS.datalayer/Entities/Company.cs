using System.ComponentModel.DataAnnotations;

namespace AWMS.datalayer.Entities
{
    public class Company
    {
        public Company()
        {
            EnteredDate = DateTime.Now;
        }

        [Key]
        public int CompanyID { get; set; }
        public string CompanyName { get; set; }
        public string? Abbreviation { get; set; }
        public string? CompanyLogo { get; set; }
        [DataType(DataType.Date)]
        public DateTime EnteredDate { get; set; }
        public int? Local_Foreign { get; set; }
        public string? Remark { get; set; }

        public virtual ICollection<CompanyContract> Contracts { get; set; }
    }
}
