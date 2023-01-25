using AutoMapper;
using EnocaNLayer.Core.Models;
using EnocaNLayer.Core.Repositories;
using EnocaNLayer.Core.Services;
using EnocaNLayer.Core.UnitOfWorks;

namespace EnocaNLayer.Service.Services
{
    public class OrderService : Service<Order>, IOrderService
    {
        private readonly IOrderRepository _orderRepository;
        private readonly IMapper _mapper;
        public OrderService(IGenericRepository<Order> repository, IUnitOfWork unitOfWork, IMapper mapper, IOrderRepository orderRepository) : base(repository, unitOfWork)
        {
            _mapper = mapper;
            _orderRepository = orderRepository;
        }
    }
}
