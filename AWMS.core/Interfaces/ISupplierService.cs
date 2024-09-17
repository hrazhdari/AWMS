using AWMS.dto;

namespace AWMS.core.Interfaces
{
    public interface ISupplierService
    {
        Task<IEnumerable<SupplierDto>> GetAllSuppliersAsync();
        IEnumerable<SupplierDto> GetAllSuppliers();
        Task<SupplierDto> GetSupplierByIdAsync(int supplierId);
        Task<bool> ExistsSupplierAsync(string SupplierName);
        Task<int> AddSupplierAsync(SupplierDto supplier);
        Task UpdateSupplierAsync(SupplierDto supplier);
        Task DeleteSupplierAsync(int supplierId);
        Task DeleteMultipleSuppliersWithTransactionAsync(IEnumerable<SupplierDto> supplierDtos);
    }
}
