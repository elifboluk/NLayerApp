using EnocaNLayer.Core.DTOs;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EnocaNLayer.Service.Validations
{
    public class FirmDtoValidator : AbstractValidator<FirmDto>
    {
        public FirmDtoValidator()
        {
            RuleFor(x => x.FirmName).NotNull().WithMessage("{PropertyName} is required!").NotEmpty().WithMessage("{PropertyName} is required!");

            RuleFor(x => x.OrderStartTime).NotNull().WithMessage("{PropertyName} is required!").NotEmpty().WithMessage("{PropertyName} is required!");

            RuleFor(x => x.OrderEndTime).NotNull().WithMessage("{PropertyName} is required!").NotEmpty().WithMessage("{PropertyName} is required!");

            RuleFor(x=>x.ValidationState).NotNull().WithMessage("{PropertyName} is required!").NotEmpty().WithMessage("{PropertyName} is required!");
            
        }
    }
}
