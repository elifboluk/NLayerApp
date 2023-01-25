using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EnocaNLayer.Core.DTOs
{
    public class OrderDto : BaseDto
    {
        public string CustomerName { get; set; }
        public int ProductId { get; set; }
        public int FirmId { get; set; }
    }
}
