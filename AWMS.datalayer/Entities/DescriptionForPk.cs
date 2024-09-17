using System.ComponentModel.DataAnnotations;

namespace AWMS.datalayer.Entities
{
    public class DescriptionForPk
    {
        public DescriptionForPk()
        {

        }
        [Key]
        public int DescriptionForPkId { get; set; }
        [Required]
        [MaxLength(500)]
        public string Description { get; set; }
        public virtual ICollection<PackingList> PackingLists { get; set; }
    }
}
