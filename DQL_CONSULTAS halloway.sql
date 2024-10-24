	-- 1 Obtener la lista de productos más caros que un valor específico.
SELECT * 
FROM producto 
WHERE PRECIO  >= 60000;

-- 2 Listar todos los proveedores con su dirección y teléfono.
SELECT NOMBRE_PROVEEDOR AS PROVEEDOR, TELEFONO, DIRECCION
FROM proveedor;

-- 3 Obtener la lista de clientes con su nombre, teléfono y correo.
-SELECT NOMBRE_CLIENTE AS CLIENTE, TELEFONO, CORREO_ELECTRONICO AS EMAIL
FROM CLIENTES;

-- 4 Consultar todos los medios de pago disponibles.
SELECT TIPO_PAGO AS FORMA_PAGO_DISPONIBLES
FROM medios_pago;

-- 5 Mostrar todos los empleados con su nombre, cargo y estado (activo)
SELECT NOMBRE_EMPLEADO
FROM EMPLEADOS 
WHERE ESTADO = TRUE;

-- 6 Mostrar todos los empleados con su nombre, cargo y estado (inactivo)
SELECT NOMBRE_EMPLEADO
FROM EMPLEADOS 
WHERE ESTADO = FALSE;

-- 7 Listar todas las compras realizadas con 1 proveedor asociado segun una fecha especifica
SELECT ID_COMPRA, ID_PROVEEDOR, TOTAL AS VALOR_COMPRA, FECHA_COMPRA
FROM COMPRA
WHERE FECHA_COMPRA >= '2024-05-01';

-- 8 Consultar todos los detalles de una compra específica por su ID.
SELECT * 
FROM COMPRA 
WHERE ID_COMPRA = 8;

-- 9 Mostrar todas las ventas con fecha, cliente y total de la venta.
SELECT ID_VENTA, FECHA_VENTA, ID_CLIENTE,DESCRIPCION, TOTAL_VENTA
FROM VENTAS ;

-- 10 Listar los detalles de una venta específica por su ID.
SELECT DESCRIPCION AS DETALLE_VENTA, FECHA_VENTA, TOTAL_VENTA
FROM VENTAS 
WHERE ID_VENTA= 40;

-- 11 Mostrar el inventario de todos los productos con cantidad disponible y fecha de última actualización.
SELECT P.NOMBRE_PRODUCTO, I.CANTIDAD_DISPONIBLE,ULTIMA_ACTUALIZACION
FROM INVENTARIO I 
JOIN PRODUCTO P ON I.ID_PRODUCTO = P.ID_PRODUCTO;

-- 12 Calcular el total de ventas realizadas en un rango de fechas.
SELECT SUM(TOTAL_VENTA) AS total_vendido_fechas
FROM VENTAS 
where FECHA_VENTA>= '2024-10-10' AND FECHA_VENTA<='2024-12-31';

-- 13 Obtener el número total de productos en el inventario.
SELECT SUM(CANTIDAD_DISPONIBLE) AS PRODUCTOS_EN_INVENTARIO
FROM inventario;

-- 14 Calcular el gasto total en compras de un proveedor específico.
SELECT SUM(TOTAL) AS GASTO_TOTAL
FROM COMPRA
WHERE ID_PROVEEDOR = 1;

-- 15 Obtener la cantidad total de productos comprados de un tipo específico.
SELECT TP.NOMBRE_TIPO,
SUM(DC.CANTIDAD) AS CANTIDAD_TOTAL
FROM DETALLE_COMPRA DC
JOIN PRODUCTO P ON DC.ID_PRODUCTO = P.ID_PRODUCTO
JOIN TIPO_PRODUCTO TP ON P.ID_TIPO = TP.ID_TIPO
WHERE TP.NOMBRE_TIPO ='Accesorios';

-- 16 Calcular el total gastado por un cliente en todas sus compras.
SELECT 
C.NOMBRE_CLIENTE,
SUM(V.TOTAL_VENTA)AS GASTO_TOTAL
FROM VENTAS V
JOIN CLIENTES C ON V. ID_CLIENTE = C.ID_CLIENTE
GROUP BY 
C. NOMBRE_CLIENTE;

-- 17 Contar el número total de clientes registrados.
SELECT COUNT(*) AS TOTAL_CLIENTES
FROM CLIENTES;

-- 18 Contar cuántos empleados están activos (estado = TRUE).
SELECT COUNT(*)AS EMPLEADOS_ACTIVOS
FROM EMPLEADOS
WHERE ESTADO =TRUE;

-- 19  Calcular el promedio de precio de los productos por tipo.
SELECT TP.NOMBRE_TIPO,  AVG(PRECIO) AS PROMEDIO_PRECIO
FROM PRODUCTO P 
JOIN TIPO_PRODUCTO TP ON P.ID_TIPO = TP.ID_TIPO
GROUP BY TP.NOMBRE_TIPO;

