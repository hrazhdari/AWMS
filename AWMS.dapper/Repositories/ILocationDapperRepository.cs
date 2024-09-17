using AWMS.dto;

namespace AWMS.dapper.Repositories
{
    public interface ILocationDapperRepository
    {
        Task<IEnumerable<LocationDto>> GetAllAsync();
        Task<LocationDto> GetByIdAsync(int id);
        Task AddAsync(InsertLocationDto location);
        Task UpdateAsync(LocationDto location);
        List<LocationDto> GetAllLocLocationChange();
        Task DeleteAsync(int id);
    }
}
