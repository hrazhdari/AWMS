using AWMS.dto;
using System.Data;
using static AWMS.dapper.ApproveDapperRepository;

namespace AWMS.dapper.Repositories
{
    public interface IInspectionDapperRepository
    {
        Task<List<InspectionDetailsDto>> GetInspectionDetails();
        Task UpdateInspectionDetailsAsync(UpdateInspectionDetailsDto updatedRow);

        Task<IEnumerable<InspectionNotHaveMsrDto>> GetInspectionDetailsWithEmptyMSRAsync();
        Task<IEnumerable<InspectionMsrRevDto>> GetInspectionDetailsWithMSRAsync();
        Task<string> RegisterMsrAsync(int plId,int userID);
        Task<string> UpdateMsrRevAsync(int plId,int MsrRev ,int userID);
        Task<bool> ClearMsrAsync(int plId);
    }
}
