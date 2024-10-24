INSERT INTO Tipo_Producto (Nombre_Tipo) VALUES
('Disfraz'),
('Maquillaje'),
('Accesorios');
-- Fin Insercion Tipo_Producto

INSERT INTO Producto (Nombre_Producto, Precio, Talla, ID_Tipo) VALUES
('Disfraz de Vampiro', 45500.00, 'L', 1),
('Disfraz de Bruja', 40000.00, 'M', 1),
('Disfraz de Esqueleto', 50000.00, 'XL', 1),
('Disfraz de Pirata', 35750.00, 'S', 1),
('Disfraz de Fantasma', 30250.00, 'M', 1),
('Maquillaje de Zombie', 12000.00, 'NO APLICA', 2),
('Maquillaje de Payaso', 15500.00, 'NO APLICA', 2),
('Maquillaje de Vampiro', 13250.00, 'NO APLICA', 2),
('Maquillaje de Bruja', 10000.00, 'NO APLICA', 2),
('Maquillaje de Esqueleto', 11750.00, 'NO APLICA', 2),
('Sombrero de Bruja', 25500.00, 'NO APLICA', 3),
('Sombrero de Pirata', 20000.00, 'NO APLICA', 3),
('Máscara de Esqueleto', 18750.00, 'NO APLICA', 3),
('Capa de Vampiro', 27000.00, 'M', 3),
('Espada de Pirata', 15000.00, 'NO APLICA', 3),
('Disfraz de Hombre Lobo', 60000.00, 'XXL', 1),
('Disfraz de Diablo', 38500.00, 'M', 1),
('Disfraz de Ángel', 42000.00, 'S', 1),
('Disfraz de Momia', 47000.00, 'XL', 1),
('Disfraz de Princesa', 55000.00, 'M', 1),
('Maquillaje de Hombre Lobo', 12500.00, 'NO APLICA', 2),
('Maquillaje de Momia', 14750.00, 'NO APLICA', 2),
('Maquillaje de Diablo', 10250.00, 'NO APLICA', 2),
('Maquillaje de Ángel', 11500.00, 'NO APLICA', 2),
('Maquillaje de Princesa', 9750.00, 'NO APLICA', 2),
('Gorro de Hombre Lobo', 22000.00, 'NO APLICA', 3),
('Aureola de Ángel', 18000.00, 'NO APLICA', 3),
('Cola de Diablo', 16500.00, 'NO APLICA', 3),
('Corona de Princesa', 20250.00, 'NO APLICA', 3),
('Bastón de Bruja', 17000.00, 'NO APLICA', 3),
('Disfraz de Fantasma Espeluznante', 34500.00, 'L', 1),
('Disfraz de Súper Héroe', 48750.00, 'M', 1),
('Disfraz de Payaso', 29999.00, 'XL', 1),
('Disfraz de Hombre Invisible', 60500.00, 'S', 1),
('Disfraz de Sirena', 55500.00, 'M', 1),
('Maquillaje de Payaso Triste', 10500.00, 'NO APLICA', 2),
('Maquillaje de Superhéroe', 13750.00, 'NO APLICA', 2),
('Maquillaje de Sirena', 14250.00, 'NO APLICA', 2),
('Maquillaje de Fantasma', 11500.00, 'NO APLICA', 2),
('Maquillaje de Hombre Invisible', 15000.00, 'NO APLICA', 2),
('Peluca de Sirena', 25000.00, 'NO APLICA', 3),
('Máscara de Fantasma', 18500.00, 'NO APLICA', 3),
('Guantes de Payaso', 12750.00, 'NO APLICA', 3),
('Cinturón de Súper Héroe', 20500.00, 'NO APLICA', 3),
('Espada de Fantasía', 15500.00, 'NO APLICA', 3),
('Disfraz de Robot', 62000.00, 'XXL', 1),
('Disfraz de Ninja', 40000.00, 'L', 1),
('Disfraz de Astronauta', 55500.00, 'M', 1),
('Disfraz de Bailarina', 47250.00, 'S', 1),
('Disfraz de Pirata Espadachín', 43000.00, 'L', 1);
-- Fin Insercion Producto

