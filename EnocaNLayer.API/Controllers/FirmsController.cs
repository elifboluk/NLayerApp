using AutoMapper;
using EnocaNLayer.Core.DTOs;
using EnocaNLayer.Core.Models;
using EnocaNLayer.Core.Services;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace EnocaNLayer.API.Controllers
{    
    public class FirmsController : CustomBaseController
    {
        private readonly IFirmService _service;
        private readonly IMapper _mapper;

        public FirmsController(IFirmService firmService, IMapper mapper)
        {
            _service = firmService;
            _mapper = mapper;
        }

        [HttpGet("[action]/{firmId}")]
        public async Task<IActionResult> GetSingleFirmByIdWithProducts(int firmId)
        {
            return CreateActionResult(await _service.GetSingleFirmByIdWithProductsAsync(firmId));
        }

        [HttpGet]
        public async Task<IActionResult> All()
        {
            var firms = await _service.GetAllAsync();
            var firmsDtos = _mapper.Map<List<FirmDto>>(firms.ToList());
            return CreateActionResult(CustomResponseDto<List<FirmDto>>.Success(200, firmsDtos));
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> GetById(int id)
        {
            var firms = await _service.GetByIdAsync(id);
            var firmsDtos = _mapper.Map<FirmDto>(firms);
            return CreateActionResult(CustomResponseDto<FirmDto>.Success(200, firmsDtos));
        }

        [HttpPost]
        public async Task<IActionResult> Save(FirmDto firmDto)
        {
            var firm = await _service.AddAsync(_mapper.Map<Firm>(firmDto));            
            var firmsDtos = _mapper.Map<FirmDto>(firm);
            return CreateActionResult(CustomResponseDto<FirmDto>.Success(201, firmsDtos));
        }

        [HttpPut]
        public async Task<IActionResult> Update(FirmDto firmDto)
        {
            await _service.UpdateAsync(_mapper.Map<Firm>(firmDto));
            return CreateActionResult(CustomResponseDto<NoContentDto>.Success(204));
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> Remove(int id)
        {
            var firm = await _service.GetByIdAsync(id);
            await _service.RemoveAsync(firm);
            return CreateActionResult(CustomResponseDto<NoContentDto>.Success(204));
        }

    }
}