-- 20. Calcular el total de ventas realizadas por un empleado específico.
SELECT SUM(TOTAL_VENTA) AS VENTA_EMPLEADO, ID_EMPLEADO
FROM VENTAS
GROUP BY ID_EMPLEADO;

-- 21 Obtener el total de compras gestionadas por un empleado. 
SELECT COUNT(TOTAL)AS VENTAS_GESTIONADAS, ID_EMPLEADO
FROM COMPRA
GROUP BY ID_EMPLEADO;

-- 22. Mostrar los productos con precio mayor a un valor específico.
SELECT NOMBRE_PRODUCTO,PRECIO 
FROM PRODUCTO 
WHERE PRECIO >= 15500;

-- 23 Consultar las ventas realizadas por un cliente específico en un rango de fechas.
SELECT ID_CLIENTE, DESCRIPCION, FECHA_VENTA, TOTAL_VENTA 
FROM VENTAS
WHERE FECHA_VENTA <'2023-01-01';

-- 24 Listar los productos cuyo inventario está por debajo de un umbral específico.
SELECT P.NOMBRE_PRODUCTO , I.CANTIDAD_DISPONIBLE AS UNIDADES_DISPONIBLES 
FROM INVENTARIO I
JOIN PRODUCTO P ON P.ID_PRODUCTO = I.ID_PRODUCTO
WHERE I.CANTIDAD_DISPONIBLE <= 50;
 
 -- 25. Mostrar las compras realizadas por un proveedor específico en un rango de fechas.
SELECT ID_COMPRA, FECHA_COMPRA, ID_PROVEEDOR
FROM COMPRA 
WHERE ID_PROVEEDOR= 4
AND FECHA_COMPRA BETWEEN '2022-01-01' AND '2024-10-31';

-- 26. Obtener los empleados que han gestionado más de una compra.
SELECT E.NOMBRE_EMPLEADO, COUNT(C.ID_COMPRA) AS VENTA_REALIZADA
FROM EMPLEADOS E
JOIN COMPRA C ON C.ID_EMPLEADO = E.ID_EMPLEADO
GROUP BY E.NOMBRE_EMPLEADO
HAVING  COUNT(C.ID_COMPRA)>1;

-- 27 Listar los productos que pertenecen a un tipo específico.
SELECT NOMBRE_PRODUCTO,PRECIO, ID_TIPO
FROM PRODUCTO 
WHERE ID_TIPO=1;

-- 28. Mostrar las ventas que fueron realizadas usando un medio de pago específico.
SELECT COUNT(V.ID_VENTA) AS VENTAS_REALIZADAS, V.FECHA_VENTA,MP.ID_MEDIO
FROM VENTAS V 
JOIN MEDIOS_PAGO MP ON MP.ID_MEDIO = V.ID_MEDIO
GROUP BY MP.ID_MEDIO;

-- 29. Consultar las compras realizadas por un empleado entre unos meses  determinados.
SELECT count(C.ID_COMPRA) AS COMPRAS_REALIZADAS, E.ID_EMPLEADO
FROM COMPRA C
JOIN EMPLEADOS E ON E.ID_EMPLEADO= C.ID_EMPLEADO
WHERE C.FECHA_COMPRA BETWEEN  '2024-01-10' AND '2024-05-20'
GROUP BY E.ID_EMPLEADO;

-- 30. Mostrar las ventas de productos de una talla específica.
SELECT P.NOMBRE_PRODUCTO,P.TALLA, COUNT(DV.ID_VENTA)AS VENTAS_PRODUCTO
FROM PRODUCTO P
JOIN DETALLE_VENTA DV ON P.ID_PRODUCTO = DV.ID_PRODUCTO 
WHERE P.TALLA= 'L'
GROUP BY P.NOMBRE_PRODUCTO, P.TALLA;

-- 31. Listar los productos que tienen inventario disponible menor o igual a  10.
SELECT P.NOMBRE_PRODUCTO, I.CANTIDAD_DISPONIBLE
FROM INVENTARIO I
JOIN PRODUCTO P ON I.ID_PRODUCTO = P.ID_PRODUCTO
WHERE I.CANTIDAD_DISPONIBLE<=10;

-- 32. Listar las ventas junto con el nombre del cliente y el medio de pago utilizado
SELECT C.NOMBRE_CLIENTE, COUNT(V.ID_VENTA) AS  VENTAS, MP.TIPO_PAGO
FROM VENTAS  V
JOIN CLIENTES C ON C.ID_CLIENTE = V.ID_CLIENTE
JOIN MEDIOS_PAGO MP ON MP.ID_MEDIO=V.ID_MEDIO
WHERE MP.TIPO_PAGO='Efectivo'
GROUP BY C.NOMBRE_CLIENTE, MP.TIPO_PAGO;

