using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EnocaNLayer.Core.DTOs
{
    public class FirmWithProductsDto : FirmDto
    {
        public List<ProductDto> Products { get; set; }
    }
}