INSERT INTO Proveedor (Nombre_Proveedor, Telefono, Direccion)
VALUES
('Proveedora Disfraces S.A.', '3104567890', 'Calle 12 #34-56, Bogotá'),
('Fantasía y Más', '3205678901', 'Carrera 45 #67-89, Medellín'),
('Distribuciones Festivas', '3006789012', 'Calle 89 #12-34, Cali'),
('Maquillaje y Estilo Ltda.', '3127890123', 'Avenida 23 #56-78, Barranquilla'),
('Color y Estilo', '3158901234', 'Carrera 12 #98-76, Cartagena'),
('Proveedora Maquillaje S.A.S.', '3019012345', 'Calle 45 #78-90, Bucaramanga'),
('Accesorios Festivos', '3180123456', 'Carrera 67 #34-12, Bogotá'),
('Accesorios Creativos', '3101234567', 'Calle 12 #45-78, Medellín'),
('Distribuciones Accesorios LTDA', '3162345678', 'Avenida 67 #89-12, Cali'),
('Todo para la Fiesta', '3223456789', 'Carrera 23 #45-67, Barranquilla'),
('Accesorios y Más S.A.', '3004567891', 'Calle 78 #90-12, Cartagena'),
('Cosméticos Artísticos', '3115678902', 'Avenida 45 #67-89, Bogotá'),
('La Casa del Disfraz', '3146789012', 'Carrera 89 #12-34, Medellín'),
('Disfraces y Sorpresas', '3207890123', 'Calle 23 #45-67, Cali'),
('Fiesta Maquillaje Pro', '3178901234', 'Carrera 45 #89-12, Barranquilla'),
('Distribuidora de Maquillaje', '3129012345', 'Calle 12 #56-78, Cartagena'),
('Innovación en Maquillaje', '3190123456', 'Carrera 67 #34-56, Bogotá'),
('Fiesta Accesorios LTDA', '3011234567', 'Calle 45 #78-90, Medellín'),
('Accesorios Exclusivos', '3132345678', 'Carrera 23 #67-89, Cali'),
('Proveedores de Fiesta', '3183456789', 'Calle 89 #12-34, Barranquilla');
-- Fin Inserciones Proveedor

