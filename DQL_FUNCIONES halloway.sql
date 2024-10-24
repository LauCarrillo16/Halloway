-- 1. Calcular Stock Bajo de Producto
DELIMITER //

CREATE FUNCTION ObtenerStockBajo(p_Cantidad_Minima INT)
RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
    DECLARE v_Lista_Stock VARCHAR(255) DEFAULT '';
    
    -- Obtener los IDs y las cantidades de productos con stock bajo
    SELECT GROUP_CONCAT(CONCAT('ID: ', ID_Producto, ' - Cantidad: ', Cantidad_Disponible) SEPARATOR ', ') INTO v_Lista_Stock
    FROM Inventario
    WHERE Cantidad_Disponible < p_Cantidad_Minima;
    
    RETURN v_Lista_Stock;  -- Retorna la lista de IDs y cantidades
END;
//

DELIMITER ;

SELECT ObtenerStockBajo(10); -- Muestra los IDs y las cantidades de los productos con menos de 10 unidades en stock
-- Fin Funcion 

-- 2. Calcular Ganancia Total por Producto
DELIMITER //

CREATE FUNCTION CalcularGananciaTotalPorProducto(p_ID_Producto INT)
RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
    DECLARE v_GananciaTotal DECIMAL(10, 2);

    SELECT SUM(dv.Cantidad * (p.Precio - dc.Precio_Unitario)) INTO v_GananciaTotal
    FROM Detalle_Venta dv
    JOIN Producto p ON dv.ID_Producto = p.ID_Producto
    JOIN Detalle_Compra dc ON p.ID_Producto = dc.ID_Producto -- Esto necesita ser revisado si hay múltiples compras
    WHERE dv.ID_Producto = p_ID_Producto;

    RETURN IFNULL(v_GananciaTotal, 0); -- Retorna 0 si no hay ventas
END;
//

DELIMITER ;

SELECT CalcularGananciaTotalPorProducto(1); -- Reemplaza 1 con el ID del producto que deseas consultar
-- Fin Funcion

-- 3. Calcular Total Compras por Proveedor
DELIMITER //
CREATE FUNCTION TotalComprasPorProveedor (
    p_ID_Proveedor INT
) RETURNS DECIMAL(10, 2)
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE v_Total_Compras DECIMAL(10, 2);

    SELECT SUM(Total) INTO v_Total_Compras
    FROM Compra
    WHERE ID_Proveedor = p_ID_Proveedor;

    RETURN IFNULL(v_Total_Compras, 0);
END //
DELIMITER ;

SELECT TotalComprasPorProveedor(1); -- Total de compras para el proveedor con ID 1
-- Fin Funcion

-- 4. Estimar costo operativo mensual
DELIMITER //
CREATE FUNCTION CostoOperativoMensual (p_Mes INT, p_Año INT) RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE v_Costo_Total DECIMAL(10,2);

    SELECT SUM(Total) INTO v_Costo_Total
    FROM Compra
    WHERE MONTH(Fecha_Compra) = p_Mes AND YEAR(Fecha_Compra) = p_Año;

    RETURN IFNULL(v_Costo_Total, 0);
END //
DELIMITER ;

SELECT CostoOperativoMensual(10, 2023); -- Octubre de 2023
-- Fin Funcion

-- 5. Obtener el proveedor con más compras
DELIMITER //
CREATE FUNCTION ProveedorConMasCompras () RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE v_ID_Proveedor INT;

    SELECT ID_Proveedor INTO v_ID_Proveedor
    FROM Compra
    GROUP BY ID_Proveedor
    ORDER BY SUM(Total) DESC
    LIMIT 1;

    RETURN v_ID_Proveedor;
END //
DELIMITER ;

SELECT ProveedorConMasCompras();
-- Fin Funcion

-- 6. Calcular el total de inventario
DELIMITER //
CREATE FUNCTION TotalInventario () RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE v_Total INT;

    SELECT SUM(Cantidad_Disponible) INTO v_Total
    FROM Inventario;

    RETURN IFNULL(v_Total, 0);
END //
DELIMITER ;

SELECT TotalInventario();
-- Fin Funcion

