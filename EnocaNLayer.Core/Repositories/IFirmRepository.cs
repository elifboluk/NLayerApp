using EnocaNLayer.Core.Models;

namespace EnocaNLayer.Core.Repositories
{
    public interface IFirmRepository : IGenericRepository<Firm>
    {
        Task<Firm> GetSingleFirmByIdWithProductsAsync(int firmId);
    }
}
