using EnocaNLayer.Core.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EnocaNLayer.Repository.Seeds
{
    internal class FirmSeed : IEntityTypeConfiguration<Firm>
    {
        public void Configure(EntityTypeBuilder<Firm> builder)
        {
            //builder.HasData(new Firm
            //{
            //        
            //});
        }
    }
}
