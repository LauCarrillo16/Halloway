-- usuarios --
CREATE USER 'administrador'@'localhost' IDENTIFIED BY 'halloway123';
GRANT ALL PRIVILEGES ON HALLOWAY.* TO 'admin_user'@'localhost';
-- usuario  administrado : acceso total

CREATE USER 'usuario_ventas'@'localhost' IDENTIFIED BY 'ventas1234';
GRANT SELECT, UPDATE ON HALLOWAY.Producto TO 'usuario_ventas'@'localhost';
GRANT SELECT, UPDATE ON HALLOWAY.Inventario TO 'usuario_ventas'@'localhost';
-- usuario ventas con acceso de lectura y actualizacion  en producto e inventario


CREATE USER 'USUARIO_PROVEE'@'localhost' IDENTIFIED BY 'PROVEE123';
GRANT SELECT, INSERT, UPDATE, DELETE ON HALLOWAY.Proveedor TO 'USUARIO_PROVEE'@'localhost';
GRANT SELECT ON HALLOWAY.Inventario TO 'USUARIO_PROVEE'@'localhost';
-- USUARIO PARA PROVEEDORRES E INVENTARIO 


CREATE USER 'ECONOMIA'@'localhost' IDENTIFIED BY 'ECONOMIA123';
GRANT SELECT ON HALLOWAY.Producto TO 'ECONOMIA'@'localhost';
GRANT SELECT ON HALLOWAY.Empleados TO 'ECONOMIA'@'localhost';
-- USUARIO PARA CONSULTAS FINANCIERAS

CREATE USER 'INVENTARIO'@'localhost' IDENTIFIED BY 'INVENTARIO1234';
GRANT SELECT, UPDATE ON HALLOWAY.Inventario TO 'INVENTARIO'@'localhost';
-- USUARIO PARA INVENTARIO 

FLUSH PRIVILEGES;
