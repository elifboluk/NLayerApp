using AutoMapper;
using EnocaNLayer.Core.DTOs;
using EnocaNLayer.Core.Models;
using EnocaNLayer.Core.Repositories;
using EnocaNLayer.Core.Services;
using EnocaNLayer.Core.UnitOfWorks;
using EnocaNLayer.Repository.Repositories;
using EnocaNLayer.Service.Exceptions;

namespace EnocaNLayer.Service.Services
{
    public class FirmService : Service<Firm>, IFirmService
    {
        private readonly IFirmRepository _firmRepository;
        private readonly IMapper _mapper;
        public FirmService(IGenericRepository<Firm> repository, IUnitOfWork unitOfWork, IMapper mapper, IFirmRepository firmRepository) : base(repository, unitOfWork)
        {
            _mapper = mapper;
            _firmRepository = firmRepository;
        }

        public async Task<CustomResponseDto<FirmWithProductsDto>> GetSingleFirmByIdWithProductsAsync(int firmId)
        {
            var hasFirm = await _firmRepository.GetSingleFirmByIdWithProductsAsync(firmId);
            if (hasFirm == null)
            {
                throw new NotFoundException($"{typeof(Firm).Name}({firmId}) not found.");
            }
            var firmDto = _mapper.Map<FirmWithProductsDto>(hasFirm);
            return CustomResponseDto<FirmWithProductsDto>.Success(200, firmDto);
        }
    }
}

//var firm = await _firmRepository.GetSingleFirmByIdWithProductsAsync(firmId);
//var firmDto = _mapper.Map<FirmWithProductsDto>(firm);
//return CustomResponseDto<FirmWithProductsDto>.Success(200, firmDto);
