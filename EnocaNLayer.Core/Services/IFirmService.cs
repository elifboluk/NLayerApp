using EnocaNLayer.Core.DTOs;
using EnocaNLayer.Core.Models;

namespace EnocaNLayer.Core.Services
{
    public interface IFirmService : IService<Firm>
    {
        public Task<CustomResponseDto<FirmWithProductsDto>> GetSingleFirmByIdWithProductsAsync(int firmId);
    }
}
