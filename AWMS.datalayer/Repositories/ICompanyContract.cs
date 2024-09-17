﻿using AWMS.datalayer.Entities;

namespace AWMS.datalayer.Repositories
{
    public interface ICompanyContract
    {
        Task<IEnumerable<CompanyContract>> GetAllAsync();
        Task<IEnumerable<CompanyContract>> GetAllByCompanyidAsync(int Companyid);
        CompanyContract GetByIdAsync(int id);
        Task<int?> GetByNameAsync(string name);
        Task<int> AddAsync(CompanyContract CompanyContract);
        void Update(CompanyContract CompanyContract);
        void Delete(CompanyContract CompanyContract);
    }
}
