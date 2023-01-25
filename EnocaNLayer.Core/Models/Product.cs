using System.ComponentModel.DataAnnotations.Schema;

namespace EnocaNLayer.Core.Models
{
    public class Product : BaseEntity
    {
        public string ProductName { get; set; }
        [ForeignKey("Firm")]
        public int FirmId { get; set; }
        
        public int Stock { get; set; }        
        public decimal Price { get; set; }

        

    }
}
