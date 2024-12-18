using AWMS.dto;

namespace AWMS.dapper.Repositories
{
    public interface IHmvDapperRepository
    {
        Task<IEnumerable<MrvAbleDto>> GetAllMaterialHmvableAsync(int companyId);
        Task<bool> CheckHmvConditionAsync(int locItemId, int companyId, string requestNO);
        Task<bool> CheckHmvNameAsync(int companyId, string hmvNo);
        Task<string> InsertHmvBatchAsync(int companyId, int companyId2, int contractId, int contractId2, string hmvNo, int areaUnitId, int issuedBy, DateTime delDate, IEnumerable<NewHmvDto> requestHmvs);



        Task<List<string>> GetHmvsAsync();
        Task<HmvInfoDto> GetHmvsInfoAsync(string req);
        Task<IEnumerable<HmvUpdateDto>> GetHmvByHmvNoAsync(string req);
        Task<bool> UpdateHmvNameAsync(string req, string hmvName);
        Task<bool> UpdateHmvCompanyAsync(string hmvno, int hmvcompany);
        Task UpdateHmvRemarksAsync(List<UpdateMrvRemarkDto> updateDtos);
        Task UpdateHmvQtyAsync(List<updateHMVqtiesDto> updateDtos);
        Task DeleteHmvRowAsync(int ReqLocItemID, string hmvno);
        Task DeleteHmvAsync(string hmv);
    }
}
