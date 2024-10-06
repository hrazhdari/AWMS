using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static AWMS.dapper.ApproveDapperRepository;

namespace AWMS.dapper.Repositories
{
    public interface IApproveDapperRepository
    {
        Task<List<string>> GetNotApprovedMivsAsync();
        Task<DataTable> GetMivByRequestNoAsync(string requestNo);
        Task UpdateMivRequestsBulkAsync(List<MivUpdateModel> updateDataList, int userID);
    }
}
