using EnocaNLayer.Core.Models;
using EnocaNLayer.Core.Repositories;

namespace EnocaNLayer.Repository.Repositories
{
    public class OrderRepository : GenericRepository<Order>, IOrderRepository
    {
        public OrderRepository(AppDbContext context) : base(context)
        {
        }
    }
}