-- 33. Mostrar las compras con el nombre del proveedor y del empleado que la gestionó.
SELECT P.NOMBRE_PROVEEDOR,E.NOMBRE_EMPLEADO, COUNT(C.ID_COMPRA) AS COMPRAS
FROM COMPRA C
JOIN PROVEEDOR P ON P.ID_PROVEEDOR = C.ID_PROVEEDOR
JOIN EMPLEADOS E ON E.ID_EMPLEADO = C.ID_EMPLEADO
GROUP BY P.NOMBRE_PROVEEDOR, E.NOMBRE_EMPLEADO;

-- 34. Consultar las ventas con el nombre del producto vendido y su cantidad.
SELECT 	P.NOMBRE_PRODUCTO AS PRODUCTO_VENDIDO, SUM(DV.CANTIDAD) AS COMPRADOS
FROM DETALLE_VENTA DV
JOIN PRODUCTO P ON P.ID_PRODUCTO = DV.ID_PRODUCTO
GROUP BY P.NOMBRE_PRODUCTO ;

-- 35. Obtener el inventario junto con el nombre del producto y del proveedor.
SELECT P.NOMBRE_PRODUCTO, PROVE.NOMBRE_PROVEEDOR, I.CANTIDAD_DISPONIBLE AS CANTIDAD_DISPONIBLE
FROM INVENTARIO I
JOIN PRODUCTO P ON P.ID_PRODUCTO = I.ID_PRODUCTO
JOIN PROVEEDOR PROVE ON PROVE.ID_PROVEEDOR = I.ID_PROVEEDOR;

-- 36. Listar los productos comprados junto con la cantidad y precio unitario.
SELECT P.NOMBRE_PRODUCTO AS PRODUCTO_COMPRADO , DV.CANTIDAD , P.PRECIO AS PRECIO_UNITARIO
FROM DETALLE_VENTA DV
JOIN PRODUCTO P ON P.ID_PRODUCTO = DV.ID_PRODUCTO 
JOIN VENTAS V ON V.ID_VENTA = DV.ID_VENTA;

-- 37.Mostrar los detalles de una venta junto con el nombre del producto y cantidad vendida.
SELECT P.NOMBRE_PRODUCTO, DV.CANTIDAD AS CANTIDAD_VENDIDA, V.DESCRIPCION, V.TOTAL_VENTA
FROM VENTAS V
JOIN DETALLE_VENTA DV ON V.ID_VENTA = DV.ID_VENTA
JOIN PRODUCTO P ON P.ID_PRODUCTO = DV.ID_PRODUCTO;

--  38. Listar todas las ventas realizadas por un empleado específico con los nombres de los clientes.
SELECT C.NOMBRE_CLIENTE, V.ID_VENTA, E.NOMBRE_EMPLEADO
FROM VENTAS V
JOIN CLIENTES C ON C.ID_CLIENTE = V.ID_CLIENTE
JOIN EMPLEADOS E ON E.ID_EMPLEADO = V.ID_EMPLEADO
WHERE E.ID_EMPLEADO= 2;

-- 39. Consultar los productos comprados a un proveedor específico y su cantidad disponible en inventario.
SELECT P.NOMBRE_PRODUCTO, PROVE.NOMBRE_PROVEEDOR, I.CANTIDAD_DISPONIBLE
FROM INVENTARIO I
JOIN PRODUCTO P ON P.ID_PRODUCTO = I.ID_PRODUCTO
JOIN PROVEEDOR PROVE ON PROVE.ID_PROVEEDOR = I.ID_PROVEEDOR -- Error aquí: No debería estar relacionado con INVENTARIO
WHERE PROVE.ID_PROVEEDOR = 1;

-- 40. Mostrar el inventario de un producto específico junto con el nombre del proveedor y la fecha de la última actualización.
SELECT I.CANTIDAD_DISPONIBLE AS INVENTARIO_DISPONIBLE,
P.NOMBRE_PRODUCTO, 
PROV.NOMBRE_PROVEEDOR,
I.ULTIMA_ACTUALIZACION	
FROM INVENTARIO I
JOIN PRODUCTO P ON P.ID_PRODUCTO = I.ID_PRODUCTO
JOIN PROVEEDOR_INVENTARIO PI ON PI.ID_INVENTARIO = I.ID_INVENTARIO
JOIN PROVEEDOR PROV ON PROV.ID_PROVEEDOR = PI.ID_PROVEEDOR
GROUP BY PROV.NOMBRE_PROVEEDOR;

-- 41.Listar los productos que están en el inventario y tienen un costo menor a un valor específico.
SELECT P.NOMBRE_PRODUCTO, P.PRECIO, I.CANTIDAD_DISPONIBLE
FROM PRODUCTO P
JOIN INVENTARIO I ON I.ID_PRODUCTO = P.ID_PRODUCTO
WHERE P.PRECIO <=50000;

