-- 1. Procesar Venta
DELIMITER //
CREATE PROCEDURE ProcesarVenta (
    IN p_ID_Cliente INT,
    IN p_ID_Medio INT,
    IN p_ID_Empleado INT,
    IN p_Descripcion TEXT,
    IN p_Total FLOAT,
    IN p_Productos JSON -- Estructura de productos: [{"ID_Producto": 1, "Cantidad": 2}, {"ID_Producto": 2, "Cantidad": 1}]
)
BEGIN
    DECLARE v_ID_Venta INT;
    DECLARE v_ID_Producto INT;
    DECLARE v_Cantidad INT;

    -- Declaración del cursor
    DECLARE product_cursor CURSOR FOR 
        SELECT JSON_UNQUOTE(JSON_EXTRACT(value, '$.ID_Producto')), 
               JSON_UNQUOTE(JSON_EXTRACT(value, '$.Cantidad')) 
        FROM JSON_TABLE(p_Productos, '$[*]' COLUMNS (value JSON PATH '$')) AS jt;
    
    -- Manejo de fin del cursor
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_ID_Producto = NULL;
    
    -- Insertar la venta
    INSERT INTO Ventas (Fecha_Venta, Descripcion, Total_Venta, ID_Cliente, ID_Medio, ID_Empleado)
    VALUES (CURDATE(), p_Descripcion, p_Total, p_ID_Cliente, p_ID_Medio, p_ID_Empleado);
    
    -- Obtener el último ID de la venta
    SET v_ID_Venta = LAST_INSERT_ID();

    -- Abrir el cursor
    OPEN product_cursor;

    -- Bucle para recorrer cada producto en el cursor
    read_loop: LOOP
        FETCH product_cursor INTO v_ID_Producto, v_Cantidad;

        -- Verificar si ya no hay más productos
        IF v_ID_Producto IS NULL THEN
            LEAVE read_loop;
        END IF;

        -- Insertar detalle de venta
        INSERT INTO Detalle_Venta (ID_Venta, ID_Producto, Cantidad)
        VALUES (v_ID_Venta, v_ID_Producto, v_Cantidad);

        -- Actualizar inventario
        UPDATE Inventario
        SET Cantidad_Disponible = Cantidad_Disponible - v_Cantidad
        WHERE ID_Producto = v_ID_Producto;
    END LOOP;

    -- Cerrar el cursor
    CLOSE product_cursor;
END //
DELIMITER ;

CALL ProcesarVenta(
    7, -- ID del Cliente
    1, -- ID del Medio de pago
    3, -- ID del Empleado
    'Compra varios productos', -- Descripción
    100000.00, -- Total de la venta
    '[{"ID_Producto": 2, "Cantidad": 2}, {"ID_Producto": 9, "Cantidad": 2}]' -- Productos en formato JSON
);
-- Fin Procedimiento  y llamado

-- 2. Registrar Nuevo Proveedor
DELIMITER //
CREATE PROCEDURE RegistrarProveedor (
    IN p_Nombre VARCHAR(100),
    IN p_Telefono VARCHAR(15),
    IN p_Direccion VARCHAR(150)
)
BEGIN
    INSERT INTO Proveedor (Nombre_Proveedor, Telefono, Direccion)
    VALUES (p_Nombre, p_Telefono, p_Direccion);
END //
DELIMITER ;

CALL RegistrarProveedor(
    'Proveedor Pandora Maquillaje',
    '3133583659',
    'Carrera 33 # 45 -19, Bucaramanga'
);
-- Fin Procedimiento y llamado

-- 3. Registrar Nuevo Empleado
DELIMITER //
CREATE PROCEDURE RegistrarEmpleado (
    IN p_Nombre VARCHAR(100),
    IN p_Cargo VARCHAR(50),
    IN p_Telefono VARCHAR(15),
    IN p_Correo VARCHAR(100),
    IN p_Estado BOOLEAN
)
BEGIN
    INSERT INTO Empleados (Nombre_Empleado, Cargo, Telefono, Correo_Electronico, Estado)
    VALUES (p_Nombre, p_Cargo, p_Telefono, p_Correo, p_Estado);
END //
DELIMITER ;

CALL RegistrarEmpleado(
    'Juan Mariño',
    'Administrador Potaxie',
    '1098555333',
    'juankispotaxie@tienda.com',
    TRUE
);
-- Fin Procedimiento y llamado

-- 4. Actualizar Inventario
DELIMITER //
CREATE PROCEDURE ActualizarInventario (
    IN p_ID_Producto INT,
    IN p_Nueva_Cantidad INT
)
BEGIN
    UPDATE Inventario
    SET Cantidad_Disponible = p_Nueva_Cantidad, Ultima_Actualizacion = CURDATE()
    WHERE ID_Producto = p_ID_Producto;