-- 7. Calcular promedio de ventas diarias
DELIMITER //
CREATE FUNCTION PromedioVentasDiarias (p_FechaInicio DATE, p_FechaFin DATE) RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
    DECLARE v_Ventas_Diarias DECIMAL(10, 2);
    DECLARE v_Dias INT;

    SELECT COUNT(DISTINCT Fecha_venta) INTO v_Dias
    FROM Ventas
    WHERE Fecha_venta BETWEEN p_FechaInicio AND p_FechaFin;

    SELECT SUM(Total_Venta) / v_Dias INTO v_Ventas_Diarias
    FROM Ventas
    WHERE Fecha_venta BETWEEN p_FechaInicio AND p_FechaFin;

    RETURN IFNULL(v_Ventas_Diarias, 0);
END //
DELIMITER ;

SELECT PromedioVentasDiarias('2023-10-01', '2023-10-31'); -- Promedio de octubre 2023
-- Fin Funcion

-- 8. Obtener el promedio de cantidad de productos por compra
DELIMITER //
CREATE FUNCTION PromedioCantidadProductosPorCompra () RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
    DECLARE v_Promedio DECIMAL(10, 2);

    SELECT AVG(Cantidad) INTO v_Promedio
    FROM Detalle_Compra;

    RETURN IFNULL(v_Promedio, 0);
END //
DELIMITER ;

SELECT PromedioCantidadProductosPorCompra();
-- Fin Funcion

-- 9. Obtener la cantidad de ventas por medio de pago
DELIMITER //
CREATE FUNCTION VentasPorMedioPago (p_ID_Medio INT) RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE v_Cantidad_Ventas INT;

    SELECT COUNT(*) INTO v_Cantidad_Ventas
    FROM Ventas
    WHERE ID_Medio = p_ID_Medio;

    RETURN IFNULL(v_Cantidad_Ventas, 0);
END //
DELIMITER ;

SELECT VentasPorMedioPago(1); 
-- Fin Funcion

-- 10. Calcular la cantidad de productos en un tipo específico
DELIMITER //
CREATE FUNCTION ProductosPorTipo (p_ID_Tipo INT) RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE v_Cantidad_Productos INT;

    SELECT COUNT(*) INTO v_Cantidad_Productos
    FROM Producto
    WHERE ID_Tipo = p_ID_Tipo;

    RETURN IFNULL(v_Cantidad_Productos, 0);
END //
DELIMITER ;

SELECT ProductosPorTipo(3); 
-- Fin Funcion

-- 11. Calcular el margen de ganancia por producto
DELIMITER //
CREATE FUNCTION MargenGananciaProducto (p_ID_Producto INT) RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
    DECLARE v_Precio_Venta DECIMAL(10, 2);
    DECLARE v_Precio_Compra DECIMAL(10, 2);
    DECLARE v_Margen DECIMAL(10, 2);

    SELECT Precio INTO v_Precio_Venta
    FROM Producto
    WHERE ID_Producto = p_ID_Producto;

    SELECT AVG(Precio_Unitario) INTO v_Precio_Compra
    FROM Detalle_Compra
    WHERE ID_Producto = p_ID_Producto;

    SET v_Margen = v_Precio_Venta - IFNULL(v_Precio_Compra, 0);

    RETURN v_Margen;
END //
DELIMITER ;

SELECT MargenGananciaProducto(1); 
-- Fin Funcion

-- 12. Calcular el número de ventas por mes
DELIMITER //
CREATE FUNCTION NumeroVentasPorMes (p_Mes INT, p_Año INT) RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE v_Numero_Ventas INT;

    SELECT COUNT(*) INTO v_Numero_Ventas
    FROM Ventas
    WHERE MONTH(Fecha_venta) = p_Mes AND YEAR(Fecha_venta) = p_Año;

    RETURN IFNULL(v_Numero_Ventas, 0);
END //
DELIMITER ;

SELECT NumeroVentasPorMes(09, 2024); -- Ventas de Septiembre de 2024
-- Fin Funcion

-- 13. Calcular la cantidad de productos en inventario por proveedor
DELIMITER //
CREATE FUNCTION ProductosInventarioPorProveedor (p_ID_Proveedor INT) RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE v_Cantidad_Productos INT;

    SELECT SUM(I.Cantidad_Disponible) INTO v_Cantidad_Productos
    FROM Inventario I
    WHERE I.ID_Proveedor = p_ID_Proveedor;

    RETURN IFNULL(v_Cantidad_Productos, 0);
END //
DELIMITER ;

SELECT ProductosInventarioPorProveedor(7); 
-- Fin Funcion