-- 42.Consultar los proveedores que no han suministrado productos en el último año.
SELECT PROV.NOMBRE_PROVEEDOR
FROM PROVEEDOR PROV
LEFT JOIN INVENTARIO I ON PROV.ID_PROVEEDOR = I.ID_PROVEEDOR
WHERE I.Ultima_Actualizacion < DATE_SUB(CURDATE(), INTERVAL 1 YEAR) OR I.ID_Proveedor IS NULL;

-- 43. Consultar todos los empleados con un cargo específico.
SELECT ID_EMPLEADO, NOMBRE_EMPLEADO
FROM EMPLEADOS
WHERE CARGO = 'CAJERO';

-- 44. Listar los empleados que tienen un número de teléfono que empieza por ..
SELECT NOMBRE_EMPLEADO,TELEFONO
FROM EMPLEADOS
WHERE TELEFONO LIKE '320%';

-- 45. Mostrar empleados cuyo nombre empiece por una E.
SELECT NOMBRE_EMPLEADO 
FROM EMPLEADOS
WHERE NOMBRE_EMPLEADO LIKE 'E%';

-- 46. Obtener la lista de ventas entre 50.000 y 100.000
 SELECT ID_VENTA, TOTAL_VENTA
 FROM  VENTAS
 WHERE TOTAL_VENTA BETWEEN 50000 AND 100000;

-- 47. Consulta todos los medios de pago disponibles.
SELECT TIPO_PAGO
FROM MEDIOS_PAGO;

-- 48. Listar los productos que han sido comprados por más de un cliente diferente.
SELECT P.NOMBRE_PRODUCTO
FROM PRODUCTO P
JOIN DETALLE_VENTA DV ON P.ID_PRODUCTO = DV.ID_PRODUCTO
JOIN VENTAS V ON DV.ID_VENTA = V.ID_VENTA
JOIN CLIENTES C ON C.ID_CLIENTE = V.ID_CLIENTE 
GROUP BY P.ID_PRODUCTO
HAVING COUNT(DISTINCT C.ID_CLIENTE)>1;


-- 49. Listar los proveedores que han suministrado productos con un inventario disponible MAYOR a un umbral específico.
SELECT DISTINCT PR.Nombre_Proveedor
FROM Proveedor PR
JOIN Inventario I ON PR.ID_Proveedor = I.ID_Proveedor
WHERE I.Cantidad_Disponible > 20;

-- 50 Obtener la lista de productos más caros que un valor específico.
SELECT NOMBRE_PRODUCTO,PRECIO
FROM PRODUCTO 
WHERE PRECIO > 55000;

-- 51. Listar los proveedores que su teléfono registrado empieza por una combinacion especifica.
SELECT NOMBRE_PROVEEDOR,TELEFONO
FROM PROVEEDOR 
WHERE TELEFONO LIKE'320%';

-- 52. Consultar todos los clientes que su  dirección registrada empieza por calle.
SELECT NOMBRE_CLIENTE, TELEFONO, DIRECCION
FROM CLIENTES
WHERE DIRECCION LIKE 'CALLE%';

-- 53. Mostrar todos los DISFRACES que  pertenecen a una talla específica.
SELECT P.NOMBRE_PRODUCTO AS EN_TALLA_XL, P.TALLA
FROM PRODUCTO P
JOIN TIPO_PRODUCTO TP ON P.ID_TIPO = TP.ID_TIPO
WHERE TP.NOMBRE_TIPO = 'DISFRAZ' AND P.TALLA='XL';

-- 54. Obtener la lista de empleados que no tienen correo electrónico registrado.
SELECT NOMBRE_EMPLEADO
FROM EMPLEADOS
WHERE Correo_Electronico = NULL ;

-- 55.Consultar todos los medios de pago que contienen una palabra específica en su nombre.
SELECT TIPO_PAGO
FROM MEDIOS_PAGO
WHERE TIPO_PAGO LIKE 'TARJETA%';

-- 56. Listar las compras realizadas por un proveedor en orden cronológico.
SELECT C.ID_Compra, C.Fecha_Compra, C.Total
FROM Compra C
JOIN Proveedor P ON C.ID_Proveedor = P.ID_Proveedor
WHERE P.ID_Proveedor = 1
ORDER BY C.Fecha_Compra ASC;

-- 57 Obtener los detalles de una venta específica realizada por un cliente.
SELECT V.DESCRIPCION, C.NOMBRE_CLIENTE
FROM VENTAS V
JOIN CLIENTES C ON C.ID_CLIENTE = V.ID_CLIENTE
WHERE C.ID_CLIENTE=2;

-- 58 Mostrar todas las compras realizadas por un empleado específico.
SELECT 	count(C.ID_COMPRA) AS TOTAL_COMPRA, E.NOMBRE_EMPLEADO, SUM(C.TOTAL) AS VALOR 
FROM COMPRA C 
JOIN EMPLEADOS E ON E.ID_EMPLEADO = C.ID_EMPLEADO 
GROUP BY C.ID_EMPLEADO=1;