INSERT INTO Inventario (Cantidad_Disponible, Ultima_Actualizacion, ID_Proveedor, ID_Producto)
VALUES
(50, '2022-09-01', 1, 1),  -- Disfraz de Vampiro por Proveedora Disfraces S.A.
(40, '2023-03-15', 2, 2),  -- Disfraz de Bruja por Fantasía y Más
(30, '2022-11-05', 3, 3),  -- Disfraz de Esqueleto por Distribuciones Festivas
(45, '2024-04-20', 1, 4),  -- Disfraz de Pirata por Proveedora Disfraces S.A.
(20, '2023-01-10', 2, 5),  -- Disfraz de Fantasma por Fantasía y Más
(100, '2022-12-25', 4, 6),  -- Maquillaje de Zombie por Maquillaje y Estilo Ltda.
(80, '2023-05-05', 5, 7),  -- Maquillaje de Payaso por Color y Estilo
(60, '2022-10-30', 6, 8),  -- Maquillaje de Vampiro por Proveedora Maquillaje S.A.S.
(75, '2023-06-12', 4, 9),  -- Maquillaje de Bruja por Maquillaje y Estilo Ltda.
(90, '2024-02-10', 5, 10), -- Maquillaje de Esqueleto por Color y Estilo
(25, '2022-11-12', 7, 11), -- Sombrero de Bruja por Accesorios Festivos
(30, '2023-03-22', 8, 12), -- Sombrero de Pirata por Accesorios Creativos
(40, '2022-12-18', 9, 13), -- Máscara de Esqueleto por Distribuciones Accesorios LTDA
(50, '2024-05-05', 7, 14), -- Capa de Vampiro por Accesorios Festivos
(75, '2023-07-28', 8, 15), -- Espada de Pirata por Accesorios Creativos
(18, '2023-09-10', 1, 16), -- Disfraz de Hombre Lobo por Proveedora Disfraces S.A.
(22, '2024-01-08', 3, 17), -- Disfraz de Diablo por Distribuciones Festivas
(35, '2022-10-20', 2, 18), -- Disfraz de Ángel por Fantasía y Más
(15, '2023-11-03', 1, 19), -- Disfraz de Momia por Proveedora Disfraces S.A.
(50, '2024-07-25', 3, 20), -- Disfraz de Princesa por Distribuciones Festivas
(120, '2023-05-13', 4, 21), -- Maquillaje de Hombre Lobo por Maquillaje y Estilo Ltda.
(95, '2024-06-22', 5, 22), -- Maquillaje de Momia por Color y Estilo
(85, '2022-09-17', 6, 23), -- Maquillaje de Diablo por Proveedora Maquillaje S.A.S.
(110, '2024-08-04', 4, 24), -- Maquillaje de Ángel por Maquillaje y Estilo Ltda.
(125, '2023-12-09', 5, 25), -- Maquillaje de Princesa por Color y Estilo
(25, '2023-01-30', 7, 26), -- Gorro de Hombre Lobo por Accesorios Festivos
(45, '2022-10-25', 8, 27), -- Aureola de Ángel por Accesorios Creativos
(50, '2023-11-10', 9, 28), -- Cola de Diablo por Distribuciones Accesorios LTDA
(30, '2024-02-15', 7, 29), -- Corona de Princesa por Accesorios Festivos
(65, '2022-12-18', 8, 30), -- Bastón de Bruja por Accesorios Creativos
(12, '2023-06-12', 1, 31), -- Disfraz de Fantasma Espeluznante por Proveedora Disfraces S.A.
(27, '2024-04-24', 2, 32), -- Disfraz de Súper Héroe por Fantasía y Más
(40, '2022-09-07', 3, 33), -- Disfraz de Payaso por Distribuciones Festivas
(15, '2023-07-12', 1, 34), -- Disfraz de Hombre Invisible por Proveedora Disfraces S.A.
(33, '2024-06-29', 3, 35), -- Disfraz de Sirena por Distribuciones Festivas
(110, '2022-11-11', 6, 36), -- Maquillaje de Payaso Triste por Proveedora Maquillaje S.A.S.
(95, '2024-08-02', 4, 37), -- Maquillaje de Superhéroe por Maquillaje y Estilo Ltda.
(78, '2023-02-19', 5, 38), -- Maquillaje de Sirena por Color y Estilo
(90, '2022-09-06', 4, 39), -- Maquillaje de Fantasma por Maquillaje y Estilo Ltda.
(130, '2023-12-16', 6, 40), -- Maquillaje de Hombre Invisible por Proveedora Maquillaje S.A.S.
(35, '2024-09-20', 7, 41), -- Peluca de Sirena por Accesorios Festivos
(50, '2023-03-03', 8, 42), -- Máscara de Fantasma por Accesorios Creativos
(75, '2022-11-08', 9, 43), -- Guantes de Payaso por Distribuciones Accesorios LTDA
(65, '2023-07-19', 7, 44), -- Paraguas de Bruja por Accesorios Festivos
(55, '2024-10-12', 8, 45), -- Cinturón de Pirata por Accesorios Creativos
(10, '2024-9-10', 12, 46),
(2, '2023-12-30', 17, 47),
(5, '2024-01-01', 5, 48),
(10, '2024-05-24', 10, 49),
(24, '2024-05-05', 15,50);
-- Fin Inserciones Inventario

