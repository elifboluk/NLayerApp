using EnocaNLayer.Core.Models;
using EnocaNLayer.Core.Repositories;

namespace EnocaNLayer.Repository.Repositories
{
    public class ProductRepository : GenericRepository<Product>, IProductRepository
    {
        public ProductRepository(AppDbContext context) : base(context)
        {
        }                
    }
}
