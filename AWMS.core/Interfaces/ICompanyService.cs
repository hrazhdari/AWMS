using AWMS.datalayer.Entities;
using AWMS.dto;

namespace AWMS.core.Interfaces
{
    public interface ICompanyService
    {
        Task<IEnumerable<Company>> GetAllCompaniesAsync();
        Task<IEnumerable<CompaneisDto>> GetAllCompaniesNameAsync();
        IEnumerable<Company> GetAllCompanies();
        Company GetCompanyByIdAsync(int id);
        Task<int?> GetByCompanyNameAsync(string Companyname);
        Task<int> AddCompanyAsync(Company company);
        Task UpdateCompanyAsync(Company company);
        Task DeleteCompanyAsync(int id);
    }
}
