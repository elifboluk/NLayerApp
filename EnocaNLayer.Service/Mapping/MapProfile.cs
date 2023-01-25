using AutoMapper;
using EnocaNLayer.Core.DTOs;
using EnocaNLayer.Core.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EnocaNLayer.Service.Mapping
{
    public class MapProfile : Profile
    {
        public MapProfile()
        {
            CreateMap<Firm, FirmDto>().ReverseMap();
            CreateMap<Product, ProductDto>().ReverseMap();            
            CreateMap<Order, OrderDto>().ReverseMap();
            CreateMap<Firm, FirmWithProductsDto>();
        }
    }
}
