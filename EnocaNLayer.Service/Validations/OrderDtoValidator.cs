using EnocaNLayer.Core.DTOs;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EnocaNLayer.Service.Validations
{
    public class OrderDtoValidator : AbstractValidator<OrderDto>
    {
        public OrderDtoValidator()
        {
            RuleFor(x=>x.CustomerName).NotNull().WithMessage("{PropertyName} is required!").NotEmpty().WithMessage("{PropertyName} is required!");
            RuleFor(x=>x.ProductId).InclusiveBetween(1, int.MaxValue).WithMessage("{PropertyName} must be greater than 0!");
            RuleFor(x=>x.FirmId).InclusiveBetween(1, int.MaxValue).WithMessage("{PropertyName} must be greater than 0!");
        }
    }
}