INSERT INTO Clientes (Nombre_Cliente, Telefono, Direccion, Correo_Electronico)
VALUES
('Juan Pérez', '3001234567', 'Carrera 1 #10-20', 'juan.perez@example.com'),
('María López', '3109876543', 'Calle 5 #15-30', 'maria.lopez@example.com'),
('Andrés Gómez', '3202345678', 'Avenida 2 #25-40', 'andres.gomez@example.com'),
('Laura Martínez', '3303456789', 'Transversal 3 #5-10', 'laura.martinez@example.com'),
('Carlos Rodríguez', '3404567890', 'Calle 7 #15-20', 'carlos.rodriguez@example.com'),
('Sofía Torres', '3505678901', 'Carrera 8 #22-35', 'sofia.torres@example.com'),
('Luis Fernández', '3606789012', 'Avenida 4 #18-25', 'luis.fernandez@example.com'),
('Cecilia Morales', '3707890123', 'Calle 6 #10-15', 'cecilia.morales@example.com'),
('Jorge Díaz', '3808901234', 'Carrera 9 #30-45', 'jorge.diaz@example.com'),
('Ana Jiménez', '3909012345', 'Transversal 1 #8-12', 'ana.jimenez@example.com'),
('Miguel Ángel Suárez', '3002345678', 'Calle 12 #40-50', 'miguel.suarez@example.com'),
('Tatiana Castaño', '3103456789', 'Carrera 3 #33-55', 'tatiana.castano@example.com'),
('Diego Martínez', '3204567890', 'Avenida 6 #19-26', 'diego.martinez@example.com'),
('Lucía Gutiérrez', '3305678901', 'Calle 11 #22-28', 'lucia.gutierrez@example.com'),
('Felipe Gómez', '3406789012', 'Calle 3 #14-29', 'felipe.gomez@example.com'),
('Valentina Ramírez', '3507890123', 'Carrera 4 #30-36', 'valentina.ramirez@example.com'),
('Cristian Vargas', '3608901234', 'Transversal 5 #6-16', 'cristian.vargas@example.com'),
('Isabella Herrera', '3709012345', 'Calle 9 #50-60', 'isabella.herrera@example.com'),
('Samuel Parra', '3800123456', 'Avenida 5 #24-37', 'samuel.parra@example.com'),
('Camila Peña', '3901234567', 'Calle 14 #19-21', 'camila.pena@example.com'),
('Gabriel Castro', '3002345678', 'Carrera 10 #27-45', 'gabriel.castro@example.com'),
('Juliana Romero', '3103456789', 'Avenida 3 #16-22', 'juliana.romero@example.com'),
('Rafael Medina', '3204567890', 'Transversal 4 #13-19', 'rafael.medina@example.com'),
('Natalia Guzmán', '3305678901', 'Calle 8 #11-14', 'natalia.guzman@example.com'),
('Esteban López', '3406789012', 'Carrera 2 #31-42', 'esteban.lopez@example.com'),
('Diana Salazar', '3507890123', 'Avenida 7 #23-29', 'diana.salazar@example.com'),
('Hernán Ocampo', '3608901234', 'Calle 15 #18-26', 'hernan.ocampo@example.com'),
('Sara Acosta', '3709012345', 'Carrera 1 #5-9', 'sara.acosta@example.com'),
('Luis Miguel Torres', '3800123456', 'Avenida 8 #37-41', 'luis.torres@example.com'),
('Karla Fernández', '3901234567', 'Calle 20 #15-20', 'karla.fernandez@example.com'),
('Felipe Alvarado', '3002345678', 'Calle 13 #16-22', 'felipe.alvarado@example.com'),
('Vanessa Díaz', '3103456789', 'Carrera 6 #8-12', 'vanessa.diaz@example.com'),
('Estefanía Gómez', '3204567890', 'Avenida 2 #10-15', 'estefania.gomez@example.com'),
('Adriana Castillo', '3305678901', 'Transversal 7 #5-10', 'adriana.castillo@example.com'),
('Julián Reyes', '3406789012', 'Calle 18 #25-35', 'julian.reyes@example.com'),
('Sandra Ospina', '3507890123', 'Carrera 12 #30-40', 'sandra.ospina@example.com'),
('Camilo Ortega', '3608901234', 'Calle 21 #15-25', 'camilo.ortega@example.com'),
('Mónica Castro', '3709012345', 'Carrera 7 #19-24', 'monica.castro@example.com'),
('Andrés Torres', '3800123456', 'Avenida 9 #20-30', 'andres.torres@example.com'),
('Mariana Castaño', '3901234567', 'Calle 4 #10-15', 'mariana.castano@example.com'),
('Carlos Alberto Pérez', '3002345678', 'Carrera 3 #12-17', 'carlos.perez@example.com'),
('Gisela Martínez', '3103456789', 'Avenida 10 #22-32', 'gisela.martinez@example.com'),
('Oswaldo Gómez', '3204567890', 'Calle 16 #30-35', 'oswaldo.gomez@example.com'),
('Paola Ramírez', '3305678901', 'Carrera 11 #15-20', 'paola.ramirez@example.com'),
('Nicolás López', '3406789012', 'Avenida 1 #5-10', 'nicolas.lopez@example.com');
-- Fin Insercion Clientes

INSERT INTO Medios_Pago (Tipo_Pago)
VALUES
('Efectivo'),
('Tarjeta de Crédito'),
('Tarjeta de Débito'),
('Transferencia Bancaria'),
('PayPal');
-- Fin Insercion Medios_Pago


