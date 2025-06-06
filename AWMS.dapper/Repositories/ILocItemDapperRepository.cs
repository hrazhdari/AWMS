﻿using AWMS.dto;

namespace AWMS.dapper.Repositories
{
    public interface ILocItemDapperRepository
    {
        Task<IEnumerable<LocItemDto>> GetAllAsync();
        Task<LocItemDto> GetByIdAsync(int LocItemid);
        Task<bool> IsLocationUsedAsync(int locationID, int itemId);
        Task AddAsync(LocItemDto Locitem);
        Task UpdateAsync(LocItemDto Locitem);
        Task UpdateLocationsAsync(List<UpdateLocitemLocationDto> updateDtos);
        Task UpdateLocitemRemarksAsync(List<UpdateRemarkLocitemidDto> updateDtos);
        Task DeleteAsync(int LocItemid);
        Task DeleteMultipleLocItemsWithTransactionAsync(IEnumerable<LocItemDto> Locitems);
        Task<IEnumerable<LocItemDto>> GetLocItemsByItemIdAsync(int itemId);
    }
}
