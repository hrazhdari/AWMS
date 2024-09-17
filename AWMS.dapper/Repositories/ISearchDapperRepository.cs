using AWMS.dto;
using System.Data;

namespace AWMS.dapper.Repositories
{
    public interface ISearchDapperRepository
    {
        Task<int> GetTotalItemRecordCount();

        Task<List<SearchItemDto>> SearchItemFillGrid(int pageNumber, int pageSize);
        Task<List<SearchItemDto>> SearchItemFillGrid2();
        List<SearchItemDto> SearchItemFillGrid3();
        List<SearchItemDto> SearchItemFillGridWithDataReader();
        List<SearchLocItemDto> SearchLocItemFillGridWithDataReader();
        DataTable SearchMivFillGrid();
        List<SearchMivDto> SearchMivFillGrid2();

    }
}