INSERT INTO Empleados (Nombre_Empleado, Cargo, Telefono, Correo_Electronico, Estado)
VALUES
('Juan Pérez', 'Gerente', '3001234567', 'juan.perez@example.com', TRUE),
('María López', 'Vendedora', '3109876543', 'maria.lopez@example.com', TRUE),
('Andrés Gómez', 'Cajero', '3202345678', 'andres.gomez@example.com', FALSE),
('Laura Martínez', 'Auxiliar de Ventas', '3303456789', 'laura.martinez@example.com', TRUE),
('Carlos Rodríguez', 'Supervisor', '3404567890', 'carlos.rodriguez@example.com', TRUE),
('Sofía Torres', 'Asistente Administrativo', '3505678901', 'sofia.torres@example.com', TRUE),
('Luis Fernández', 'Jefe de Compras', '3606789012', 'luis.fernandez@example.com', FALSE),
('Cecilia Morales', 'Promotora', '3707890123', 'cecilia.morales@example.com', TRUE),
('Jorge Díaz', 'Vendedor', '3808901234', 'jorge.diaz@example.com', FALSE),
('Ana Jiménez', 'Cajera', '3909012345', 'ana.jimenez@example.com', FALSE),
('Miguel Ángel Suárez', 'Gerente de Ventas', '3002345678', 'miguel.suarez@example.com', TRUE),
('Tatiana Castaño', 'Asistente de Compras', '3103456789', 'tatiana.castano@example.com', FALSE),
('Diego Martínez', 'Encargado de Almacén', '3204567890', 'diego.martinez@example.com', TRUE),
('Lucía Gutiérrez', 'Analista de Ventas', '3305678901', 'lucia.gutierrez@example.com', FALSE),
('Felipe Gómez', 'Vendedor', '3406789012', 'felipe.gomez@example.com', FALSE),
('Valentina Ramírez', 'Asistente Contable', '3507890123', 'valentina.ramirez@example.com', FALSE),
('Cristian Vargas', 'Auxiliar de Almacén', '3608901234', 'cristian.vargas@example.com', TRUE),
('Isabella Herrera', 'Jefe de Ventas', '3709012345', 'isabella.herrera@example.com', FALSE),
('Samuel Parra', 'Cajero', '3800123456', 'samuel.parra@example.com', TRUE),
('Camila Peña', 'Vendedora', '3901234567', 'camila.pena@example.com', TRUE),
('Gabriel Castro', 'Promotor', '3002345678', 'gabriel.castro@example.com', TRUE),
('Juliana Romero', 'Asistente Administrativo', '3103456789', 'juliana.romero@example.com', FALSE),
('Rafael Medina', 'Encargado de Compras', '3204567890', 'rafael.medina@example.com', TRUE),
('Natalia Guzmán', 'Vendedora', '3305678901', 'natalia.guzman@example.com', TRUE),
('Esteban López', 'Cajero', '3406789012', 'esteban.lopez@example.com', TRUE),
('Diana Salazar', 'Jefe de Almacén', '3507890123', 'diana.salazar@example.com', FALSE),
('Hernán Ocampo', 'Auxiliar de Ventas', '3608901234', 'hernan.ocampo@example.com', FALSE),
('Sara Acosta', 'Asistente Contable', '3709012345', 'sara.acosta@example.com', FALSE),
('Luis Miguel Torres', 'Vendedor', '3800123456', 'luis.torres@example.com', TRUE),
('Karla Fernández', 'Cajera', '3901234567', 'karla.fernandez@example.com', FALSE),
('Felipe Alvarado', 'Gerente de Almacén', '3002345678', 'felipe.alvarado@example.com', FALSE),
('Vanessa Díaz', 'Promotora', '3103456789', 'vanessa.diaz@example.com', TRUE),
('Estefanía Gómez', 'Asistente de Compras', '3204567890', 'estefania.gomez@example.com', TRUE),
('Adriana Castillo', 'Vendedora', '3305678901', 'adriana.castillo@example.com', FALSE),
('Julián Reyes', 'Cajero', '3406789012', 'julian.reyes@example.com', FALSE),
('Sandra Ospina', 'Auxiliar de Almacén', '3507890123', 'sandra.ospina@example.com', FALSE),
('Camilo Ortega', 'Jefe de Ventas', '3608901234', 'camilo.ortega@example.com', FALSE),
('Mónica Castro', 'Asistente Administrativo', '3709012345', 'monica.castro@example.com', TRUE),
('Andrés Torres', 'Cajero', '3800123456', 'andres.torres@example.com', FALSE),
('Mariana Castaño', 'Vendedora', '3901234567', 'mariana.castano@example.com', FALSE),
('Carlos Alberto Pérez', 'Supervisor', '3002345678', 'carlos.perez@example.com', FALSE),
('Gisela Martínez', 'Asistente Contable', '3103456789', 'gisela.martinez@example.com', TRUE),
('Oswaldo Gómez', 'Jefe de Compras', '3204567890', 'oswaldo.gomez@example.com', FALSE),
('Paola Ramírez', 'Cajera', '3305678901', 'paola.ramirez@example.com', TRUE),
('Nicolás López', 'Vendedor', '3406789012', 'nicolas.lopez@example.com', FALSE);
-- Fin Inserciones Empleados

