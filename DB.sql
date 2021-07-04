/* CREA DB */
CREATE DATABASE Lab3TIF
GO

USE Lab3TIF
GO

/* TABLA ESTADOS */
CREATE TABLE Estados(
	EST_codigo INT IDENTITY(1,1) NOT NULL,
	EST_nombre VARCHAR(25) NOT NULL,
	CONSTRAINT PK_Estados PRIMARY KEY (EST_codigo)
 )
GO

/* TABLA PERFILES */
CREATE TABLE Perfiles(
	PER_codigo INT IDENTITY(1,1) NOT NULL,
	PER_nombre VARCHAR(25) NOT NULL,
	CONSTRAINT PK_Perfiles PRIMARY KEY (PER_codigo)
)
GO

/* TABLA PROVINCIAS */
CREATE TABLE Provincias(
	PROV_codigo INT IDENTITY(1,1) NOT NULL,
	PROV_nombre VARCHAR(50) NOT NULL,
	CONSTRAINT PK_Provincias PRIMARY KEY (PROV_codigo)
)
GO

/* MEDIOS DE PAGO */
CREATE TABLE Medios_de_Pago(
	MDP_codigo INT IDENTITY(1,1) NOT NULL,
	MDP_nombre VARCHAR(50) NOT NULL,
	MDP_otros_detalles VARCHAR(100) NULL,
	MDP_estado_cod INT NOT NULL,
	CONSTRAINT PK_Medios_de_pago PRIMARY KEY (MDP_codigo),
	CONSTRAINT FK_Medios_de_pago_Estados FOREIGN KEY (MDP_estado_cod) REFERENCES Estados(EST_codigo)
)
GO

/* TABLA USUARIOS */
CREATE TABLE Usuarios(
	USU_id INT IDENTITY(1,1) NOT NULL,
	USU_perfil_cod INT NOT NULL,
	USU_nombre VARCHAR(50) NOT  NULL,
	USU_apellido VARCHAR(50) NOT  NULL,
	USU_telefono VARCHAR(50) NOT  NULL,
	USU_email VARCHAR(50) NOT  NULL,
	USU_direccion VARCHAR(50) NOT  NULL,
	USU_ciudad VARCHAR(50) NOT NULL,
	USU_provincia_cod INT NOT NULL,
	USU_ruta_img VARCHAR(100) NOT  NULL,
	USU_estado_cod INT NULL,
	CONSTRAINT PK_Usuarios PRIMARY KEY (USU_id),
	CONSTRAINT FK_Usuarios_Perfiles FOREIGN KEY (USU_perfil_cod) REFERENCES Perfiles(PER_codigo),
	CONSTRAINT FK_Usuarios_Estados FOREIGN KEY (USU_estado_cod) REFERENCES Estados(EST_codigo),
	CONSTRAINT FK_Usuarios_Provincias FOREIGN KEY (USU_provincia_cod) REFERENCES Provincias(PROV_codigo)
)
GO

/* TABLA PROVEEDORES */
CREATE TABLE Proveedores(
	PROV_cuit INT NOT NULL,
	PROV_usu_id INT NOT NULL,
	PROV_razon_social VARCHAR(50) NOT NULL,
	PROV_nombre_contacto VARCHAR(50) NOT NULL,
	CONSTRAINT PK_Proveedores PRIMARY KEY (PROV_cuit),
	CONSTRAINT FK_Proveedores_Usuarios FOREIGN KEY (PROV_usu_id) REFERENCES Usuarios(USU_id),
)
GO

/* TABLA PERSONAL */
CREATE TABLE Personal(
	PER_codigo INT IDENTITY(1,1) NOT NULL,
	PER_usu_id INT NOT NULL,
	PER_dni VARCHAR(25) NOT NULL,
	PER_username VARCHAR(50) NOT NULL,
	PER_contrasenia VARCHAR(50) NOT NULL,
	CONSTRAINT PK_Personal PRIMARY KEY (PER_codigo),
	CONSTRAINT FK_Personal_Usuarios FOREIGN KEY (PER_usu_id) REFERENCES Usuarios(USU_id),
)
GO

