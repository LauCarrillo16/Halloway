CREATE DATABASE HALLOWAY;
USE  HALLOWAY;

-- Creación de la tabla Tipo_Producto (para clasificar productos)
CREATE TABLE IF NOT EXISTS Tipo_Producto (
    ID_Tipo INTEGER PRIMARY KEY,
    Nombre_Tipo VARCHAR(50) NOT NULL
);

-- Creación de la tabla Producto (depende de Tipo_Producto)
CREATE TABLE IF NOT EXISTS Producto (
    ID_Producto INTEGER PRIMARY KEY,
    Nombre_Producto VARCHAR(100) NOT NULL,
    Precio FLOAT NOT NULL,
    Stock INTEGER NOT NULL,
    Talla ENUM ('S','M','L','X','XL','XXL', 'NO APLICA')NOT NULL,
    ID_Tipo INTEGER NOT NULL,
    FOREIGN KEY (ID_Tipo) REFERENCES Tipo_Producto(ID_Tipo)
);

-- Creación de la tabla Proveedor
CREATE TABLE IF NOT EXISTS Proveedor (
    ID_Proveedor INTEGER PRIMARY KEY,
    Nombre_Proveedor VARCHAR(100) NOT NULL,
    Telefono VARCHAR(15),
    Direccion VARCHAR(150)
);

-- Creación de la tabla Inventario (depende de Producto y Proveedor)
CREATE TABLE IF NOT EXISTS Inventario (
    ID_Inventario INTEGER PRIMARY KEY,
    Cantidad_Disponible INTEGER NOT NULL,
    Ultima_Actualizacion DATE NOT NULL,
    ID_Proveedor INTEGER NOT NULL,
    ID_Producto INTEGER NOT NULL,
    FOREIGN KEY (ID_Proveedor) REFERENCES Proveedor(ID_Proveedor),
    FOREIGN KEY (ID_Producto) REFERENCES Producto(ID_Producto)
);

-- Creación de la tabla Clientes
CREATE TABLE IF NOT EXISTS Clientes (
    ID_Cliente INTEGER PRIMARY KEY,
    Nombre_Cliente VARCHAR(100) NOT NULL,
    Telefono VARCHAR(15),
    Direccion VARCHAR(150),
    Correo_Electronico VARCHAR(100)
);

-- Creación de la tabla Medios_Pago
CREATE TABLE IF NOT EXISTS Medios_Pago (
    ID_Medio INTEGER PRIMARY KEY,
    Tipo_Pago VARCHAR(50) NOT NULL
);

-- Creación de la tabla Empleados
CREATE TABLE IF NOT EXISTS Empleados (
    ID_Empleado INTEGER PRIMARY KEY,
    Nombre_Empleado VARCHAR(100) NOT NULL,
    Cargo VARCHAR(50) NOT NULL,
    Telefono VARCHAR(15),
    Correo_Electronico VARCHAR(100),
    Estado BOOLEAN NOT NULL
);

-- Creación de la tabla Compra (depende de Proveedor y Empleados)
CREATE TABLE IF NOT EXISTS Compra (
    ID_Compra INTEGER PRIMARY KEY,
    Fecha_Compra DATE NOT NULL,
    ID_Proveedor INTEGER NOT NULL,
    ID_Empleado INTEGER NOT NULL,
    Total DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (ID_Proveedor) REFERENCES Proveedor(ID_Proveedor),
    FOREIGN KEY (ID_Empleado) REFERENCES Empleados(ID_Empleado)
);

-- Creación de la tabla Detalle_Compra (depende de Compra y Producto)
CREATE TABLE IF NOT EXISTS Detalle_Compra (
    ID_DetalleC INTEGER PRIMARY KEY,
    ID_Producto INTEGER NOT NULL,
    ID_Compra INTEGER NOT NULL,
    Cantidad INTEGER NOT NULL,
    Precio_Unitario DECIMAL(10, 2) NOT NULL,
    Subtotal DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (ID_Producto) REFERENCES Producto(ID_Producto),
    FOREIGN KEY (ID_Compra) REFERENCES Compra(ID_Compra)
);

-- Creación de la tabla Ventas (depende de Clientes, Medios_Pago y Empleados)
CREATE TABLE IF NOT EXISTS Ventas (
    ID_Venta INTEGER PRIMARY KEY,
    Fecha_venta DATE NOT NULL,
    Descripcion TEXT,
    Total_Venta FLOAT NOT NULL,
    ID_Cliente INTEGER NOT NULL,
    ID_Medio INTEGER NOT NULL,
    ID_Empleado INTEGER NOT NULL,
    FOREIGN KEY (ID_Cliente) REFERENCES Clientes(ID_Cliente),
    FOREIGN KEY (ID_Medio) REFERENCES Medios_Pago(ID_Medio),
    FOREIGN KEY (ID_Empleado) REFERENCES Empleados(ID_Empleado)
);

-- Creación de la tabla Detalle_Venta (depende de Ventas y Producto)
CREATE TABLE IF NOT EXISTS Detalle_Venta (
    ID_DetalleV INTEGER PRIMARY KEY,
    ID_Venta INTEGER NOT NULL,
    ID_Producto INTEGER NOT NULL,
    Cantidad INTEGER NOT NULL,
    FOREIGN KEY (ID_Venta) REFERENCES Ventas(ID_Venta),
    FOREIGN KEY (ID_Producto) REFERENCES Producto(ID_Producto)
);

-- Creación de la tabla Proveedor_Inventario (para la relación muchos a muchos entre Proveedor e Inventario)
CREATE TABLE IF NOT EXISTS Proveedor_Inventario (
    ID_PRO_INVE INTEGER PRIMARY KEY,
    ID_Proveedor INTEGER NOT NULL,
    ID_Inventario INTEGER NOT NULL,
    FOREIGN KEY (ID_Proveedor) REFERENCES Proveedor(ID_Proveedor),
    FOREIGN KEY (ID_Inventario) REFERENCES Inventario(ID_Inventario)
);