INSERT INTO Compra (Fecha_Compra, ID_Proveedor, ID_Empleado, Total)
VALUES
('2022-01-10', 1, 7, 120000.00),
('2022-02-15', 2, 12, 95000.50),
('2022-03-20', 3, 23, 200000.75),
('2022-04-05', 4, 33, 150000.00),
('2022-05-11', 5, 43, 85000.25),
('2022-06-18', 6, 7, 300000.00),
('2022-07-21', 7, 12, 110000.00),
('2022-08-30', 8, 23, 76000.40),
('2022-09-14', 9, 33, 180000.90),
('2022-10-02', 10, 43, 130000.00),
('2022-11-11', 11, 7, 70000.60),
('2022-12-20', 12, 12, 225000.10),
('2023-01-05', 13, 23, 145000.00),
('2023-02-18', 14, 33, 86000.30),
('2023-03-23', 15, 43, 280000.00),
('2023-04-17', 16, 7, 130000.00),
('2023-05-30', 17, 12, 75000.20),
('2023-06-12', 18, 23, 200000.80),
('2023-07-26', 19, 33, 160000.00),
('2023-08-08', 20, 43, 91000.50),
('2023-09-15', 1, 7, 90000.60),
('2023-10-21', 2, 12, 150000.00),
('2023-11-29', 3, 23, 90000.60),
('2023-12-10', 4, 33, 240000.00),
('2024-01-12', 5, 43, 100000.00),
('2024-02-19', 6, 7, 87000.40),
('2024-03-22', 7, 12, 250000.00),
('2024-04-05', 8, 23, 90000.00),
('2024-05-30', 9, 33, 210000.75),
('2024-06-12', 10, 43, 120000.00),
('2024-07-26', 11, 7, 98000.90),
('2024-08-19', 12, 12, 170000.00),
('2024-09-15', 13, 23, 88000.50),
('2024-10-21', 14, 33, 145000.00),
('2024-11-29', 15, 43, 110000.00),
('2024-12-10', 16, 7, 160000.00),
('2022-02-05', 17, 12, 75000.00),
('2022-03-15', 18, 23, 65000.00),
('2022-04-20', 19, 33, 130000.00),
('2022-05-25', 20, 43, 85000.00),
('2022-06-30', 1, 7, 210000.00),
('2022-07-14', 2, 12, 99000.00),
('2022-08-09', 3, 23, 92000.00),
('2022-09-19', 4, 33, 99000.00),
('2022-10-28', 5, 43, 140000.00),
('2022-11-15', 6, 7, 85000.00),
('2022-12-22', 7, 12, 225000.00),
('2023-01-05', 8, 23, 145000.00),
('2023-02-18', 9, 33, 86000.30),
('2023-03-23', 10, 43, 280000.00);
-- Fin Inserciones Compras

