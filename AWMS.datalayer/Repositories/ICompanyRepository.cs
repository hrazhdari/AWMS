using AWMS.datalayer.Entities;
using AWMS.dto;

namespace AWMS.datalayer.Repositories
{
    public interface ICompanyRepository
    {
        Task<IEnumerable<Company>> GetAllAsync();
        Task<IEnumerable<CompaneisDto>> GetAllCompanyNamesAsync();
        IEnumerable<Company> GetAll();
        Company GetByIdAsync(int id);
        Task<int?> GetByNameAsync(string name);
        Task<int> AddAsync(Company company);
        void Update(Company company);
        void Delete(Company company);
    }
}
