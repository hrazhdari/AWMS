﻿using AWMS.dto;

namespace AWMS.dapper.Repositories
{
    public interface IUserDapperRepository
    {
        // متد برای دریافت کاربر بر اساس شناسه
        Task<UserDto> GetUserByIdAsync(int userId);

        // متد برای دریافت کاربر بر اساس نام کاربری
        Task<UserDto> GetUserByUsernameAsync(string username);

        // متد برای اضافه کردن کاربر جدید
        Task<int> AddUserAsync(UserDto user);

        // متد برای به‌روزرسانی اطلاعات کاربر
        Task<int> UpdateUserAsync(UserDto user);

        // متد برای حذف کاربر بر اساس شناسه
        Task<int> DeleteUserAsync(int userId);

        // متد برای دریافت تمامی کاربران
        Task<IEnumerable<UserDto>> GetAllUsersAsync();
        IEnumerable<UserDto> GetAllUsers();

        Task<IEnumerable<RoleDto>> GetAllRolesAsync();
        Task<IEnumerable<ApplicationPermissionDto>> GetPermissionsByRoleIdAsync(int roleId);
        Task<bool> UpdatePermissionsUsingStoredProcedureAsync(int roleId, List<dynamic> permissions);
        Task<bool> UpdatePermissionsUsingJsonAsync(int roleId, string jsonPermissions);
        Task<int> UpdateUserPasswordAsync(UserDto user);

    }
}