INSERT INTO Detalle_Compra (ID_Producto, ID_Compra, Cantidad, Precio_Unitario, Subtotal)
VALUES
(1, 1, 10, 12000.00, 120000.00),
(2, 1, 5, 19000.00, 95000.00),
(3, 2, 15, 6300.00, 94500.00),
(4, 2, 7, 10000.00, 70000.00),
(5, 3, 8, 21000.00, 168000.00),
(6, 3, 2, 16000.00, 32000.00),
(7, 4, 5, 3000.00, 15000.00),
(8, 4, 20, 10000.00, 200000.00),
(9, 5, 3, 22000.00, 66000.00),
(10, 5, 10, 8000.00, 80000.00),
(11, 6, 1, 45000.00, 45000.00),
(12, 6, 4, 7000.00, 28000.00),
(13, 7, 6, 3000.00, 18000.00),
(14, 7, 11, 15000.00, 165000.00),
(15, 8, 9, 18000.00, 162000.00),
(16, 8, 13, 8000.00, 104000.00),
(17, 9, 2, 70000.00, 140000.00),
(18, 9, 5, 15000.00, 75000.00),
(19, 10, 3, 40000.00, 120000.00),
(20, 10, 4, 25000.00, 100000.00),
(21, 11, 7, 9000.00, 63000.00),
(22, 11, 1, 30000.00, 30000.00),
(23, 12, 5, 5000.00, 25000.00),
(24, 12, 12, 6000.00, 72000.00),
(25, 13, 8, 15000.00, 120000.00),
(26, 13, 6, 3000.00, 18000.00),
(27, 14, 2, 80000.00, 160000.00),
(28, 14, 10, 3500.00, 35000.00),
(29, 15, 4, 7000.00, 28000.00),
(30, 15, 3, 50000.00, 150000.00),
(31, 16, 11, 20000.00, 220000.00),
(32, 16, 12, 2000.00, 24000.00),
(33, 17, 2, 9000.00, 27000.00),
(34, 17, 15, 5000.00, 75000.00),
(35, 18, 5, 18000.00, 90000.00),
(36, 18, 1, 15000.00, 15000.00),
(37, 19, 6, 60000.00, 360000.00),
(38, 19, 3, 12000.00, 36000.00),
(39, 20, 7, 30000.00, 60000.00),
(40, 20, 5, 50000.00, 250000.00),
(41, 21, 8, 20000.00, 200000.00),
(42, 21, 10, 10000.00, 100000.00),
(43, 22, 1, 4000.00, 4000.00),
(44, 22, 3, 40000.00, 120000.00),
(45, 23, 2, 8000.00, 16000.00),
(46, 23, 5, 10000.00, 100000.00),
(47, 24, 1, 2000.00, 2000.00),
(48, 24, 8, 6000.00, 48000.00),
(49, 25, 2, 50000.00, 100000.00),
(50, 25, 4, 15000.00, 60000.00);
-- Fin Inserciones Detalle_Compra

INSERT INTO Ventas (Fecha_venta, Descripcion, Total_Venta, ID_Cliente, ID_Medio, ID_Empleado)
VALUES
('2022-01-15', 'Venta de disfraces para fiesta', 200000.00, 1, 1, 2),
('2022-02-20', 'Compra de maquillaje y accesorios', 150000.00, 2, 2, 9),
('2022-03-10', 'Venta de pelucas y disfraces', 350000.00, 3, 1, 15),
('2022-04-05', 'Venta de productos de fiesta', 50000.00, 4, 1, 20),
('2022-05-12', 'Venta de artículos decorativos', 80000.00, 5, 3, 24),
('2022-06-08', 'Compra de maquillaje especial', 300000.00, 6, 2, 29),
('2022-07-15', 'Venta de disfraces de Halloween', 220000.00, 7, 1, 34),
('2022-08-25', 'Venta de cosméticos para fiesta', 60000.00, 8, 3, 40),
('2022-09-10', 'Venta de accesorios para fiestas', 95000.00, 9, 2, 45),
('2022-10-20', 'Compra de maquillajes artísticos', 120000.00, 10, 1, 30),
('2022-11-02', 'Venta de productos para eventos', 180000.00, 11, 1, 35),
('2022-12-15', 'Venta de regalos personalizados', 400000.00, 12, 2, 39),
('2023-01-11', 'Venta de disfraces y accesorios', 210000.00, 13, 3, 44),
('2023-02-19', 'Venta de productos decorativos', 35000.00, 14, 1, 8),
('2023-03-30', 'Compra de artículos de fiesta', 145000.00, 15, 2, 21),
('2023-04-14', 'Venta de maquillaje y disfraces', 270000.00, 16, 3, 32),
('2023-05-27', 'Venta de disfraces para niños', 180000.00, 17, 1, 2),
('2023-06-18', 'Compra de maquillaje para eventos', 310000.00, 18, 3, 9),
('2023-07-30', 'Venta de artículos de temporada', 90000.00, 19, 2, 15),
('2023-08-15', 'Venta de cosméticos exclusivos', 400000.00, 20, 1, 20),
('2023-09-05', 'Compra de disfraces de superhéroes', 250000.00, 21, 3, 24),
('2023-10-21', 'Venta de productos para fiestas', 50000.00, 22, 1, 29),
('2023-11-09', 'Venta de maquillaje y accesorios', 320000.00, 23, 2, 34),
('2023-12-02', 'Venta de disfraces de navidad', 150000.00, 24, 1, 40),
('2024-01-15', 'Venta de cosméticos para eventos', 60000.00, 25, 1, 45),
('2024-02-19', 'Venta de artículos decorativos', 80000.00, 26, 3, 30),
('2024-03-12', 'Compra de maquillaje y accesorios', 170000.00, 27, 2, 35),
('2024-04-28', 'Venta de productos de fiesta', 40000.00, 28, 1, 39),
('2024-05-09', 'Venta de disfraces de temporada', 90000.00, 29, 2, 44),
('2024-06-15', 'Venta de cosméticos especiales', 150000.00, 30, 1, 8),
('2024-07-10', 'Compra de artículos para eventos', 200000.00, 31, 3, 21),
('2024-08-22', 'Venta de disfraces y accesorios', 300000.00, 32, 2, 32),
('2024-09-05', 'Venta de maquillaje exclusivo', 250000.00, 33, 1, 2),
('2024-10-15', 'Compra de productos para fiestas', 60000.00, 34, 3, 9),
('2024-11-30', 'Venta de disfraces de halloween', 180000.00, 35, 2, 15),
('2024-12-18', 'Venta de productos decorativos', 130000.00, 36, 1, 20),
('2024-01-22', 'Venta de maquillaje y accesorios', 270000.00, 37, 3, 24),
('2024-02-11', 'Venta de cosméticos para fiesta', 49000.00, 38, 2, 29),
('2024-03-17', 'Venta de artículos decorativos', 85000.00, 39, 1, 34),
('2024-04-08', 'Venta de disfraces y maquillajes', 230000.00, 40, 3, 40),
('2024-05-19', 'Compra de productos de fiesta', 70000.00, 41, 1, 45),
('2024-06-22', 'Venta de cosméticos y accesorios', 90000.00, 42, 1, 30),
('2024-07-30', 'Venta de maquillaje para fiestas', 180000.00, 43, 3, 35),
('2024-08-15', 'Compra de artículos de decoración', 120000.00, 44, 2, 39),
('2024-09-25', 'Venta de disfraces de temporada', 160000.00, 45, 1, 44);
-- Fin Insercion Venta

