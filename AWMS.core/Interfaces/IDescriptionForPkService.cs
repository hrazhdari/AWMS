using AWMS.dto;

namespace AWMS.core.Interfaces
{
    public interface IDescriptionForPkService
    {
        Task<IEnumerable<DescriptionForPkDto>> GetAllDescriptionForPksAsync();
        IEnumerable<DescriptionForPkDto> GetAllDescriptionForPks();
        Task<DescriptionForPkDto> GetDescriptionForPkByIdAsync(int DescriptionForPkId);
        Task<bool> ExistsDescriptionForPkIdAsync(string Description);
        Task<int> AddDescriptionForPkAsync(DescriptionForPkDto DescriptionForPk);
        Task UpdateDescriptionForPkAsync(DescriptionForPkDto DescriptionForPk);
        Task DeleteDescriptionForPkAsync(int DescriptionForPkId);
        Task DeleteMultipleDescriptionForPksWithTransactionAsync(IEnumerable<DescriptionForPkDto> DescriptionForPkDtos);
    }
}
