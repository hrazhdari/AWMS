namespace AWMS.dto
{
    public class UserDto
    {
        public int UserID { get; set; }
        public string Username { get; set; }
        public string PasswordHash { get; set; }
        public int RoleID { get; set; }
    }
}