-- 59 Consultar las compras realizadas por un empleado específico junto con el nombre del proveedor y la fecha de cada compra.
SELECT C.ID_Compra, P.Nombre_Proveedor, C.Fecha_Compra
FROM Compra C
JOIN Proveedor P ON C.ID_Proveedor = P.ID_Proveedor
WHERE C.ID_Empleado = 7
ORDER BY C.Fecha_Compra ASC;

-- 60 Calcular el total de compras realizadas en un mes específico.
SELECT SUM(Total) AS Total_Compras_Mes
FROM Compra
WHERE DATE_FORMAT(Fecha_Compra, '%2023-%01') = '2023-01';

-- 61 Obtener el número total de proveedores registrados en la base de datos.
SELECT COUNT(*) AS Total_Proveedores
FROM Proveedor;

-- 62 Contar cuántos clientes tienen un correo electrónico registrado.
SELECT COUNT(*) AS Clientes_Con_Correo
FROM Clientes
WHERE Correo_Electronico IS NOT NULL;

-- 63.Calcular el promedio de precio de los productos en cada talla.
SELECT Talla, AVG(Precio) AS Promedio_Precio
FROM Producto
GROUP BY Talla;

-- 64. Obtener el total de productos vendidos en un mes específico.
SELECT SUM(DV.Cantidad) AS Total_Productos_Vendidos
FROM Detalle_Venta DV
JOIN Ventas V ON DV.ID_Venta = V.ID_Venta
WHERE DATE_FORMAT(V.Fecha_venta, '%Y-%m') = '2024-10';

-- 65.Contar cuántas ventas han sido realizadas por empleados activos.
SELECT COUNT(V.ID_Venta) AS Ventas_Realizadas
FROM Ventas V
JOIN Empleados E ON V.ID_Empleado = E.ID_Empleado
WHERE E.Estado = 1;

 -- 66. Calcular el total de compras realizadas a un proveedor específico en ls últimos dos años.
SELECT SUM(C.Total) AS Total_Compras
FROM Compra C
JOIN Proveedor P ON C.ID_Proveedor = P.ID_Proveedor
WHERE P.Nombre_Proveedor = 'Proveedora Disfraces S.A.'
AND C.Fecha_Compra >= CURDATE() - INTERVAL 2 YEAR;

-- 67. Contar cuántos productos diferentes han sido vendidos en un rango de fechas.
SELECT COUNT(DISTINCT DV.ID_Producto) AS Total_Productos_Vendidos
FROM Detalle_Venta DV
JOIN Ventas V ON DV.ID_Venta = V.ID_Venta
WHERE V.Fecha_Venta BETWEEN '2024-01-01' AND '2024-12-31';

 -- 68. Calcular el promedio de ventas realizadas por empleado.
SELECT AVG(Num_Ventas) AS Promedio_Ventas_Por_Empleado
FROM (
    SELECT COUNT(V.ID_Venta) AS Num_Ventas
    FROM Ventas V
    JOIN Empleados E ON V.ID_Empleado = E.ID_Empleado
    GROUP BY E.ID_Empleado
) AS Ventas_Por_Empleado;

-- 69. Contar el número total de compras realizadas por cada proveedor.
SELECT P.Nombre_Proveedor, COUNT(C.ID_Compra) AS Total_Compras
FROM Proveedor P
LEFT JOIN Compra C ON P.ID_Proveedor = C.ID_Proveedor
GROUP BY P.ID_Proveedor, P.Nombre_Proveedor;

 -- 70 Mostrar el cliente que  han realizado alguna compra.
SELECT C.Nombre_Cliente
FROM Clientes C
LEFT JOIN Ventas V ON C.ID_Cliente = V.ID_Cliente
WHERE V.ID_Venta = 2;

--  71.Consultar las ventas que incluyen más de un producto.
SELECT V.ID_Venta, V.Fecha_Venta, COUNT(DV.ID_Producto) AS Total_Productos
FROM Ventas V
JOIN Detalle_Venta DV ON V.ID_Venta = DV.ID_Venta
GROUP BY V.ID_Venta
HAVING COUNT(DV.ID_Producto) > 1;

-- 72 Listar las compras realizadas por empleados con un cargo específico.
SELECT C.ID_Compra, C.Fecha_Compra, E.Nombre_Empleado, P.Nombre_Proveedor, C.Total
FROM Compra C
JOIN Empleados E ON C.ID_Empleado = E.ID_Empleado
JOIN Proveedor P ON C.ID_Proveedor = P.ID_Proveedor
WHERE E.Cargo = 'Asistente de Compras';  

--  73.Obtener los productos cuyo precio está por debajo de un valor específico.
SELECT ID_Producto, Nombre_Producto, Precio
FROM Producto
WHERE Precio < 42000; 

