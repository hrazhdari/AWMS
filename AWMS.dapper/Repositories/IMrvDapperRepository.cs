using AWMS.dto;

namespace AWMS.dapper.Repositories
{
    public interface IMrvDapperRepository
    {
        Task<IEnumerable<MrvAbleDto>> GetAllMaterialMrvableAsync(int companyId);
        Task<bool> CheckMrvConditionAsync(int locItemId, int companyId, string requestNO);
        Task<bool> CheckMrvNameAsync(int companyId, string mrvNo);
        Task<string> InsertMrvBatchAsync(int companyId, int contractId, string mrvNo, int areaUnitId, int issuedBy, DateTime delDate, IEnumerable<NewMrvDto> requestMrvs);


        Task<List<string>> GetMrvsAsync();
        Task<MrvInfoDto> GetMrvsInfoAsync(string req);
        Task<IEnumerable<MrvUpdateDto>> GetMrvByMrvNoAsync(string req);
    }
}
