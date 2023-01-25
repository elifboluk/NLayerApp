using EnocaNLayer.Core.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace EnocaNLayer.Repository.Configurations
{
    internal class FirmConfiguration : IEntityTypeConfiguration<Firm>
    {
        public void Configure(EntityTypeBuilder<Firm> builder)
        {
            builder.HasKey(x => x.Id);
            builder.Property(x => x.Id).UseIdentityColumn();
            builder.Property(x => x.FirmName).IsRequired().HasMaxLength(150);

        }
    }
}
