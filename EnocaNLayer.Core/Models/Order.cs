using System.ComponentModel.DataAnnotations.Schema;

namespace EnocaNLayer.Core.Models
{
    public class Order : BaseEntity
    {
        public string CustomerName { get; set; }
        public DateTime OrderDate { get; set; } = DateTime.Now;

        [ForeignKey("Product")]
        public int ProductId { get; set; }
        [ForeignKey("Firm")]
        public int FirmId { get; set; }
    }
}
