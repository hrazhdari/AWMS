using AWMS.datalayer.Entities;

namespace AWMS.datalayer.Repositories
{
    public interface IDescriptionForPkRepository
    {
        Task<IEnumerable<DescriptionForPk>> GetAllAsync();
        IEnumerable<DescriptionForPk> GetAll();
        Task<DescriptionForPk> GetByIdAsync(int DescriptionForPkId);
        Task<bool> ExistsDescriptionForPkAsync(string Description);
        Task<int> AddAsync(DescriptionForPk DescriptionForPk);
        void Update(DescriptionForPk DescriptionForPk);
        void Delete(DescriptionForPk DescriptionForPk);
    }
}
