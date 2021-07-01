USE Lab3TIF
GO

-- PROVINCIAS
BEGIN
EXEC spAgregarProvincias 'Buenos Aires'
EXEC spAgregarProvincias 'Capital Federal'
EXEC spAgregarProvincias 'Catamarca'
EXEC spAgregarProvincias 'Chaco'
EXEC spAgregarProvincias 'Chubut'
EXEC spAgregarProvincias 'Córdoba'
EXEC spAgregarProvincias 'Corrientes'
EXEC spAgregarProvincias 'Entre Ríos'
EXEC spAgregarProvincias 'Formosa'
EXEC spAgregarProvincias 'Jujuy'
EXEC spAgregarProvincias 'La Pampa'
EXEC spAgregarProvincias 'La Rioja'
EXEC spAgregarProvincias 'Mendoza'
EXEC spAgregarProvincias 'Misiones'
EXEC spAgregarProvincias 'Neuquén'
EXEC spAgregarProvincias 'Río Negro'
EXEC spAgregarProvincias 'Salta'
EXEC spAgregarProvincias 'San Juan'
EXEC spAgregarProvincias 'San Luis'
EXEC spAgregarProvincias 'Santa Cruz'
EXEC spAgregarProvincias 'Santa Fe'
EXEC spAgregarProvincias 'Santiago del Estero'
EXEC spAgregarProvincias 'Tierra del Fuego'
EXEC spAgregarProvincias 'Tucumán'
END

-- ESTADOS
BEGIN
EXEC spAgregarEstados 'Baja'
EXEC spAgregarEstados 'Alta'
END

-- INSERTS PERFILES
BEGIN 
EXEC spAgregarPerfiles 'Personal'
EXEC spAgregarPerfiles 'Clientes'
EXEC spAgregarPerfiles 'Proveedores'
END

-- MEDIOS DE PAGO
BEGIN
EXEC spAgregarMedios_de_Pago 'Efectivo','Método de pago en efectivo'
EXEC spAgregarMedios_de_Pago 'Débito','Método de pago a través de tarjeta de débito'
EXEC spAgregarMedios_de_Pago 'Crédito','Método de pago a través de tarjeta de crédito'
END

-- USUARIOS
EXEC spAgregarUsuarios 2,'German','Vazquez','12345','email@mail.com','Direccion','Ciudad',1,'img.com'


EXEC spAgregarUsuarios 1,'Antonio Jose','Salazar','011 3817-7518','neippuharonnoi-2953@yopmail.com','Moreno 3653','Lomas del Mirador',1,'img.com'
EXEC spAgregarUsuarios 1,'Tania','Pellicer','011 6356-9715','fodettaummuja-9696@yopmail.com','Larrea 1325','Villa Del Parque',1,'img.com'

EXEC spAgregarUsuarios 3,'Otilia','Prada','011 4641-1359','neippuharonnoi-2953@yopmail.com','Sanicolas  526','La Rioja',12,'img.com'
EXEC spAgregarUsuarios 3,'Laura','Maria Cuellar','011 4922-4801','bruxoyaralau-4667@yopmail.com','General Pico','General Pico',11,'img.com'
EXEC spAgregarUsuarios 3,'Gracia','Herrera','011 2107-5861','priboikosibro-4325@yopmail.com','Alsina 520','Morón',1,'img.com'

--CLIENTES
EXEC spAgregarCliente 123,1,'94758321',german,147

--PERSONAL
EXEC spAgregarPersonal 2,'14247851','Personal1','123' 
EXEC spAgregarPersonal 3,'47852963','Personal2','321'

--PROVEDORES

EXEC spAgregarProveedor 27590848,4,'Samsonite','Roque Gaspar'
EXEC spAgregarProveedor 27839721,5,'Amec','Manuel Clemente'
EXEC spAgregarProveedor 24385038,6,'Lenovo','Arsenio Gonzalo'


-- CATEGORIAS
INSERT INTO Categorias (CAT_nombre,CAT_descripcion,CAT_ruta_imagen,CAT_estado_cod)
SELECT 'Cámaras y Accesorios','Descubrí miles de productos','Imagenes/categorias/camaras-y-accesorios.png',2 UNION
SELECT 'Celulares y Teléfonos','Encontrá lo mejor en smartphones','Imagenes/categorias/celulares-y-telefonos.png',2 UNION
SELECT 'Computación','Todo para armar tu Home Office','Imagenes/categorias/computacion.png',2 UNION
SELECT 'Consolas y Videojuegos','Lo mejor del mundo gamer','Imagenes/categorias/consolas-y-videojuegos.png',2 UNION
SELECT 'Electrónica Audio y Video','Encontrá lo mejor en electrónica','Imagenes/categorias/electronica-audio-y-video.png',2 UNION
SELECT 'Herramientas','Hacé realidad tus proyectos','Imagenes/categorias/herramientas.png',2 UNION
SELECT 'Televisores','Viví tu entretenimiento con los mejores TV','Imagenes/categorias/televisores.png',2
GO

