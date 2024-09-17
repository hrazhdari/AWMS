using AWMS.dto;

namespace AWMS.dapper.Repositories
{
    public interface IChangeDapperRepository
    {
        List<ChangeLocDto> SearchFillLocChange();
        //Task UpdateLocItemsLocationAsync(List<int> locItemIds, int newLocationId);
        Task<string> UpdateLocItemsLocationAsync(List<int> locItemIds, int newLocationId);
        Task<string> UpdateBalanceAndAddLocItem(int ItemId, int LocItemID, decimal Qty, int LocationID, decimal CurrentBalance, int EnteredBy);
        Task UpdateNisQtyAsync(int locItemId, decimal nisQty, decimal balance);
        Task UpdateExpireDateAsync(List<int> itemIds, DateTime expireDate);
        Task<IEnumerable<MivListDto>> GetRequestsByLocItemIdAsync(int locItemId);
    }
}
