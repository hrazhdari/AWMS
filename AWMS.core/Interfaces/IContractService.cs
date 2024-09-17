using AWMS.datalayer.Entities;

namespace AWMS.core.Interfaces
{
    public interface IContractService
    {
        Task<IEnumerable<CompanyContract>> GetAllContractsAsync();
        Task<IEnumerable<CompanyContract>> GetAllContractsByCompanyidAsync(int Companyid);
        CompanyContract GetContractByIdAsync(int id);
        Task<int?> GetByContractNumberAsync(string ContractNumber);
        Task<int> AddCompanyContractAsync(CompanyContract CompanyContract);
        Task UpdateCompanyContractAsync(CompanyContract CompanyContract);
        Task DeleteCompanyContractAsync(int id);
        Task DeleteMultipleContractsWithTransactionAsync(IEnumerable<CompanyContract> Contracts);
    }
}