INSERT INTO Detalle_Venta (ID_Venta, ID_Producto, Cantidad)
VALUES
(1, 1, 2),
(1, 2, 1),
(2, 3, 2),
(2, 4, 3),
(3, 5, 1),
(3, 6, 2),
(4, 7, 4),
(4, 8, 2),
(5, 9, 3),
(5, 10, 1),
(6, 11, 2),
(6, 12, 1),
(7, 13, 1),
(7, 14, 3),
(8, 15, 2),
(8, 16, 1),
(9, 17, 2),
(9, 18, 2),
(10, 19, 1),
(10, 20, 1),
(11, 21, 1),
(12, 22, 2),
(12, 23, 1),
(13, 24, 1),
(13, 25, 3),
(14, 26, 2),
(14, 27, 2),
(15, 28, 1),
(15, 29, 1),
(16, 30, 2),
(17, 31, 2),
(17, 32, 1),
(18, 33, 1),
(19, 34, 2),
(19, 35, 3),
(20, 36, 1),
(21, 37, 1),
(22, 38, 1),
(23, 39, 2),
(23, 40, 1),
(24, 41, 1),
(25, 42, 1),
(26, 43, 2),
(27, 44, 1),
(28, 45, 3),
(29, 46, 1),
(30, 47, 2),
(31, 48, 2),
(32, 49, 1),
(33, 50, 1),
(34, 1, 2),
(35, 2, 1),
(36, 3, 2),
(37, 4, 2),
(38, 5, 1),
(39, 6, 1),
(40, 7, 1),
(41, 8, 2),
(42, 9, 1),
(43, 10, 2),
(44, 11, 1),
(45, 12, 3);
-- Fin Inserciones Detalle_Venta

INSERT INTO Proveedor_Inventario (ID_Proveedor, ID_Inventario)
VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 4),
(2, 5),
(3, 6),
(3, 7),
(4, 8),
(4, 9),
(5, 10),
(5, 11),
(6, 12),
(7, 13),
(7, 14),
(8, 15),
(9, 16),
(10, 17),
(10, 18),
(11, 19),
(12, 20),
(12, 21),
(13, 22),
(14, 23),
(15, 24),
(16, 25),
(17, 26),
(18, 27),
(19, 28),
(20, 29),
(1, 30),
(2, 31),
(3, 32),
(4, 33),
(5, 34),
(6, 35),
(7, 36),
(8, 37),
(9, 38),
(10, 39),
(11, 40),
(12, 41),
(13, 42),
(14, 43),
(15, 44),
(16, 45),
(17, 46),
(18, 47),
(19, 48),
(20, 49),
(1, 50);