-- 74. Mostrar las ventas realizadas en un día específico.
SELECT ID_Venta, Fecha_venta, Total_Venta, ID_Cliente, ID_Medio, ID_Empleado
FROM Ventas
WHERE Fecha_venta = '2023-04-14';  

 -- 75 Consultar los proveedores que han suministrado más de un producto.
SELECT P.Nombre_Proveedor
FROM Proveedor P
JOIN Proveedor_Inventario PI ON P.ID_Proveedor = PI.ID_Proveedor
JOIN Inventario I ON PI.ID_Inventario = I.ID_Inventario
JOIN Producto Prod ON I.ID_Producto = Prod.ID_Producto
GROUP BY P.ID_Proveedor
HAVING COUNT(DISTINCT Prod.ID_Producto) > 1;

-- 75. Listar las compras que incluyen productos de una talla específica.
SELECT C.ID_Compra, C.Fecha_Compra, P.Nombre_Producto, P.Talla
FROM Compra C
JOIN Detalle_Compra DC ON C.ID_Compra = DC.ID_Compra
JOIN Producto P ON DC.ID_Producto = P.ID_Producto
JOIN Inventario I ON P.ID_Producto = I.ID_Producto
WHERE P.Talla = 'M';

-- 76.Consultar los productos que no han sido vendidos en un rango de fechas.
SELECT P.ID_Producto, P.Nombre_Producto
FROM Producto P
LEFT JOIN Detalle_Venta DV ON P.ID_Producto = DV.ID_Producto
LEFT JOIN Ventas V ON DV.ID_Venta = V.ID_Venta AND V.Fecha_Venta BETWEEN '2024-01-01' AND '2024-12-31'
WHERE V.ID_Venta IS NULL;

-- 77.  Mostrar las compras de productos de un tipo específico.
SELECT C.ID_Compra, C.Fecha_Compra, P.Nombre_Producto, DC.Cantidad, DC.Precio_Unitario
FROM Compra C
JOIN Detalle_Compra DC ON C.ID_Compra = DC.ID_Compra
JOIN Producto P ON DC.ID_Producto = P.ID_Producto
JOIN Tipo_Producto T ON P.ID_Tipo = T.ID_Tipo
WHERE T.Nombre_Tipo = 'Maquillaje';

-- 78 Listar las ventas de productos cuyo inventario está por debajo de un cierto nivel.
	SELECT V.ID_Venta, V.Fecha_Venta, P.Nombre_Producto, DV.Cantidad, DV.Precio_Unitario
FROM Ventas V
JOIN Detalle_Venta DV ON V.ID_Venta = DV.ID_Venta
JOIN Producto P ON DV.ID_Producto = P.ID_Producto
JOIN Inventario I ON P.ID_Producto = I.ID_Producto
WHERE I.Cantidad_Disponible <= valor_inventario;


-- 79 Consultar las ventas de cada cliente con el medio de pago utilizado y el total pagado
SELECT 
    C.Nombre_Cliente,
    V.Fecha_Venta,
    MP.Tipo_Pago,
    V.Total_Venta
FROM 
    Ventas V
JOIN 
    Clientes C ON V.ID_Cliente = C.ID_Cliente
JOIN 
    Medios_Pago MP ON V.ID_Medio = MP.ID_Medio
ORDER BY 
    C.Nombre_Cliente, V.Fecha_Venta;
    
    -- 80.Listar los empleados que han realizado ventas y el total de ventas que han gestionado.
SELECT E.Nombre_Empleado, COUNT(V.ID_Venta) AS Total_Ventas
FROM Empleados E
JOIN Ventas V ON E.ID_Empleado = V.ID_Empleado
GROUP BY E.Nombre_Empleado
HAVING COUNT(V.ID_Venta) > 0;

-- 81. Mostrar las compras realizadas por cada empleado junto con el nombre del proveedor.
SELECT E.Nombre_Empleado, P.Nombre_Proveedor, C.Fecha_Compra, C.Total
FROM Compra C
JOIN Empleados E ON C.ID_Empleado = E.ID_Empleado
JOIN Proveedor P ON C.ID_Proveedor = P.ID_Proveedor
ORDER BY E.Nombre_Empleado, C.Fecha_Compra;

-- 82.Consultar las ventas de cada cliente con el medio de pago utilizado y el total pagado.
SELECT C.Nombre_Cliente, MP.Tipo_Pago, V.Total_Venta, V.Fecha_Venta
FROM Ventas V
JOIN Clientes C ON V.ID_Cliente = C.ID_Cliente
JOIN Medios_Pago MP ON V.ID_Medio = MP.ID_Medio
ORDER BY C.Nombre_Cliente, V.Fecha_Venta;

