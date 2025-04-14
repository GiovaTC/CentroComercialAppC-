-- Crear base de datos (si no existe)
IF DB_ID('CentroComercialDB') IS NULL
BEGIN
    CREATE DATABASE CentroComercialDB;
END
GO

USE CentroComercialDB;
GO

-- Crear tabla Tiendas
IF OBJECT_ID('dbo.Tiendas', 'U') IS NOT NULL
    DROP TABLE dbo.Tiendas;
GO

CREATE TABLE Tiendas (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Nombre NVARCHAR(100) NOT NULL,
    Categoria NVARCHAR(50) NOT NULL,
    Ubicacion NVARCHAR(100) NOT NULL,
    Horario NVARCHAR(100) NOT NULL
);
GO

-- Insertar datos de ejemplo
INSERT INTO Tiendas (Nombre, Categoria, Ubicacion, Horario) VALUES
('Zara', 'Ropa', 'Primer piso, Local 101', '10:00 AM - 9:00 PM'),
('Starbucks', 'Cafetería', 'Planta baja, Local 5', '8:00 AM - 10:00 PM'),
('Cinemark', 'Entretenimiento', 'Segundo piso, Local 220', '12:00 PM - 11:00 PM'),
('Apple Store', 'Tecnología', 'Primer piso, Local 115', '10:00 AM - 9:00 PM'),
('Librería Gandhi', 'Libros', 'Segundo piso, Local 205', '10:00 AM - 8:00 PM'),
('McDonald’s', 'Comida Rápida', 'Planta baja, Local 12', '9:00 AM - 11:00 PM'),
('H&M', 'Ropa', 'Primer piso, Local 108', '10:00 AM - 9:00 PM'),
('Samsung Store', 'Tecnología', 'Primer piso, Local 118', '10:00 AM - 9:00 PM'),
('Juguetilandia', 'Juguetería', 'Segundo piso, Local 215', '10:00 AM - 8:00 PM'),
('Sportline', 'Deportes', 'Primer piso, Local 120', '10:00 AM - 9:00 PM');
GO
