using AutoMapper;
using EnocaNLayer.Core.Models;
using EnocaNLayer.Core.Repositories;
using EnocaNLayer.Core.Services;
using EnocaNLayer.Core.UnitOfWorks;

namespace EnocaNLayer.Service.Services
{
    public class ProductService : Service<Product>, IProductService
    {
        private readonly IProductRepository _productRepository;
        private readonly IMapper _mapper;
        public ProductService(IGenericRepository<Product> repository, IUnitOfWork unitOfWork, IMapper mapper, IProductRepository productService) : base(repository, unitOfWork)
        {
            _mapper = mapper;
            _productRepository = productService;
        }
    }
}
