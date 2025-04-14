#CentroComercialAppC#

🔧 Paso 1: Crear el proyecto
Abre tu terminal o Visual Studio y ejecuta:

bash
Copiar
Editar
dotnet new mvc -n CentroComercialApp
cd CentroComercialApp
Esto crea un proyecto MVC con vistas.

🗃️ Paso 2: Configurar la conexión a SQL Server
Abre el archivo appsettings.json y agrega tu cadena de conexión:

json
Copiar
Editar
"ConnectionStrings": {
  "DefaultConnection": "Server=localhost;Database=CentroComercialDB;Trusted_Connection=True;TrustServerCertificate=True;"
}
🧱 Paso 3: Crear el modelo (ej. Tienda)
Creamos una carpeta Models y dentro un archivo Tienda.cs:

csharp
Copiar
Editar
namespace CentroComercialApp.Models
{
    public class Tienda
    {
        public int Id { get; set; }
        public string Nombre { get; set; }
        public string Categoria { get; set; }
        public string Ubicacion { get; set; }
        public string Horario { get; set; }
    }
}
🗂️ Paso 4: Crear el contexto de base de datos
Dentro de la carpeta Data, crea CentroComercialContext.cs:

csharp
Copiar
Editar
using Microsoft.EntityFrameworkCore;
using CentroComercialApp.Models;

namespace CentroComercialApp.Data
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
Y registra el contexto en Program.cs:

csharp
Copiar
Editar
builder.Services.AddDbContext<CentroComercialContext>(options =>
    options.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnection")));
📦 Paso 5: Crear el controlador y vistas CRUD
Desde la terminal, ejecuta:

bash
Copiar
Editar
dotnet aspnet-codegenerator controller -name TiendasController -m Tienda -dc CentroComercialContext --relativeFolderPath Controllers --useDefaultLayout --referenceScriptLibraries
Esto crea:

Controlador TiendasController.cs

Vistas Razor para crear, leer, actualizar y eliminar tiendas

🧪 Paso 6: Crear y aplicar la migración
bash
Copiar
Editar
dotnet ef migrations add InitialCreate
dotnet ef database update
Esto creará la base de datos CentroComercialDB con la tabla Tiendas.

🚀 Paso 7: Ejecuta el proyecto
bash
Copiar
Editar
dotnet run