END //
DELIMITER ;

CALL ActualizarInventario(
    48, -- ID del Producto
    15 -- Nueva Cantidad
);
-- Fin Procedimiento y llamado

-- 5. Gestionar Descuentos
DELIMITER //
CREATE PROCEDURE AplicarDescuento (
    IN p_ID_Producto INT,
    IN p_Descuento FLOAT
)
BEGIN
    UPDATE Producto
    SET Precio = Precio - (Precio * (p_Descuento / 100))
    WHERE ID_Producto = p_ID_Producto;
END //
DELIMITER ;

CALL AplicarDescuento(
    3, -- ID del Producto
    10.0 -- Descuento del 10%
);
-- Fin Procedimiento y llamado

-- 6. Eliminar Proveedor
DELIMITER //
CREATE PROCEDURE EliminarProveedor (
    IN p_ID_Proveedor INT
)
BEGIN
    DELETE FROM Proveedor WHERE ID_Proveedor = p_ID_Proveedor;
END //
DELIMITER ;

CALL EliminarProveedor(21); -- Elimina el proveedor con ID 21
-- Fin Procedimiento y llamado

-- 7. Eliminar Empleado
DELIMITER //
CREATE PROCEDURE EliminarEmpleado (
    IN p_ID_Empleado INT
)
BEGIN
    DELETE FROM Empleados WHERE ID_Empleado = p_ID_Empleado;
END //
DELIMITER ;

CALL EliminarEmpleado(46); -- Elimina el empleado con ID 46
-- Fin Porcedimiento y llamado

-- 8. Buscar Producto
DELIMITER //
CREATE PROCEDURE BuscarProducto (
    IN p_Nombre_Producto VARCHAR(100)
)
BEGIN
    SELECT * FROM Producto WHERE Nombre_Producto LIKE CONCAT('%', p_Nombre_Producto, '%');
END //
DELIMITER ;

CALL BuscarProducto('Vampiro'); -- Busca productos por nombre
-- Fin Procedimiento y llamado

-- 9.  Obtener Total Ventas por Cliente
DELIMITER //
CREATE PROCEDURE TotalVentasPorCliente (
    IN p_ID_Cliente INT
)
BEGIN
    SELECT SUM(Total_Venta) AS Total_Ventas
    FROM Ventas
    WHERE ID_Cliente = p_ID_Cliente;
END //
DELIMITER ;

CALL TotalVentasPorCliente(20); -- Devuelve el total de ventas del cliente con ID 20
-- Fin Procedimiento y llamado

-- 10. Obtener Inventario por Producto
DELIMITER //
CREATE PROCEDURE InventarioPorProducto (
    IN p_ID_Producto INT
)
BEGIN
    SELECT Cantidad_Disponible
    FROM Inventario
    WHERE ID_Producto = p_ID_Producto;
END //
DELIMITER ;

CALL InventarioPorProducto(9); -- Devuelve la cantidad disponible del producto con ID 9
-- Fin Procedimiento y llamado

-- 11. Generar Reporte de Ventas
DELIMITER //
CREATE PROCEDURE ReporteVentasPorFecha (
    IN p_Fecha_Inicio DATE,
    IN p_Fecha_Fin DATE
)
BEGIN
    SELECT * FROM Ventas
    WHERE Fecha_Venta BETWEEN p_Fecha_Inicio AND p_Fecha_Fin;
END //
DELIMITER ;

CALL ReporteVentasPorFecha('2023-01-01', '2023-10-22'); -- Reporte de ventas entre las fechas indicadas
-- Fin Procedimiento y llamado

-- 12. Gestionar Devoluciones
DELIMITER //
CREATE PROCEDURE GestionarDevolucion (
    IN p_ID_Venta INT,
    IN p_ID_Producto INT,
    IN p_Cantidad INT
)
BEGIN
    -- Actualizar inventario
    UPDATE Inventario
    SET Cantidad_Disponible = Cantidad_Disponible + p_Cantidad
    WHERE ID_Producto = p_ID_Producto;

END //
DELIMITER ;

CALL GestionarDevolucion(
    1, -- ID de la Venta
    1, -- ID del Producto
    1  -- Cantidad devuelta
);
-- Fin Procedimiento y llamado

-- 13. Activar Empleado
DELIMITER //
CREATE PROCEDURE ActivarEmpleado (
    IN p_ID_Empleado INT
)
BEGIN
    UPDATE Empleados
    SET Estado = TRUE
    WHERE ID_Empleado = p_ID_Empleado;
END //
DELIMITER ;

CALL ActivarEmpleado(1); -- Activa al empleado con ID 1
-- Fin Procedimiento y llamado

