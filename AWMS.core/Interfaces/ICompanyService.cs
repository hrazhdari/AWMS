using AWMS.datalayer.Entities;

namespace AWMS.core.Interfaces
{
    public interface ICompanyService
    {
        Task<IEnumerable<Company>> GetAllCompaniesAsync();
        IEnumerable<Company> GetAllCompanies();
        Company GetCompanyByIdAsync(int id);
        Task<int?> GetByCompanyNameAsync(string Companyname);
        Task<int> AddCompanyAsync(Company company);
        Task UpdateCompanyAsync(Company company);
        Task DeleteCompanyAsync(int id);
    }
}
