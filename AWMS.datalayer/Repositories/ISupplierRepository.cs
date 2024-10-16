﻿using AWMS.datalayer.Entities;

namespace AWMS.datalayer.Repositories
{
    public interface ISupplierRepository
    {
        Task<IEnumerable<Supplier>> GetAllAsync();
        IEnumerable<Supplier> GetAll();
        Task<Supplier> GetByIdAsync(int supplierId);
        Task<bool> ExistsSupplierAsync(string SupplierName);
        Task<int> AddAsync(Supplier supplier);
        void Update(Supplier supplier);
        void Delete(Supplier supplier);
    }
}
