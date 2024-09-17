using AWMS.dto;

namespace AWMS.dapper.Repositories
{
    public interface IUploadDapperRepository
    {
        bool UpdatePackingListPLDPF(string fileName, string filePath);
        bool UpdateIRNPDF(string fileName, string filePath);
        bool UpdateRequestMIVPDF(string fileName, string filePath);
        bool UpdatePKMSRPDF(string fileName, string filePath);
        IEnumerable<PDFSsectionPLDto> GetPackingLists();
        IEnumerable<PDFsectionIRNDto> GetIrns();
        IEnumerable<PDFsectionMIVDto> GetMIVs();
    }
}
