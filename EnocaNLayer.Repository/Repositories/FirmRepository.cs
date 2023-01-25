using EnocaNLayer.Core.Models;
using EnocaNLayer.Core.Repositories;
using Microsoft.EntityFrameworkCore;

namespace EnocaNLayer.Repository.Repositories
{
    public class FirmRepository : GenericRepository<Firm>, IFirmRepository
    {
        public FirmRepository(AppDbContext context) : base(context)
        {
        }

        public async Task<Firm> GetSingleFirmByIdWithProductsAsync(int firmId)
        {
            return await _context.Firms.Include(x=>x.Products).Where(x=>x.Id==firmId).SingleOrDefaultAsync();
        }
    }
}
