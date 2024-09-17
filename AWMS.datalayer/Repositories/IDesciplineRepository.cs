using AWMS.datalayer.Entities;

namespace AWMS.datalayer.Repositories
{
    public interface IDesciplineRepository
    {
        Task<IEnumerable<Descipline>> GetAllAsync();
        IEnumerable<Descipline> GetAll();
        Task<Descipline> GetByIdAsync(int desciplineId);
        Task<int> AddAsync(Descipline descipline);
        void Update(Descipline descipline);
        void Delete(Descipline descipline);
    }
}
