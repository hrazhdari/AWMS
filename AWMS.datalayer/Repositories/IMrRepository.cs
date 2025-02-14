﻿using AWMS.datalayer.Entities;
using AWMS.dto;

namespace AWMS.datalayer.Repositories
{
    public interface IMrRepository
    {
        Task<IEnumerable<Mr>> GetAllAsync();
        IEnumerable<Mr> GetAll();
        Task<IEnumerable<MrIdAndMrNameDto>> GetMrIdAndNameAsync();
        IEnumerable<MrIdAndMrNameDto> GetMrIdAndName();
        Task<Mr> GetByIdAsync(int id);
        Task<int?> GetByNameAsync(string MrName);
        Task<int> AddAsync(Mr mr);
        Task UpdateAsync(Mr mr);
        Task DeleteAsync(Mr mr);
    }
}
