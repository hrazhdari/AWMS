using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data;

namespace AWMS.datalayer.Entities
{
    [Table("Permissions")] // نام جدول در دیتابیس
    public class ApplicationPermission
    {
        [Key]
        public int PermissionID { get; set; } // کلید اصلی

        [Required]
        [ForeignKey("Role")]
        public int RoleID { get; set; } // کلید خارجی به جدول Roles

        [Required]
        [MaxLength(200)]
        public string RibbonPageName { get; set; } // نام تب (صفحه روبان)

        [Required]
        public bool IsEnabled { get; set; } // تعیین فعال بودن دسترسی

        // تعریف ناوبری به جدول Roles
        public virtual ApplicationRole Role { get; set; }
    }
}
