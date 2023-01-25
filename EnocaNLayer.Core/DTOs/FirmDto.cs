using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EnocaNLayer.Core.DTOs
{
    public class FirmDto : BaseDto
    {
        public string FirmName { get; set; }
        public bool ValidationState { get; set; }
        public DateTime OrderStartTime { get; set; }
        public DateTime OrderEndTime { get; set; }
    }
}
