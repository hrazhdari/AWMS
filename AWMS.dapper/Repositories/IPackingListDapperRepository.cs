﻿using AWMS.dto;

namespace AWMS.dapper.Repositories
{
    public interface IPackingListDapperRepository
    {
        Task<IEnumerable<PackingListDto>> GetAllAsync();
        Task<IEnumerable<PackingListAllPlNameDto>> GetAllPlNameAsync();
        Task<IEnumerable<AllItemSelectedPlDto>> AllItemSelectedPlAsync(int plId);
        Task<IEnumerable<PackingListAllPlNameDto>> GetPackingListsWithoutPackagesAsync();
        Task<PackingListDto> GetByIdAsync(int PlId);
        Task<PackingListDto> GetByPlNameAsync(string PlName);
        Task<bool> ExistsByPlNameAsync(string plName);
        Task<bool> ExistsByPlNoAsync(string PlNo);
        bool ExistsByOpiNumber(string OpiNumber);
        string LastArchiveNo();
        Task<bool> AddAsync(PackingListDto PackingList);
        Task<(bool Success, string ErrorMessage)> UpdateAsync(PackingListDto packingListDto);
        Task DeleteAsync(int PlId);



        Task<List<GetAllPackingListNameDto>> GetAllPackingListNamesAsync();
        Task<List<PLcheckingHeaderDetailDto>> GetPackingListHeaderDetailsByPLIdAsync(int plId);
        Task<List<PLcheckingDetailDetailDto>> GetPackingListDetailDetailsByPLIdAsync(int plId);
        Task<List<MoveItemPackingDetailDto>> GetPackingListMoveItemDetailsAsync(int plId);
    }
}
