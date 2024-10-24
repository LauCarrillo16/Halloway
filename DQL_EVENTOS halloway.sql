-- 1. Actualizar inventario al final del día
CREATE EVENT ActualizarInventarioDiario
ON SCHEDULE EVERY 1 DAY
STARTS CURRENT_TIMESTAMP
DO
    UPDATE Inventario
    SET Cantidad_Disponible = 0
    WHERE Cantidad_Disponible < 0;
-- Fin Funcion

-- 2. Generar reporte semanal de ventas
CREATE EVENT GenerarReporteSemanalVentas
ON SCHEDULE EVERY 1 WEEK
STARTS CURRENT_TIMESTAMP
DO
    INSERT INTO Reporte_Ventas_Semanal (Fecha_Reporte, Total_Ventas)
    SELECT CURRENT_DATE, SUM(Total_Venta)
    FROM Ventas
    WHERE Fecha_venta BETWEEN DATE_SUB(CURRENT_DATE, INTERVAL 7 DAY) AND CURRENT_DATE;
-- Fin Evento

-- 3. Actualizar el estado de inventario bajo
CREATE EVENT ActualizarEstadoInventarioBajo
ON SCHEDULE EVERY 1 DAY
DO
    UPDATE Producto P
    SET P.Estado = 'BAJO STOCK'
    WHERE P.ID_Producto IN (
        SELECT ID_Producto FROM Inventario WHERE Cantidad_Disponible < 10
    );
-- Fin Evento

-- 4. Eliminar ventas no finalizadas después de 30 días
CREATE EVENT EliminarVentasIncompletas
ON SCHEDULE EVERY 1 MONTH
DO
    DELETE FROM Ventas
    WHERE Total_Venta = 0 AND Fecha_venta < DATE_SUB(CURRENT_DATE, INTERVAL 30 DAY);
-- Fin Evento

-- 5. Recalcular totales de ventas mensuales
CREATE EVENT RecalcularTotalesMensuales
ON SCHEDULE EVERY 1 MONTH
STARTS CURRENT_TIMESTAMP
DO
    UPDATE Ventas
    SET Total_Venta = (SELECT SUM(Precio_Unitario * Cantidad) FROM Detalle_Venta WHERE Detalle_Venta.ID_Venta = Ventas.ID_Venta);
-- Fin Evento

-- 6. Actualizar precios de productos cada 6 meses
CREATE EVENT ActualizarPreciosProductos
ON SCHEDULE EVERY 6 MONTH
STARTS CURRENT_TIMESTAMP
DO
    UPDATE Producto
    SET Precio = Precio * 1.05
    WHERE Precio > 0;
-- Fin Evento

-- 7. Borrar clientes inactivos después de un año
CREATE EVENT EliminarClientesInactivos
ON SCHEDULE EVERY 1 YEAR
STARTS CURRENT_TIMESTAMP
DO
    DELETE FROM Clientes
    WHERE ID_Cliente NOT IN (SELECT ID_Cliente FROM Ventas WHERE Fecha_venta >= DATE_SUB(CURRENT_DATE, INTERVAL 1 YEAR));
-- Fin Evento

-- 8. Generar reporte de compras mensuales
CREATE EVENT GenerarReporteMensualCompras
ON SCHEDULE EVERY 1 MONTH
DO
    INSERT INTO Reporte_Compras_Mensual (Fecha_Reporte, Total_Compras)
    SELECT CURRENT_DATE, SUM(Total)
    FROM Compra
    WHERE Fecha_Compra BETWEEN DATE_SUB(CURRENT_DATE, INTERVAL 1 MONTH) AND CURRENT_DATE;
-- Fin Funcion

-- 9. Reabastecer productos automáticamente si están por debajo de un mínimo
CREATE EVENT ReabastecerProductos
ON SCHEDULE EVERY 1 WEEK
DO
    UPDATE Inventario I
    SET I.Cantidad_Disponible = I.Cantidad_Disponible + 50
    WHERE I.Cantidad_Disponible < 5;
-- Fin Evento

-- 10. Generar estadísticas de ventas diarias
CREATE EVENT GenerarEstadisticasDiarias
ON SCHEDULE EVERY 1 DAY
DO
    INSERT INTO Estadisticas_Ventas (Fecha, Total_Ventas, Cantidad_Vendida)
    SELECT CURRENT_DATE, SUM(Total_Venta), COUNT(ID_Venta)
    FROM Ventas
    WHERE Fecha_venta = CURRENT_DATE;
-- Fin Eventp

-- 11. Enviar alerta de inventario bajo a proveedores
CREATE EVENT EnviarAlertaInventarioBajo
ON SCHEDULE EVERY 1 DAY
DO
    INSERT INTO Alertas_Proveedor (ID_Proveedor, Mensaje)
    SELECT I.ID_Proveedor, 'Inventario bajo para el producto ' OR P.Nombre_Producto
    FROM Inventario I
    JOIN Producto P ON I.ID_Producto = P.ID_Producto
    WHERE I.Cantidad_Disponible < 10;
