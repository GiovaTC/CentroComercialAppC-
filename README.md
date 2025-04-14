# CentroComercialAppC#

![image](https://github.com/user-attachments/assets/c7ab3088-42f3-45d5-9c9a-cbb04a53f2db)

![image](https://github.com/user-attachments/assets/919d9162-e65a-4203-864f-f27cfe389ad4)

![image](https://github.com/user-attachments/assets/e6a72ac5-da52-4ecb-914b-6560ba963e1a)

![image](https://github.com/user-attachments/assets/ff5e8ee4-c25d-4d01-b354-cc4dd6d866c1)

![image](https://github.com/user-attachments/assets/9efd03f1-666d-485a-bea4-a97bb4aeca5a)

![image](https://github.com/user-attachments/assets/86b37cb0-0e06-4200-87f3-248a4a357d72)

![image](https://github.com/user-attachments/assets/c9d042ee-f238-4c35-ac88-54b985a5bbdc)

![image](https://github.com/user-attachments/assets/9210c506-df41-4474-919a-9de561e491cd)

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

---

## 🛠️ Pasos para crear la aplicación

### 🔧 Paso 1: Crear el proyecto

```bash
dotnet new mvc -n CentroComercialApp
cd CentroComercialApp
🗃️ Paso 2: Configurar la conexión a SQL Server
Edita appsettings.json:

json
"ConnectionStrings": {
  "DefaultConnection": "Server=localhost;Database=CentroComercialDB;Trusted_Connection=True;TrustServerCertificate=True;"
}
🧱 Paso 3: Crear el modelo Tienda
Models/Tienda.cs

csharp
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
builder.Services.AddDbContext<CentroComercialContext>(options =>
    options.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnection")));
📦 Paso 5: Generar controlador y vistas CRUD
bash
dotnet aspnet-codegenerator controller -name TiendasController -m Tienda -dc CentroComercialContext --relativeFolderPath Controllers --useDefaultLayout --referenceScriptLibraries
Esto generará:

Controlador: Controllers/TiendasController.cs

Vistas CRUD en la carpeta Views/Tiendas

🧪 Paso 6: Crear y aplicar migraciones
bash

dotnet ef migrations add InitialCreate
dotnet ef database update
Esto generará la base de datos CentroComercialDB y la tabla Tiendas.

🚀 Paso 7: Ejecutar la aplicación
bash

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

----------//---------//----------//-------

Vamos a hacerlo manualmente 👨‍💻

Tú ya tienes:

El modelo Tienda.cs

El contexto CentroComercialContext.cs

Ahora te paso:

✅ El controlador TiendasController.cs

✅ Las vistas Razor para:

Index (listar tiendas)

Create (crear tienda)

Edit (editar tienda)

Details (ver detalles)

Delete (eliminar)

✅ 1. Controlador TiendasController.cs
Crea un archivo llamado TiendasController.cs dentro de la carpeta Controllers:

csharp

using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using CentroComercialApp.Data;
using CentroComercialApp.Models;

namespace CentroComercialApp.Controllers
{
    public class TiendasController : Controller
    {
        private readonly CentroComercialContext _context;

        public TiendasController(CentroComercialContext context)
        {
            _context = context;
        }

        public async Task<IActionResult> Index()
        {
            return View(await _context.Tiendas.ToListAsync());
        }

        public async Task<IActionResult> Details(int? id)
        {
            if (id == null) return NotFound();

            var tienda = await _context.Tiendas.FirstOrDefaultAsync(m => m.Id == id);
            if (tienda == null) return NotFound();

            return View(tienda);
        }

        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Id,Nombre,Categoria,Ubicacion,Horario")] Tienda tienda)
        {
            if (ModelState.IsValid)
            {
                _context.Add(tienda);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(tienda);
        }

        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null) return NotFound();

            var tienda = await _context.Tiendas.FindAsync(id);
            if (tienda == null) return NotFound();

            return View(tienda);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("Id,Nombre,Categoria,Ubicacion,Horario")] Tienda tienda)
        {
            if (id != tienda.Id) return NotFound();

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(tienda);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!TiendaExists(tienda.Id)) return NotFound();
                    else throw;
                }
                return RedirectToAction(nameof(Index));
            }
            return View(tienda);
        }

        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null) return NotFound();

            var tienda = await _context.Tiendas.FirstOrDefaultAsync(m => m.Id == id);
            if (tienda == null) return NotFound();

            return View(tienda);
        }

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var tienda = await _context.Tiendas.FindAsync(id);
            if (tienda != null)
            {
                _context.Tiendas.Remove(tienda);
                await _context.SaveChangesAsync();
            }

            return RedirectToAction(nameof(Index));
        }

        private bool TiendaExists(int id)
        {
            return _context.Tiendas.Any(e => e.Id == id);
        }
    }
}
✅ 2. Vistas Razor
Crea una carpeta dentro de Views llamada Tiendas, y dentro coloca estos archivos:

📄 Index.cshtml
cshtml

@model IEnumerable<CentroComercialApp.Models.Tienda>

@{
    ViewData["Title"] = "Tiendas";
}

<h1>Lista de Tiendas</h1>

<p>
    <a asp-action="Create" class="btn btn-primary">Crear Nueva</a>
</p>

<table class="table table-striped">
    <thead>
        <tr>
            <th>Nombre</th>
            <th>Categoría</th>
            <th>Ubicación</th>
            <th>Horario</th>
            <th></th>
        </tr>
    </thead>
    <tbody>
@foreach (var item in Model) {
    <tr>
        <td>@item.Nombre</td>
        <td>@item.Categoria</td>
        <td>@item.Ubicacion</td>
        <td>@item.Horario</td>
        <td>
            <a asp-action="Edit" asp-route-id="@item.Id">Editar</a> |
            <a asp-action="Details" asp-route-id="@item.Id">Detalles</a> |
            <a asp-action="Delete" asp-route-id="@item.Id">Eliminar</a>
        </td>
    </tr>
}
    </tbody>
</table>
📄 Create.cshtml
cshtml

@model CentroComercialApp.Models.Tienda

@{
    ViewData["Title"] = "Crear Tienda";
}

<h1>Crear Tienda</h1>

<form asp-action="Create">
    <div class="form-group">
        <label asp-for="Nombre" class="control-label"></label>
        <input asp-for="Nombre" class="form-control" />
    </div>
    <div class="form-group">
        <label asp-for="Categoria" class="control-label"></label>
        <input asp-for="Categoria" class="form-control" />
    </div>
    <div class="form-group">
        <label asp-for="Ubicacion" class="control-label"></label>
        <input asp-for="Ubicacion" class="form-control" />
    </div>
    <div class="form-group">
        <label asp-for="Horario" class="control-label"></label>
        <input asp-for="Horario" class="form-control" />
    </div>
    <br />
    <input type="submit" value="Crear" class="btn btn-success" />
    <a asp-action="Index" class="btn btn-secondary">Volver</a>
</form>
📄 Edit.cshtml
cshtml

@model CentroComercialApp.Models.Tienda

@{
    ViewData["Title"] = "Editar Tienda";
}

<h1>Editar Tienda</h1>

<form asp-action="Edit">
    <input type="hidden" asp-for="Id" />
    <div class="form-group">
        <label asp-for="Nombre"></label>
        <input asp-for="Nombre" class="form-control" />
    </div>
    <div class="form-group">
        <label asp-for="Categoria"></label>
        <input asp-for="Categoria" class="form-control" />
    </div>
    <div class="form-group">
        <label asp-for="Ubicacion"></label>
        <input asp-for="Ubicacion" class="form-control" />
    </div>
    <div class="form-group">
        <label asp-for="Horario"></label>
        <input asp-for="Horario" class="form-control" />
    </div>
    <br />
    <input type="submit" value="Guardar" class="btn btn-primary" />
    <a asp-action="Index" class="btn btn-secondary">Cancelar</a>
</form>
📄 Details.cshtml
cshtml

@model CentroComercialApp.Models.Tienda

@{
    ViewData["Title"] = "Detalles";
}

<h1>Detalles de Tienda</h1>

<div>
    <h4>Tienda</h4>
    <hr />
    <dl class="row">
        <dt class="col-sm-2">Nombre</dt>
        <dd class="col-sm-10">@Model.Nombre</dd>

        <dt class="col-sm-2">Categoría</dt>
        <dd class="col-sm-10">@Model.Categoria</dd>

        <dt class="col-sm-2">Ubicación</dt>
        <dd class="col-sm-10">@Model.Ubicacion</dd>

        <dt class="col-sm-2">Horario</dt>
        <dd class="col-sm-10">@Model.Horario</dd>
    </dl>
</div>

<a asp-action="Edit" asp-route-id="@Model.Id" class="btn btn-warning">Editar</a>
<a asp-action="Index" class="btn btn-secondary">Volver</a>
📄 Delete.cshtml
cshtml

@model CentroComercialApp.Models.Tienda

@{
    ViewData["Title"] = "Eliminar Tienda";
}

<h1>Eliminar Tienda</h1>

<h3>¿Estás seguro que deseas eliminar esta tienda?</h3>

<div>
    <h4>@Model.Nombre</h4>
    <hr />
    <dl class="row">
        <dt class="col-sm-2">Categoría</dt>
        <dd class="col-sm-10">@Model.Categoria</dd>

        <dt class="col-sm-2">Ubicación</dt>
        <dd class="col-sm-10">@Model.Ubicacion</dd>

        <dt class="col-sm-2">Horario</dt>
        <dd class="col-sm-10">@Model.Horario</dd>
    </dl>
</div>