/* TABLA PERSONAL */
CREATE TABLE Clientes(
	CLI_cuit INT NOT NULL,
	CLI_usu_id INT NOT NULL,
	CLI_dni VARCHAR(25) NOT NULL,
	CLI_username VARCHAR(50) NOT NULL,
	CLI_contrasenia VARCHAR(50) NOT NULL,
	CONSTRAINT PK_Clientes PRIMARY KEY (CLI_cuit),
	CONSTRAINT FK_Clientes_Usuarios FOREIGN KEY (CLI_usu_id) REFERENCES Usuarios(USU_id),
)
GO

/* TABLA MARCAS */
CREATE TABLE Marcas(
	MAR_codigo INT IDENTITY(1,1) NOT NULL,
	MAR_nombre VARCHAR(255) NOT NULL,
	MAR_descripcion VARCHAR(100) NULL,
	MAR_ruta_imagen VARCHAR(100) NULL,
	MAR_estado_cod INT NULL,
	CONSTRAINT PK_Marcas PRIMARY KEY (MAR_codigo),
	CONSTRAINT FK_Marcas_Estado FOREIGN KEY (MAR_estado_cod) REFERENCES Estados(EST_codigo)
)
GO

/* TABLA CATEGORIAS */
CREATE TABLE Categorias(
	CAT_codigo INT IDENTITY(1,1) NOT NULL,
	CAT_nombre VARCHAR(50) NOT NULL,
	CAT_descripcion VARCHAR(100) NULL,
	CAT_ruta_imagen VARCHAR(100) NULL,
	CAT_estado_cod INT NULL,
	CONSTRAINT PK_Categorias PRIMARY KEY (CAT_codigo),
	CONSTRAINT FK_Categorias_Estado FOREIGN KEY (CAT_estado_cod) REFERENCES Estados(EST_codigo)
 )
GO

/* TABLA ARTICULOS */
CREATE TABLE Articulos(
	ART_codigo INT IDENTITY(1,1) NOT NULL,
	ART_marca_cod INT NOT NULL,
	ART_categoria_cod INT NOT NULL,
	ART_nombre VARCHAR(50) NOT NULL,
	ART_descripcion VARCHAR(150) NOT NULL,
	ART_punto_pedido INT NOT NULL,
	ART_precio_lista DECIMAL(18,2) DEFAULT 0.00,
	ART_ruta_imagen VARCHAR(100) NULL,
	ART_estado_cod INT NULL,
	CONSTRAINT PK_Articulos PRIMARY KEY (ART_codigo),
	CONSTRAINT FK_Articulos_Marcas FOREIGN KEY (ART_marca_cod) REFERENCES Marcas(MAR_codigo),
	CONSTRAINT FK_Articulos_Categorias FOREIGN KEY (ART_categoria_cod) REFERENCES Categorias(CAT_codigo),
	CONSTRAINT FK_Articulos_Estado FOREIGN KEY (ART_estado_cod) REFERENCES Estados(EST_codigo) 
)
GO	

/* TABLA ARTICULOS POR PROVEEDORES */
CREATE TABLE Articulos_por_Proveedor(
	AXP_codigo INT IDENTITY(1,1) NOT NULL,
	AXP_prov_cuit INT NOT NULL,
	AXP_articulo_cod INT NOT NULL,
	AXP_stock_actual INT NOT NULL DEFAULT 0,
	AXP_stock_anterior INT NOT NULL DEFAULT 0,
	AXP_entrada INT NOT NULL DEFAULT 0,
	AXP_salida INT NOT NULL DEFAULT 0,
	AXP_precio_unitario DECIMAL(18,2) DEFAULT (0.00),
	CONSTRAINT PK_Articulos_por_Proveedor PRIMARY KEY (AXP_codigo),
	CONSTRAINT FK_Articulos_por_Proveedor_Articulos FOREIGN KEY (AXP_articulo_cod) REFERENCES Articulos(ART_codigo),
	CONSTRAINT FK_Articulos_por_Proveedor_Proveedores FOREIGN KEY (AXP_prov_cuit) REFERENCES Proveedores(PROV_cuit)
)
GO

