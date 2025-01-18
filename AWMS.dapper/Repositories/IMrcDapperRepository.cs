using AWMS.dto;

namespace AWMS.dapper.Repositories
{
    public interface IMrcDapperRepository
    {
        void AddMrcs(IEnumerable<ImportMrcDto> Mrcitems, string MrcName, string MrcDescription, int ToCompany,int userid);
        Task<IEnumerable<AllMRCDto>> GetAllMRCAsync();
        Task<IEnumerable<string>> GetUniqueMrcNamesAsync();
        Task DeleteMrcByIdAsync(int mrcId);
        Task DeleteMrcsByMrcNameAsync(string mrcName);
        Task UpdateMrcFieldAsync(object parameters);
        Task<IEnumerable<AllMRCDto>> GetMRCDetailDetailsAsync(string mrcName);
        Task<string?> GetMRCReqCompanyAsync(string mrcName);

    }
}
