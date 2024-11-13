using AWMS.dto;

namespace AWMS.dapper.Repositories
{
    public interface IHmvDapperRepository
    {
        Task<IEnumerable<HmvAbleDto>> GetAllMaterialHmvableAsync(int companyId);
        Task<bool> CheckHmvConditionAsync(int locItemId, int companyId, string requestNO);
        Task<bool> CheckHmvNameAsync(int companyId, string hmvNo);
        Task<string> InsertHmvBatchAsync(int companyId, int companyId2, int contractId, int contractId2, string hmvNo, int areaUnitId, int issuedBy, DateTime delDate, IEnumerable<NewHmvDto> requestHmvs);
    }
}
