#CentroComercialAppC#

# 🏬 Centro Comercial App

Una aplicación web desarrollada en **ASP.NET Core 8.0** para la gestión de un centro comercial. Permite visualizar, crear, actualizar y eliminar tiendas, así como administrar información relevante como horarios, categorías y ubicación.

---

## 🚀 Tecnologías utilizadas

- ✅ ASP.NET Core 8.0  
- ✅ Entity Framework Core  
- ✅ SQL Server  
- ✅ MVC con Razor Views  
- ✅ Visual Studio / Visual Studio Code  

---

## 📁 Estructura del proyecto

CentroComercialApp/ │ ├── Controllers/ │ └── TiendasController.cs ├── Data/ │ └── CentroComercialContext.cs ├── Models/ │ └── Tienda.cs ├── Views/ │ └── Tiendas/ │ ├── Create.cshtml │ ├── Edit.cshtml │ ├── Delete.cshtml │ ├── Details.cshtml │ └── Index.cshtml ├── appsettings.json └── Program.cs

yaml
Copiar
Editar

---

## 🛠️ Pasos para crear la aplicación

### 🔧 Paso 1: Crear el proyecto

```bash
dotnet new mvc -n CentroComercialApp
cd CentroComercialApp
🗃️ Paso 2: Configurar la conexión a SQL Server
Edita appsettings.json:

json
Copiar
Editar
"ConnectionStrings": {
  "DefaultConnection": "Server=localhost;Database=CentroComercialDB;Trusted_Connection=True;TrustServerCertificate=True;"
}
🧱 Paso 3: Crear el modelo Tienda
Models/Tienda.cs

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
Data/CentroComercialContext.cs

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
Registra el contexto en Program.cs:

csharp
Copiar
Editar
builder.Services.AddDbContext<CentroComercialContext>(options =>
    options.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnection")));
📦 Paso 5: Generar controlador y vistas CRUD
bash
Copiar
Editar
dotnet aspnet-codegenerator controller -name TiendasController -m Tienda -dc CentroComercialContext --relativeFolderPath Controllers --useDefaultLayout --referenceScriptLibraries
Esto generará:

Controlador: Controllers/TiendasController.cs

Vistas CRUD en la carpeta Views/Tiendas

🧪 Paso 6: Crear y aplicar migraciones
bash
Copiar
Editar
dotnet ef migrations add InitialCreate
dotnet ef database update
Esto generará la base de datos CentroComercialDB y la tabla Tiendas.

🚀 Paso 7: Ejecutar la aplicación
bash
Copiar
Editar
dotnet run
Accede a: http://localhost:5000/Tiendas para gestionar tiendas.

🔮 Funcionalidades futuras (opcional)
Gestión de empleados

Administración de eventos y promociones

Autenticación y autorización por roles

Dashboard para administración

Migración a Razor Pages si se prefiere

🧰 Requisitos
.NET SDK 8.0+

SQL Server instalado (local o remoto)

Visual Studio o VS Code con extensiones de C#

📄 Licencia
Este proyecto está bajo la licencia MIT. Puedes hacer con él lo que quieras, solo no olvides dar crédito. 😉

yaml
Copiar
Editar

---

¿Quieres que te lo envíe como archivo descargable `.md` o deseas que lo empaquete junto con el código base del proyecto?


Dijiste:
podrias por favor generar la anterior documentacion en formato .md

ChatGPT dijo:
Para generar el archivo .md, necesitas iniciar sesión en ChatGPT para poder usar funciones como Python. Pero no te preocupes: aquí te dejo el código completo que puedes copiar y ejecutar tú mismo en tu computadora (por ejemplo, con Python o incluso un bloc de notas).

📄 Código para generar README.md:
python
Copiar
Editar
readme_content = """# 🏬 Centro Comercial App

Una aplicación web desarrollada en **ASP.NET Core 8.0** para la gestión de un centro comercial. Permite visualizar, crear, actualizar y eliminar tiendas, así como administrar información relevante como horarios, categorías y ubicación.

---

## 🚀 Tecnologías utilizadas

- ✅ ASP.NET Core 8.0  
- ✅ Entity Framework Core  
- ✅ SQL Server  
- ✅ MVC con Razor Views  
- ✅ Visual Studio / Visual Studio Code  

---

## 📁 Estructura del proyecto

CentroComercialApp/ │ ├── Controllers/ │ └── TiendasController.cs ├── Data/ │ └── CentroComercialContext.cs ├── Models/ │ └── Tienda.cs ├── Views/ │ └── Tiendas/ │ ├── Create.cshtml │ ├── Edit.cshtml │ ├── Delete.cshtml │ ├── Details.cshtml │ └── Index.cshtml ├── appsettings.json └── Program.cs

yaml
Copiar
Editar

---

## 🛠️ Pasos para crear la aplicación

### 🔧 Paso 1: Crear el proyecto

```bash
dotnet new mvc -n CentroComercialApp
cd CentroComercialApp
🗃️ Paso 2: Configurar la conexión a SQL Server
Edita appsettings.json:

json
Copiar
Editar
"ConnectionStrings": {
  "DefaultConnection": "Server=localhost;Database=CentroComercialDB;Trusted_Connection=True;TrustServerCertificate=True;"
}
🧱 Paso 3: Crear el modelo Tienda
Models/Tienda.cs

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
Data/CentroComercialContext.cs

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
Registra el contexto en Program.cs:

csharp
Copiar
Editar
builder.Services.AddDbContext<CentroComercialContext>(options =>
    options.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnection")));
📦 Paso 5: Generar controlador y vistas CRUD
bash
Copiar
Editar
dotnet aspnet-codegenerator controller -name TiendasController -m Tienda -dc CentroComercialContext --relativeFolderPath Controllers --useDefaultLayout --referenceScriptLibraries
Esto generará:

Controlador: Controllers/TiendasController.cs

Vistas CRUD en la carpeta Views/Tiendas

🧪 Paso 6: Crear y aplicar migraciones
bash
Copiar
Editar
dotnet ef migrations add InitialCreate
dotnet ef database update
Esto generará la base de datos CentroComercialDB y la tabla Tiendas.

🚀 Paso 7: Ejecutar la aplicación
bash
Copiar
Editar
dotnet run
Accede a: http://localhost:5000/Tiendas para gestionar tiendas.

🔮 Funcionalidades futuras (opcional)
Gestión de empleados

Administración de eventos y promociones

Autenticación y autorización por roles

Dashboard para administración

Migración a Razor Pages si se prefiere

🧰 Requisitos
.NET SDK 8.0+

SQL Server instalado (local o remoto)

Visual Studio o VS Code con extensiones de C#

📄 Licencia
Este proyecto está bajo la licencia MIT. Puedes hacer con él lo que quieras, solo no olvides dar crédito. 😉