-- MARCAS
INSERT INTO Marcas (MAR_nombre,MAR_descripcion,MAR_ruta_imagen,MAR_estado_cod)
SELECT 'ActiVision','','Imagenes/marcas/ActiVision.png',2 UNION
SELECT 'Admiral','One Touch','Imagenes/marcas/Admiral.png',2 UNION
SELECT 'Alcatel','','Imagenes/marcas/Alcatel.png',2 UNION
SELECT 'AMD','','Imagenes/marcas/AMD.png',2 UNION
SELECT 'Apple','Piensa diferente','Imagenes/marcas/Apple.png',2 UNION
SELECT 'Atma','','Imagenes/marcas/Atma.png',2 UNION
SELECT 'Benro','','Imagenes/marcas/Benro.png',2 UNION
SELECT 'BGH','','Imagenes/marcas/BGH.png',2 UNION
SELECT 'Black & Decker','','Imagenes/marcas/Black & Decker.png',2 UNION
SELECT 'BlackBerry','','Imagenes/marcas/BlackBerry.png',2 UNION
SELECT 'Bosch','','Imagenes/marcas/Bosch.png',2 UNION
SELECT 'Canon','','Imagenes/marcas/Canon.png',2 UNION
SELECT 'Celestron','','Imagenes/marcas/Celestron.png',2 UNION
SELECT 'Corsair','','Imagenes/marcas/Corsair.png',2 UNION
SELECT 'Dell','','Imagenes/marcas/Dell.png',2
GO

--ARTICULOS
INSERT INTO Articulos (ART_marca_cod,ART_categoria_cod,ART_nombre,ART_descripcion,ART_punto_pedido,ART_precio_lista,ART_ruta_imagen,ART_estado_cod) 
SELECT 1,7,'Smart TV BGH','Dimensiones: 96.8cm de ancho,56.8cm de alto,7.8cm de profundidad',4,'41999.00','Imagenes/articulos/5.png',2 UNION
SELECT 2,2,'Moto G9 Power','Con la pantalla Max Vision HD+ de 6.8"',12,'35999.00','Imagenes/articulos/10.png',2 UNION
SELECT 3,7,'Smart TV Noblex','Su resolución es 4K',5,'81499.00','Imagenes/articulos/1.png',2 UNION
SELECT 4,2,'Nokia 23 M','Memoria interna de 32GB. Apto para tarjeta SD de 512GB',12,'15999.00','Imagenes/articulos/6.png',2 UNION
SELECT 5,2,'Philco P241','Memoria interna de 512MB. Apto para tarjeta SD de 64GB',8,'9599.00','Imagenes/articulos/11.png',2 UNION
SELECT 6,6,'Taladro eléctrico percutor Philco','Velocidad mínima de rotación: 3000rpm.',20,'9212.00','Imagenes/articulos/12.png',2 UNION
SELECT 7,7,'Smart TV Philips','Con YouTube,Netflix,Web browser.',3,'43999.00','Imagenes/articulos/3.png',2 UNION
SELECT 8,2,'Samsung Galaxy A52','Tiene 4 cámaras traseras de 64Mpx/12Mpx/5Mpx/5Mpx.',8,'55999.00','Imagenes/articulos/7.png',2 UNION
SELECT 9,2,'Samsung Galaxy Note20','Pantalla Dynamic AMOLED 2X de 6.9',2,'155999.00','Imagenes/articulos/9.png',2 UNION
SELECT 10,7,'Smart TV Samsung','Tecnología HDR para una calidad de imagen mejorada.',3,'75999.00','Imagenes/articulos/2.png',2 UNION
SELECT 11,7,'Smart TV TCL','Con función Screen Share',6,'32999.00','Imagenes/articulos/4.png',2 UNION
SELECT 12,2,'Xiaomi Poco X3','Dispositivo liberado para que elijas la compañía telefónica que prefieras',3,'61200.00','Imagenes/articulos/8.png',2
GO