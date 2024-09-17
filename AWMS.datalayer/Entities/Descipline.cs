using System.ComponentModel.DataAnnotations;

namespace AWMS.datalayer.Entities
{
    public class Descipline
    {
        public Descipline()
        {

        }

        [Key]
        public int DesciplineId { get; set; }
        [Required]
        [MaxLength(200)]
        public string DesciplineName { get; set; }
        public virtual ICollection<PackingList> PackingLists { get; set; }
    }
}
