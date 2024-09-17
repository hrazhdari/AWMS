using AWMS.dto;
using AWMS.dto.AWMS.datalayer.Entities;
using System.Data;

namespace AWMS.dapper.Repositories
{
    public interface IRequestDapperRepository
    {
        Task<string?> NextMivNumber();
        Task<int> GetTotalRecordCount();
        Task<int> GetTotalItemRecordCount();
        Task<List<MaterialIssueVoucherDto>> MaterialIssueVoucherFillGrid(int pageNumber, int pageSize);
        Task<List<MaterialIssueVoucherDto>> MaterialIssueVoucherFillGrid2(int pageNumber, int pageSize);
        Task<DataTable> GetLocItemOFSelectedItemID_FOR_ISSUE_VOUCHER(List<int> itemIds);
        Task AddRequests(List<RequestDto> requestMivs);
        Task<bool> CheckMrcDuplicate(int companyid, string mrc);
        Task InsertRequestBatchAsync(List<RequestDto> requestMivs);
        Task<List<string>> InsertRequestBatchWithReturnMivNumberAsync(List<RequestDto> requestMivs, int issuedBy);

        Task<DataTable> GetDataFromDatabaseAsync(string mivNumber);
        Task<DataTable> GetDataFromDatabaseREARAsync(string mivNumber);
    }
}