-- 83 Obtener el inventario de cada producto junto con su proveedor y la última fecha de actualización.
SELECT P.Nombre_Producto, Pro.Nombre_Proveedor, I.Cantidad_Disponible, I.Ultima_Actualizacion
FROM Inventario I
JOIN Producto P ON I.ID_Producto = P.ID_Producto
JOIN Proveedor Pro ON I.ID_Proveedor = Pro.ID_Proveedor
ORDER BY I.Ultima_Actualizacion DESC;

-- 84 .Listar los productos vendidos junto con el nombre del cliente y la cantidad vendida.
SELECT Nombre_Producto, Nombre_Cliente, Cantidad
FROM (
    SELECT P.Nombre_Producto, C.Nombre_Cliente, DV.Cantidad
    FROM Detalle_Venta DV
    JOIN Producto P ON DV.ID_Producto = P.ID_Producto
    JOIN Ventas V ON DV.ID_Venta = V.ID_Venta
    JOIN Clientes C ON V.ID_Cliente = C.ID_Cliente
) AS Subconsulta
ORDER BY Nombre_Cliente, Nombre_Producto;

-- 85. Consultar las compras realizadas junto con el nombre del empleado que gestionó la compra y el proveedor.
SELECT ID_Compra, Fecha_Compra, 
       (SELECT Nombre_Empleado FROM Empleados E WHERE E.ID_Empleado = C.ID_Empleado) AS Nombre_Empleado,
       (SELECT Nombre_Proveedor FROM Proveedor P WHERE P.ID_Proveedor = C.ID_Proveedor) AS Nombre_Proveedor
FROM Compra C;

-- 86. Mostrar las ventas realizadas por cada medio de pago y el total de ventas procesadas por cada uno
SELECT MP.Tipo_Pago,
       (SELECT COUNT(*) 
        FROM Ventas V 
        WHERE V.ID_Medio = MP.ID_Medio) AS Total_Ventas
FROM Medios_Pago MP;

-- 87 Consultar los productos vendidos a cada cliente junto con la cantidad y precio unitario.
SELECT C.Nombre_Cliente,
       P.Nombre_Producto,
       DV.Cantidad,
       DV.ID_Producto
FROM Clientes C
JOIN Ventas V ON C.ID_Cliente = V.ID_Cliente
JOIN Detalle_Venta DV ON V.ID_Venta = DV.ID_Venta
JOIN Producto P ON DV.ID_Producto = P.ID_Producto
WHERE V.ID_Venta IN (
    SELECT ID_Venta 
    FROM Detalle_Venta 
    WHERE ID_Producto = DV.ID_Producto
);

-- 88. Listar los empleados que han gestionado más de una venta con los detalles de cada venta.
SELECT E.Nombre_Empleado, 
       V.ID_Venta, 
       V.Fecha_Venta, 
       V.Total_Venta
FROM Empleados E
JOIN Ventas V ON E.ID_Empleado = V.ID_Empleado
WHERE E.ID_Empleado IN (
    SELECT ID_Empleado 
    FROM Ventas 
    GROUP BY ID_Empleado 
    HAVING COUNT(ID_Venta) > 1
);

-- 89. Mostrar las compras realizadas de un producto específico por diferentes proveedores.
SELECT C.ID_Compra, 
       C.Fecha_Compra, 
       P.Nombre_Proveedor, 
       DC.Cantidad, 
       DC.Precio_Unitario
FROM Compra C
JOIN Detalle_Compra DC ON C.ID_Compra = DC.ID_Compra
JOIN Proveedor P ON C.ID_Proveedor = P.ID_Proveedor
WHERE DC.ID_Producto = (
    SELECT ID_Producto 
    FROM Producto 
    WHERE Nombre_Producto = 'Disfraz de Bruja'
);

-- 90. Obtener los productos más vendidos en los últimos 3 meses.	
SELECT P.ID_Producto, 
       P.Nombre_Producto, 
       SUM(DV.Cantidad) AS Total_Vendido
FROM Detalle_Venta DV
JOIN Ventas V ON DV.ID_Venta = V.ID_Venta
JOIN Producto P ON DV.ID_Producto = P.ID_Producto
WHERE V.Fecha_Venta >= DATE_SUB(CURDATE(), INTERVAL 3 MONTH)
GROUP BY P.ID_Producto
ORDER BY Total_Vendido DESC;

-- 91. Consultar los clientes que han realizado más compras en un año específico.
SELECT C.ID_Cliente, 
       C.Nombre_Cliente, 
       COUNT(*) AS Total_Compras
FROM Clientes C
WHERE C.ID_Cliente IN (
    SELECT V.ID_Cliente
    FROM Ventas V
    WHERE YEAR(V.Fecha_Venta) = 2023  
    GROUP BY V.ID_Cliente
    HAVING COUNT(*) > 0
)
GROUP BY C.ID_Cliente
ORDER BY Total_Compras DESC;

-- 92.Listar los productos que tienen inventario disponible pero nunca han sido vendidos.
SELECT P.ID_Producto, 
       P.Nombre_Producto, 
       I.Cantidad_Disponible