-- 14. Calcular el valor total del inventario por producto
DELIMITER //
CREATE FUNCTION ValorTotalInventarioPorProducto (p_ID_Producto INT) RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
    DECLARE v_Cantidad_Disponible INT;
    DECLARE v_Precio_Producto DECIMAL(10, 2);
    DECLARE v_Valor_Total DECIMAL(10, 2);

    SELECT Cantidad_Disponible INTO v_Cantidad_Disponible
    FROM Inventario
    WHERE ID_Producto = p_ID_Producto;

    SELECT Precio INTO v_Precio_Producto
    FROM Producto
    WHERE ID_Producto = p_ID_Producto;

    SET v_Valor_Total = v_Cantidad_Disponible * v_Precio_Producto;

    RETURN IFNULL(v_Valor_Total, 0);
END //
DELIMITER ;

SELECT ValorTotalInventarioPorProducto(25);
-- Fin Funcion

-- 15. Calcular el total de ventas por empleado
DELIMITER //
CREATE FUNCTION TotalVentasPorEmpleado (p_ID_Empleado INT) RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
    DECLARE v_Total_Ventas DECIMAL(10, 2);

    SELECT SUM(Total_Venta) INTO v_Total_Ventas
    FROM Ventas
    WHERE ID_Empleado = p_ID_Empleado;

    RETURN IFNULL(v_Total_Ventas, 0);
END //
DELIMITER ;

SELECT TotalVentasPorEmpleado(3); 
-- Fin Funcion

-- 16. Calcular el promedio de compras realizadas por cliente
DELIMITER //
CREATE FUNCTION PromedioComprasPorCliente () RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
    DECLARE v_Promedio_Compras DECIMAL(10, 2);

    SELECT AVG(Total_Venta) INTO v_Promedio_Compras
    FROM Ventas;

    RETURN IFNULL(v_Promedio_Compras, 0);
END //
DELIMITER ;

SELECT PromedioComprasPorCliente();
-- Fin Funcion

-- 17. Calcular el número de compras realizadas por empleado
DELIMITER //
CREATE FUNCTION NumeroComprasPorEmpleado (p_ID_Empleado INT) RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE v_Numero_Compras INT;

    SELECT COUNT(*) INTO v_Numero_Compras
    FROM Compra
    WHERE ID_Empleado = p_ID_Empleado;

    RETURN IFNULL(v_Numero_Compras, 0);
END //
DELIMITER ;

SELECT NumeroComprasPorEmpleado(7); 
-- Fin Funcion

-- 18.  Calcular el valor promedio de ventas por cliente
DELIMITER //
CREATE FUNCTION ValorPromedioVentasPorCliente (p_ID_Cliente INT) RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
    DECLARE v_Promedio_Ventas DECIMAL(10, 2);

    SELECT AVG(Total_Venta) INTO v_Promedio_Ventas
    FROM Ventas
    WHERE ID_Cliente = p_ID_Cliente;

    RETURN IFNULL(v_Promedio_Ventas, 0);
END //
DELIMITER ;

SELECT ValorPromedioVentasPorCliente(7); 
-- Fin Funcion

-- 19. Calcular el número total de productos vendidos por categoría de producto
DELIMITER //
CREATE FUNCTION TotalProductosVendidosPorCategoria (p_ID_Tipo INT) RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE v_Total_Productos INT;

    SELECT SUM(DV.Cantidad) INTO v_Total_Productos
    FROM Detalle_Venta DV
    JOIN Producto P ON DV.ID_Producto = P.ID_Producto
    WHERE P.ID_Tipo = p_ID_Tipo;

    RETURN IFNULL(v_Total_Productos, 0);
END //
DELIMITER ;

SELECT TotalProductosVendidosPorCategoria(1); 
-- Fin Funcion

-- 20. Calcular el valor total del inventario por tipo de producto
DELIMITER //
CREATE FUNCTION ValorInventarioPorTipoProducto (p_ID_Tipo INT) RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
    DECLARE v_Valor_Total DECIMAL(10, 2);

    SELECT SUM(I.Cantidad_Disponible * P.Precio) INTO v_Valor_Total
    FROM Inventario I
    JOIN Producto P ON I.ID_Producto = P.ID_Producto
    WHERE P.ID_Tipo = p_ID_Tipo;

    RETURN IFNULL(v_Valor_Total, 0);
END //
DELIMITER ;

SELECT ValorInventarioPorTipoProducto(20); 
-- Fin Funcion
