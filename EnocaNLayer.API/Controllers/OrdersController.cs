using AutoMapper;
using EnocaNLayer.Core.DTOs;
using EnocaNLayer.Core.Models;
using EnocaNLayer.Core.Services;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace EnocaNLayer.API.Controllers
{

    public class OrdersController : CustomBaseController
    {
        private readonly IMapper _mapper;
        private readonly IOrderService _service;
        private readonly IFirmService _firmService;

        public OrdersController(IMapper mapper, IOrderService service, IFirmService firmService)
        {
            _mapper = mapper;
            _service = service;
            _firmService = firmService;
        }

        [HttpGet]
        public async Task<IActionResult> All()
        {
            var orders = await _service.GetAllAsync();
            var ordersDtos = _mapper.Map<List<OrderDto>>(orders.ToList());
            return CreateActionResult(CustomResponseDto<List<OrderDto>>.Success(200, ordersDtos));
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> GetById(int id)
        {
            var order = await _service.GetByIdAsync(id);
            var ordersDtos = _mapper.Map<OrderDto>(order);
            return CreateActionResult(CustomResponseDto<OrderDto>.Success(200, ordersDtos));
        }

        [HttpPost]
        public async Task<IActionResult> Save(OrderDto orderDto)
        {
            var firm = await _firmService.GetByIdAsync(orderDto.FirmId);
            var start = TimeOnly.Parse(firm.OrderStartTime.ToShortTimeString());
            var end = TimeOnly.Parse(firm.OrderEndTime.ToShortTimeString());
            var atm = TimeOnly.Parse(DateTime.Now.ToShortTimeString());
            if (firm.ValidationState==true && atm>=start && atm<=end)
            {
                var order = await _service.AddAsync(_mapper.Map<Order>(orderDto));
                var ordersDtos = _mapper.Map<OrderDto>(order);
                return CreateActionResult(CustomResponseDto<OrderDto>.Success(201, ordersDtos));
            }
            else if(firm.ValidationState==false)
            {
                return CreateActionResult(CustomResponseDto<OrderDto>.Fail(400, "Firm is not approved."));

            }
            return CreateActionResult(CustomResponseDto<OrderDto>.Fail(400, "This firm is not taking orders right now."));
        }

    }
}