-- 14. Desactivar Empleado
DELIMITER //
CREATE PROCEDURE DesactivarEmpleado (
    IN p_ID_Empleado INT
)
BEGIN
    UPDATE Empleados
    SET Estado = FALSE
    WHERE ID_Empleado = p_ID_Empleado;
END //
DELIMITER ;

CALL DesactivarEmpleado(1); -- Desactiva al empleado con ID 1
-- Fin Procedimiento y llamado

-- 15. Obtener Ventas por Empleado
DELIMITER //
CREATE PROCEDURE VentasPorEmpleado (
    IN p_ID_Empleado INT
)
BEGIN
    SELECT SUM(Total_Venta) AS Total_Ventas
    FROM Ventas
    WHERE ID_Empleado = p_ID_Empleado;
END //
DELIMITER ;

CALL VentasPorEmpleado(2); -- Devuelve el total de ventas realizadas por el empleado con ID 2
-- Fin Procedimiento y llamado

-- 16. Obtener Productos por Tipo
DELIMITER //
CREATE PROCEDURE ProductosPorTipo (
    IN p_ID_Tipo INT
)
BEGIN
    SELECT * FROM Producto
    WHERE ID_Tipo = p_ID_Tipo;
END //
DELIMITER ;

CALL ProductosPorTipo(3); -- Devuelve todos los productos del tipo con ID 3
-- Fin Procedimiento y llamado

-- 17. Actualizar Precio de Producto
DELIMITER //
CREATE PROCEDURE ActualizarPrecioProducto (
    IN p_ID_Producto INT,
    IN p_Nuevo_Precio FLOAT
)
BEGIN
    UPDATE Producto
    SET Precio = p_Nuevo_Precio
    WHERE ID_Producto = p_ID_Producto;
END //
DELIMITER ;

CALL ActualizarPrecioProducto(5, 40000.00); -- Actualiza el precio del producto con ID 5
-- Fin Procedimiento y almacenado

-- 18. Agregar Producto
DELIMITER //
CREATE PROCEDURE AgregarProducto (
    IN p_Nombre_Producto VARCHAR(100),
    IN p_Precio FLOAT,
    IN p_Talla ENUM('S','M','L','X','XL','XXL', 'NO APLICA'),
    IN p_ID_Tipo INT,
    IN p_Cantidad_Inicial INT,
    IN p_ID_Proveedor INT
)
BEGIN
    DECLARE v_ID_Producto INT;

    -- Insertar el producto en la tabla Producto
    INSERT INTO Producto (Nombre_Producto, Precio, Talla, ID_Tipo)
    VALUES (p_Nombre_Producto, p_Precio, p_Talla, p_ID_Tipo);

    -- Obtener el ID del nuevo producto insertado
    SET v_ID_Producto = LAST_INSERT_ID();

    -- Insertar el producto en el inventario con la cantidad inicial
    INSERT INTO Inventario (Cantidad_Disponible, Ultima_Actualizacion, ID_Proveedor, ID_Producto)
    VALUES (p_Cantidad_Inicial, CURDATE(), p_ID_Proveedor, v_ID_Producto);
END //
DELIMITER ;

CALL AgregarProducto(
    'Peluca de Calvo', -- Nombre del producto
    20000.00,           -- Precio del producto
    'NO APLICA',             -- Talla del producto
    3,               -- ID del tipo de producto 
    7,              -- Cantidad inicial de producto en inventario
    8                -- ID del proveedor
);
-- Fin Procedimiento y llamado

-- 19. Eliminar Producto
DELIMITER //
CREATE PROCEDURE EliminarProducto (
    IN p_ID_Producto INT
)
BEGIN
    -- Eliminar detalles de venta relacionados
    DELETE FROM Detalle_Venta WHERE ID_Producto = p_ID_Producto;

    -- Eliminar detalles de compra relacionados
    DELETE FROM Detalle_Compra WHERE ID_Producto = p_ID_Producto;

    -- Eliminar del inventario
    DELETE FROM Inventario WHERE ID_Producto = p_ID_Producto;

    -- Finalmente eliminar el producto
    DELETE FROM Producto WHERE ID_Producto = p_ID_Producto;
END //
DELIMITER ;

CALL EliminarProducto(51); -- Elimina el producto con ID 51 y sus registros relacionados
-- Fin Procedimiento y llamado

-- 20. Buscar Proveedor por Nombre
DELIMITER //
CREATE PROCEDURE BuscarProveedorPorNombre (
    IN p_Nombre_Proveedor VARCHAR(100)
)
BEGIN
    SELECT * FROM Proveedor
    WHERE Nombre_Proveedor LIKE CONCAT('%', p_Nombre_Proveedor, '%');
END //
DELIMITER ;

CALL BuscarProveedorPorNombre('Maquillaje'); -- Busca proveedores cuyo nombre contenga "Maquillaje"
-- Fin Procedimiento y llamado
