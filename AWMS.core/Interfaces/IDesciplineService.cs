using AWMS.dto;

namespace AWMS.core.Interfaces
{
    public interface IDesciplineService
    {
        Task<IEnumerable<DesciplineDto>> GetAllDesciplinesAsync();
        IEnumerable<DesciplineDto> GetAllDesciplines();
        Task<DesciplineDto> GetDisciplineByIdAsync(int desciplineId);
        Task<int> AddDisciplineAsync(DesciplineDto descipline);
        Task UpdateDisciplineAsync(DesciplineDto descipline);
        Task DeleteDisciplineAsync(int desciplineId);
        Task DeleteMultipleDesciplinesWithTransactionAsync(IEnumerable<DesciplineDto> disciplineDtos);
    }
}
