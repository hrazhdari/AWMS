﻿using AWMS.dto;

namespace AWMS.core.Interfaces
{
    public interface IPoService
    {
        Task<IEnumerable<PoDto>> GetAllPosAsync();
        IEnumerable<PoDto> GetAllPos();
        Task<PoDto> GetPoByIdAsync(int id);
        Task<int?> GetByPoNameAsync(string PoName);
        Task<int> AddPoAsync(PoDto Po);
        Task UpdatePoAsync(PoDto Po);
        Task DeletePoAsync(int PoId);
        Task DeleteMultiplePosWithTransactionAsync(IEnumerable<PoDto> Pos);
        Task<IEnumerable<PoIdAndPoNameDto>> GetPoIdAndNameAsync();
        IEnumerable<PoIdAndPoNameDto> GetPoIdAndName();
    }
}
