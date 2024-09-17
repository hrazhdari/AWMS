using AWMS.dto;

namespace AWMS.dapper.Repositories
{
    public interface IScopeDapperRepository
    {
        Task<IEnumerable<ScopeDto>> GetAllAsync();
        IEnumerable<ScopeDto> GetAll();
        Task<ScopeDto> GetByIdAsync(int id);
        Task AddAsync(ScopeDto scope);
        Task UpdateAsync(ScopeDto scope);
        Task DeleteAsync(int id);
    }
}
