using AWMS.dto;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AWMS.dapper.Repositories
{
    public interface IMrvDapperRepository
    {
        Task<IEnumerable<MrvAbleDto>> GetAllMaterialMrvableAsync(int companyId);
        Task<bool> CheckMrvConditionAsync(int locItemId, int companyId);
        Task<string> InsertMrvBatchAsync(int companyId, int contractId, string mrvNo, int areaUnitId, int issuedBy, DateTime delDate, IEnumerable<NewMrvDto> requestMrvs);
    }
}
