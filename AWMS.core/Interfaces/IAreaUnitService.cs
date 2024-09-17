using AWMS.dto;

namespace AWMS.core.Interfaces
{
    public interface IAreaUnitService
    {
        Task<IEnumerable<AreaUnitDto>> GetAllAreaUnitsAsync();
        IEnumerable<AreaUnitDto> GetAllAreaUnits();
        Task<AreaUnitDto> GetAreaUnitByIdAsync(int AreaUnitID);
        Task<bool> ExistsAreaUnitAsync(string AreaUnitName);
        Task<int> AddAreaUnitAsync(AreaUnitDto AreaUnit);
        Task UpdateAreaUnitAsync(AreaUnitDto AreaUnit);
        Task DeleteAreaUnitAsync(int AreaUnitID);
        Task DeleteMultipleAreaUnitsWithTransactionAsync(IEnumerable<AreaUnitDto> AreaUnitDtos);
    }
}
