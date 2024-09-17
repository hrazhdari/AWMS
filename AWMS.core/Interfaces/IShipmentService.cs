using AWMS.dto;

namespace AWMS.core.Interfaces
{
    public interface IShipmentService
    {
        Task<IEnumerable<ShipmentDto>> GetAllShipmentsAsync();
        IEnumerable<ShipmentDto> GetAllShipments();
        Task<ShipmentDto> GetShipmentByIdAsync(int ShipmentId);
        Task<bool> ExistsShipmentByShipmentNameAsync(string ShipmentName);
        Task<int> AddShipmentAsync(ShipmentDto Shipment);
        Task UpdateShipmentAsync(ShipmentDto Shipment);
        Task DeleteShipmentAsync(int ShipmentId);
        Task DeleteMultipleShipmentsWithTransactionAsync(IEnumerable<ShipmentDto> ShipmentDtos);
    }
}
