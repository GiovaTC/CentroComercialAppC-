using CentroComercialAppC_.Models;
using Microsoft.EntityFrameworkCore;

namespace CentroComercialAppC_.Data
{
    public class CentroComercialContext : DbContext
    {
        public CentroComercialContext(DbContextOptions<CentroComercialContext> options)
            : base(options)
        {
        }

        public DbSet<Tienda> Tiendas { get; set; }
    }
}