/* TABLA VENTAS*/
CREATE TABLE Ventas(
	VEN_codigo INT IDENTITY(1,1) NOT NULL,
	VEN_cli_cuit INT NOT NULL,
	VEN_medio_pago_cod INT NOT NULL,
	VEN_fecha SMALLDATETIME NOT NULL,
	VEN_fecha_requerida SMALLDATETIME NULL,
	VEN_fecha_envio SMALLDATETIME NULL,
	VEN_total_facturado DECIMAL(18,2) DEFAULT (0.00),
	VEN_codigo_estado INT NULL,
	CONSTRAINT PK_Ventas PRIMARY KEY (VEN_codigo),
	CONSTRAINT FK_Ventas_Clientes FOREIGN KEY (VEN_cli_cuit) REFERENCES Clientes(CLI_cuit),
	CONSTRAINT FK_Ventas_Medios_de_Pago FOREIGN KEY (VEN_medio_pago_cod) REFERENCES Medios_de_Pago(MDP_codigo),
	CONSTRAINT FK_Ventas_codigo_estado FOREIGN KEY (VEN_codigo_estado) REFERENCES Estados(EST_codigo)
)
GO

/* TABLA DETALLES DE VENTA */
CREATE TABLE DetalleVenta(
	DTV_venta_codigo INT NOT NULL,
	DTV_prov_cuit INT NOT NULL,
	DTV_articulo_cod INT NOT NULL,
	DTV_cantidad_unidades INT NULL,
	DTV_precio_unitario DECIMAL(18,2) DEFAULT (0.00),
	CONSTRAINT PK_DetalleVenta PRIMARY KEY (DTV_venta_codigo, DTV_articulo_cod),
	CONSTRAINT FK_DetalleVenta_Ventas FOREIGN KEY (DTV_venta_codigo) REFERENCES Ventas(VEN_codigo),
	CONSTRAINT FK_DetalleVenta_Proveedores FOREIGN KEY (DTV_prov_cuit) REFERENCES Proveedores(PROV_cuit),
	CONSTRAINT FK_DetalleVenta_Articulos FOREIGN KEY (DTV_articulo_cod) REFERENCES Articulos(ART_codigo)
)
GO

/* TABLA RECEPCION ARTICULOS*/
CREATE TABLE Recepcion_Articulos(
	RECART_codigo INT IDENTITY(1,1) NOT NULL,
	RECART_per_cod INT NOT NULL,
	RECART_prov_cuit INT NOT NULL,
	RECART_fecha SMALLDATETIME NOT NULL,
	RECART_total_facturado DECIMAL(18,2) DEFAULT (0.00),
	RECART_estado_cod INT NOT NULL,
	CONSTRAINT PK_Recepcion_Articulos PRIMARY KEY (RECART_codigo),
	CONSTRAINT FK_Recepcion_Articulos_Personal FOREIGN KEY (RECART_per_cod) REFERENCES Personal(PER_codigo),
	CONSTRAINT FK_Recepcion_Articulos_Proveedores FOREIGN KEY (RECART_prov_cuit) REFERENCES Proveedores(PROV_cuit),
	CONSTRAINT FK_Recepcion_Articulos_Estados FOREIGN KEY (RECART_estado_cod) REFERENCES Estados(EST_codigo)
)
GO

/* TABLA DETALLES RECEPCION ARTICULOS */
CREATE TABLE DetalleRecepcion_Articulos(
	DRECART_codigo INT NOT NULL,
	DRECART_prov_cuit INT NOT NULL,
	DRECART_articulo_cod INT NOT NULL,
	DRECART_cantidad_unidades INT NULL,
	DRECART_precio_unitario DECIMAL(18,2) DEFAULT (0.00),
	DRECART_numero_de_linea INT IDENTITY (1,1),
	CONSTRAINT PK_DetalleRecepcion_Articulos PRIMARY KEY (DRECART_codigo, DRECART_numero_de_linea),
	CONSTRAINT FK_DetalleRecepcion_Articulos_Recepcion_Articulos FOREIGN KEY (DRECART_codigo) 
		REFERENCES Recepcion_Articulos(RECART_codigo),
	CONSTRAINT FK_DetalleRecepcion_Articulos_Articulos FOREIGN KEY (DRECART_articulo_cod) REFERENCES Articulos(ART_codigo)
)
GO