-- Fin Evento

-- 12. Actualización de Estado de Empleados Inactivos
DELIMITER //

CREATE EVENT ActualizarEmpleadosInactivos
ON SCHEDULE EVERY 1 MONTH
DO
BEGIN
    UPDATE Empleados
    SET Estado = FALSE
    WHERE ID_Empleado NOT IN (
        SELECT DISTINCT ID_Empleado
        FROM Ventas
        WHERE Fecha_Venta >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH)
        UNION
        SELECT DISTINCT ID_Empleado
        FROM Compra
        WHERE Fecha_Compra >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH)
    );
END //

DELIMITER ;
-- Fin Evento

-- 13. Descuentos por Temporada de Halloween
DELIMITER //

CREATE EVENT DescuentoHalloween
ON SCHEDULE EVERY 1 DAY
STARTS '2024-10-01 00:00:00'
ENDS '2024-10-31 23:59:59'
DO
BEGIN
    -- Aplicar un descuento del 20% a todos los productos de tipo "disfraz"
    UPDATE Producto
    SET Descuento = 0.20
    WHERE ID_Tipo = (SELECT ID_Tipo FROM Tipo_Producto WHERE Nombre_Tipo = 'disfraz');
END //

DELIMITER ;
-- Fin Evento

-- 14. Evento para restaurar el descuento después de Halloween
DELIMITER //

CREATE EVENT RestaurarDescuentos
ON SCHEDULE EVERY 1 DAY
STARTS '2024-11-01 00:00:00'
DO
BEGIN
    -- Restaurar el descuento a 0 después de Halloween
    UPDATE Producto
    SET Descuento = 0.00
    WHERE ID_Tipo = (SELECT ID_Tipo FROM Tipo_Producto WHERE Nombre_Tipo = 'disfraz');
END //

DELIMITER ;
-- Fin Evento

-- 15. Marcar empleados inactivos
CREATE EVENT MarcarEmpleadosInactivos
ON SCHEDULE EVERY 1 MONTH
DO
    UPDATE Empleados
    SET Estado = 0
    WHERE ID_Empleado NOT IN (SELECT ID_Empleado FROM Ventas WHERE Fecha_venta >= DATE_SUB(CURRENT_DATE, INTERVAL 6 MONTH));
-- Fin Evento

-- 16. Actualizar inventario según las compras
CREATE EVENT ActualizarInventarioPorCompras
ON SCHEDULE EVERY 1 DAY
DO
    UPDATE Inventario I
    JOIN Detalle_Compra DC ON I.ID_Producto = DC.ID_Producto
    SET I.Cantidad_Disponible = I.Cantidad_Disponible + DC.Cantidad
    WHERE DC.ID_Compra IN (SELECT ID_Compra FROM Compra WHERE Fecha_Compra = CURRENT_DATE);
-- Fin Evento

-- 17. Actualizar estado de productos que no se venden
CREATE EVENT ActualizarEstadoProductosSinVentas
ON SCHEDULE EVERY 6 MONTH
DO
    UPDATE Producto
    SET Estado = 'OBSOLETO'
    WHERE ID_Producto NOT IN (SELECT ID_Producto FROM Detalle_Venta WHERE ID_Venta IN (SELECT ID_Venta FROM Ventas WHERE Fecha_venta >= DATE_SUB(CURRENT_DATE, INTERVAL 1 YEAR)));
-- Fin Evento

-- 18. Generar reporte diario de ventas por empleado
CREATE EVENT GenerarReporteDiarioVentasEmpleado
ON SCHEDULE EVERY 1 DAY
DO
    INSERT INTO Reporte_Ventas_Empleado (Fecha, ID_Empleado, Total_Ventas)
    SELECT CURRENT_DATE, ID_Empleado, SUM(Total_Venta)
    FROM Ventas
    WHERE Fecha_venta = CURRENT_DATE
    GROUP BY ID_Empleado;
-- Fin Evento

-- 19. Actualizar automáticamente el total de compras por cliente
CREATE EVENT ActualizarTotalComprasCliente
ON SCHEDULE EVERY 1 WEEK
DO
    UPDATE Clientes C
    SET Total_Compras = (SELECT SUM(Total_Venta) FROM Ventas WHERE ID_Cliente = C.ID_Cliente);
-- Fin Evento

-- 20. Eliminar Proveedores Inactivos
DELIMITER //

CREATE EVENT EliminarProveedoresInactivos
ON SCHEDULE EVERY 1 MONTH
STARTS '2024-10-01 00:00:00'
DO
BEGIN
    -- Eliminar proveedores que no han tenido compras en más de 2 años
    DELETE FROM Proveedor
    WHERE ID_Proveedor NOT IN (
        SELECT DISTINCT ID_Proveedor
        FROM Compra
        WHERE Fecha_Compra >= DATE_SUB(CURDATE(), INTERVAL 2 YEAR)
    );
END //

DELIMITER ;
-- Fin Evento



-- Mostrar Eventos
SHOW EVENTS FROM HALLOWAY;