FROM Producto P
JOIN Inventario I ON P.ID_Producto = I.ID_Producto
WHERE I.Cantidad_Disponible > 0
AND P.ID_Producto NOT IN (
    SELECT DV.ID_Producto
    FROM Detalle_Venta DV
);

-- 93 Mostrar los empleados que han gestionado compras y ventas en el mismo día.

SELECT E.ID_Empleado, 
       E.Nombre_Empleado,
       V.Fecha_Venta
FROM Empleados E
JOIN Ventas V ON E.ID_Empleado = V.ID_Empleado
WHERE V.Fecha_Venta IN (
    SELECT C.Fecha_Compra
    FROM Compra C
    WHERE C.ID_Empleado = E.ID_Empleado
)
GROUP BY E.ID_Empleado, V.Fecha_Venta;

-- 94. Consultar las ventas realizadas por clientes que hayan utilizado menos  de 2 medio de pago.
SELECT V.ID_Venta, 
       V.Fecha_Venta, 
       C.Nombre_Cliente, 
       MP.Tipo_Pago, 
       V.Total_Venta
FROM Ventas V
JOIN Clientes C ON V.ID_Cliente = C.ID_Cliente
JOIN Medios_Pago MP ON V.ID_Medio = MP.ID_Medio
WHERE C.ID_Cliente IN (
    SELECT ID_Cliente
    FROM Ventas
    GROUP BY ID_Cliente
    HAVING COUNT(DISTINCT ID_Medio) < 2
);

-- 95. Obtener los productos que han sido comprados y vendidos por el mismo proveedor.
SELECT P.ID_Producto, 
       P.Nombre_Producto
FROM Producto P
WHERE P.ID_Producto IN (
    SELECT DC.ID_Producto
    FROM Detalle_Compra DC
    JOIN Compra C ON DC.ID_Compra = C.ID_Compra
    WHERE C.ID_Proveedor IN (
        SELECT ID_Proveedor
        FROM Ventas V
        JOIN Detalle_Venta DV ON V.ID_Venta = DV.ID_Venta
        JOIN Producto P2 ON DV.ID_Producto = P2.ID_Producto
        JOIN Inventario I ON P2.ID_Producto = I.ID_Producto
        WHERE I.ID_Proveedor = C.ID_Proveedor
        GROUP BY I.ID_Proveedor
    )
)
AND P.ID_Producto IN (
    SELECT DV.ID_Producto
    FROM Detalle_Venta DV
    JOIN Ventas V ON DV.ID_Venta = V.ID_Venta
    JOIN Inventario I ON DV.ID_Producto = I.ID_Producto
);

-- 96 Listar los productos más comprados por un cliente específico.
SELECT P.ID_Producto, 
       P.Nombre_Producto, 
       SUM(DC.Cantidad) AS Total_Cantidad
FROM Producto P
JOIN Detalle_Compra DC ON P.ID_Producto = DC.ID_Producto
JOIN Compra C ON DC.ID_Compra = C.ID_Compra
WHERE C.ID_Proveedor IN (
    SELECT ID_Proveedor 
    FROM Ventas V 
    JOIN Detalle_Venta DV ON V.ID_Venta = DV.ID_Venta
    WHERE V.ID_Cliente = '1'
)
GROUP BY P.ID_Producto
ORDER BY Total_Cantidad DESC;

-- 97. Consultar los proveedores que han suministrado productos cuyo inventario está agotado
SELECT DISTINCT P.Nombre_Proveedor
FROM Proveedor P
WHERE P.ID_Proveedor IN (
    SELECT I.ID_Proveedor
    FROM Inventario I
    WHERE I.Cantidad_Disponible = 0
);
-- 98. Mostrar las ventas realizadas por clientes que han comprado productos de más de un tipo.
SELECT 
    V.ID_Venta, 
    V.Fecha_Venta, 
    C.Nombre_Cliente, 
    V.Total_Venta
FROM    Ventas V
JOIN    Clientes C ON V.ID_Cliente = C.ID_Cliente
WHERE    V.ID_Cliente IN (
        SELECT  DV.ID_Cliente
        FROM    Detalle_Venta DV
        JOIN    Producto P ON DV.ID_Producto = P.ID_Producto
        GROUP BY  DV.ID_Cliente
        HAVING  COUNT(DISTINCT P.ID_Tipo) > 1
);

-- 99 Obtener los productos que han sido comprados por más de un proveedor en el último año
SELECT     P.Nombre_Producto
FROM     Producto P
WHERE     P.ID_Producto IN (
        SELECT    DC.ID_Producto
        FROM      Detalle_Compra DC
        JOIN      Compra C ON DC.ID_Compra = C.ID_Compra
        WHERE     C.Fecha_Compra >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR)
        GROUP BY  DC.ID_Producto
        HAVING   COUNT(DISTINCT C.ID_Proveedor) > 1
    );











