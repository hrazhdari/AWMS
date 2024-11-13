using AWMS.dto;

namespace AWMS.dapper.Repositories
{
    public interface IChangeDapperRepository
    {
        List<ChangeLocDto> SearchFillLocChange();
        //Task UpdateLocItemsLocationAsync(List<int> locItemIds, int newLocationId);
        Task<string> UpdateLocItemsLocationAsync(List<int> locItemIds, int newLocationId ,int userID);
        Task<string> UpdateBalanceAndAddLocItem(int ItemId, int LocItemID, decimal Qty, int LocationID, int EnteredBy,decimal MrvOrNot);
        Task<string> UpdateRemarkLocItemID(int ItemId, int LocItemID,string Remark,int EnteredBy);
        Task UpdateNisQtyAsync(int locItemId, decimal nisQty, decimal balance);
        Task UpdateExpireDateAsync(List<int> itemIds, DateTime expireDate);
        Task<IEnumerable<MivListDto>> GetRequestsByLocItemIdAsync(int locItemId);
    }
}
