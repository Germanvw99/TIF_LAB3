USE Lab3TIF
GO

--AGREGAR CLIENTES
CREATE PROCEDURE spAgregarCliente
@CLI_cuit INT,
@CLI_usu_id INT,
@CLI_dni VARCHAR(25),
@CLI_username VARCHAR(50),
@CLI_contrasenia VARCHAR(50)
AS
DECLARE @perfil int
SELECT @perfil=USU_perfil_cod FROM Usuarios WHERE USU_id=@CLI_usu_id
IF @perfil=2
	BEGIN
		INSERT INTO Clientes(CLI_cuit,CLI_usu_id,CLI_dni,CLI_username,CLI_contrasenia)
		SELECT @CLI_cuit,@CLI_usu_id,@CLI_dni,@CLI_username,@CLI_contrasenia
	END
ELSE PRINT 'Tipo de usuario incorrecto'
GO

-- AGREGAR PERSONAL
CREATE PROCEDURE spAgregarPersonal
@PER_usu_id INT,
@PER_dni VARCHAR(25),
@PER_username VARCHAR(50),
@PER_contrasenia VARCHAR(50)
AS 
DECLARE @perfil int
SELECT @perfil=USU_perfil_cod FROM Usuarios WHERE USU_id=@PER_usu_id
IF @perfil=1
	BEGIN
		INSERT INTO Personal(PER_usu_id,PER_dni,PER_username,PER_contrasenia)
		SELECT @PER_usu_id,@PER_dni,@PER_username,@PER_contrasenia
	END
ELSE PRINT 'Tipo de usuario incorrecto'
GO

--AGREGAR DETALLEVENTA

CREATE PROCEDURE spAgregarDetalleVenta
@DTV_venta_codigo INT,
@DTV_articulo_cod INT,
@DTV_cantidad_unidades INT
AS
	-- Se obtiene el cuit proveniente del proveedor que despacha el producto ingresado, 1 producto solo puede ser dado por un único proveedor.
	DECLARE @cuitdelproveedor int
	SELECT @cuitdelproveedor=AXP_prov_cuit from Articulos_por_Proveedor WHERE AXP_articulo_cod=@DTV_articulo_cod
	INSERT INTO DetalleVenta(DTV_venta_codigo,DTV_prov_cuit,DTV_articulo_cod,DTV_cantidad_unidades)
	SELECT @DTV_venta_codigo,@cuitdelproveedor,@DTV_articulo_cod,@DTV_cantidad_unidades
GO


-- AGREGAR PROVINCIAS
CREATE PROCEDURE spAgregarProvincias(
@PROV_nombre VARCHAR(50)
)
AS
	INSERT INTO Provincias(PROV_nombre)
	VALUES(@PROV_nombre)
GO

-- EDITAR PROVINCIAS
CREATE PROCEDURE spEditarProvincias(
@PROV_nombre VARCHAR(50),
@PROV_codigo INT
)
AS
UPDATE Provincias
SET
	PROV_nombre=@PROV_nombre
WHERE
	PROV_codigo= @PROV_codigo
GO

-- AGREGAR ESTADOS
CREATE PROCEDURE spAgregarEstados(
@EST_nombre VARCHAR(25)
)
AS
	INSERT INTO Estados(EST_nombre)
	VALUES(@EST_nombre)
GO

-- EDITAR ESTADOS
CREATE PROCEDURE spEditarEstados(
@EST_nombre VARCHAR(50),
@EST_codigo INT
)
AS
UPDATE Estados
SET
	EST_nombre=@EST_nombre
WHERE
	EST_codigo= @EST_codigo
GO

-- AGREGAR PERFILES
CREATE PROCEDURE spAgregarPerfiles(
@PER_nombre VARCHAR(25)
)
AS
	INSERT INTO Perfiles(PER_nombre)
	VALUES(@PER_nombre)
GO

-- EDITAR PERFILES
CREATE PROCEDURE spEditarPerfiles(
@PER_nombre VARCHAR(50),
@PER_codigo INT
)
AS
UPDATE Perfiles
SET
	PER_nombre=@PER_nombre
WHERE
	PER_codigo= @PER_codigo
GO

-- AGREGAR MEDIOS DE PAGO
CREATE PROCEDURE spAgregarMedios_de_Pago(
@MDP_nombre VARCHAR(50),
@MDP_otros_detalles VARCHAR(100)
)
AS
	INSERT INTO Medios_de_Pago(MDP_nombre,MDP_otros_detalles,MDP_estado_cod)
	VALUES(@MDP_nombre,@MDP_otros_detalles,2)
GO

-- EDITAR MEDIOS DE PAGO
CREATE PROCEDURE spEditarMedios_de_Pago(
@MDP_codigo INT,
@MDP_nombre VARCHAR(50),
@MDP_otros_detalles VARCHAR(100),
@MDP_estado_cod INT
)
AS
UPDATE Medios_de_Pago
SET
	MDP_nombre=@MDP_nombre,
	MDP_otros_detalles=@MDP_otros_detalles,
	MDP_estado_cod=@MDP_estado_cod
WHERE
	MDP_codigo= @MDP_codigo
GO


-- AGREGAR RECEPCION DE ARTICULO
CREATE PROCEDURE spAgregarRecepcion_Articulos(
@RECART_per_cod INT,
@RECART_prov_cuit INT
)
AS 
	INSERT INTO Recepcion_Articulos(RECART_per_cod,RECART_prov_cuit,RECART_fecha,RECART_estado_cod)
	VALUES(@RECART_per_cod,@RECART_prov_cuit,getdate(),2)
GO

-- EDITAR RECEPCION DE ARTICULO
CREATE PROCEDURE spEditarRecepcion_Articulos(
@RECART_codigo INT,
@RECART_per_cod INT,
@RECART_prov_cuit INT,
@RECART_fecha SMALLDATETIME,
@RECART_estado_cod INT
)
AS 
UPDATE Recepcion_Articulos
SET
	RECART_per_cod=@RECART_per_cod,
	RECART_prov_cuit=@RECART_prov_cuit,
	RECART_fecha=@RECART_fecha,
	RECART_estado_cod=@RECART_estado_cod
WHERE
	RECART_codigo=@RECART_codigo
GO

-- AGREGAR USUARIO
CREATE PROCEDURE spAgregarUsuarios(
@USU_perfil_cod INT,
@USU_nombre VARCHAR(50),
@USU_apellido VARCHAR(50),
@USU_telefono VARCHAR(50),
@USU_email VARCHAR(50),
@USU_direccion VARCHAR(50),
@USU_ciudad VARCHAR(50),
@USU_provincia_cod INT,
@USU_ruta_img VARCHAR(100)
)
AS 
	INSERT INTO Usuarios(USU_perfil_cod,USU_nombre,USU_apellido,USU_telefono,USU_email,USU_direccion,USU_ciudad,USU_provincia_cod,USU_ruta_img,USU_estado_cod)
	VALUES(@USU_perfil_cod,@USU_nombre,@USU_apellido,@USU_telefono,@USU_email,@USU_direccion,@USU_ciudad,@USU_provincia_cod,@USU_ruta_img,2)
GO

-- EDITAR USUARIO
CREATE PROCEDURE spEditarUsuarios(
@USU_id INT,
@USU_perfil_cod INT,
@USU_nombre VARCHAR(50),
@USU_apellido VARCHAR(50),
@USU_telefono VARCHAR(50),
@USU_email VARCHAR(50),
@USU_direccion VARCHAR(50),
@USU_ciudad VARCHAR(50),
@USU_provincia_cod INT,
@USU_ruta_img VARCHAR(100),
@USU_estado_cod INT
)
AS
UPDATE USUARIOS
	SET USU_perfil_cod=@USU_perfil_cod,
	USU_nombre=@USU_nombre,
	USU_apellido=@USU_apellido,
	USU_telefono=@USU_telefono,
	USU_email=@USU_email,
	USU_direccion=@USU_direccion,
	USU_ciudad=@USU_ciudad,
	USU_provincia_cod=@USU_provincia_cod,
	USU_ruta_img=@USU_ruta_img,
	USU_estado_cod=@USU_estado_cod
	WHERE USU_id=@USU_id
GO

-- BAJA USUARIO
CREATE PROCEDURE spBajaUsuario
(
	@USU_id INT,
	@USU_estado_cod INT
)
AS
UPDATE USUARIOS
SET
	USU_estado_cod=@USU_estado_cod
WHERE
	USU_id=@USU_id
GO

-- AGREGAR MARCA
CREATE PROCEDURE spAgregarMarca
(
	@MAR_nombre VARCHAR(255),
	@MAR_descripcion VARCHAR,
	@MAR_ruta_imagen VARCHAR,
	@MAR_estado_cod INT
)
AS
INSERT INTO Marcas
(
	MAR_nombre,
	MAR_descripcion,
	MAR_ruta_imagen,
	MAR_estado_cod
)
VALUES
(
	@MAR_nombre,
	@MAR_descripcion,
	@MAR_ruta_imagen,
	@MAR_estado_cod
)
GO

-- MODIFICAR MARCA
CREATE PROCEDURE spModificarMarca
(
	@MAR_codigo INT,
	@MAR_nombre VARCHAR(255),
	@MAR_descripcion VARCHAR,
	@MAR_ruta_imagen VARCHAR,
	@MAR_estado_cod INT
)
AS
UPDATE Marcas
SET
	MAR_nombre=@MAR_nombre,
	MAR_descripcion=@MAR_descripcion,
	MAR_ruta_imagen=@MAR_ruta_imagen,
	MAR_estado_cod=@MAR_estado_cod
WHERE
	MAR_codigo= @MAR_codigo
GO

-- DAR DE BAJA MARCA
CREATE PROCEDURE spBajaMarca
(
	@MAR_codigo INT,
	@MAR_estado_cod INT
)
AS
UPDATE Marcas
SET
	MAR_estado_cod=@MAR_estado_cod
WHERE
	MAR_codigo= @MAR_codigo
GO

-- AGREGAR CATEGORIA
CREATE PROCEDURE spAgregarCategoria
(
	@CAT_nombre VARCHAR(255),
	@CAT_descripcion VARCHAR(255),
	@CAT_ruta_imagen VARCHAR(255),
	@CAT_estado_cod INT
)
AS
INSERT INTO Categorias
(
	CAT_nombre,
	CAT_descripcion,
	CAT_ruta_imagen,
	CAT_estado_cod
)
VALUES
(
	@CAT_nombre,
	@CAT_descripcion,
	@CAT_ruta_imagen,
	@CAT_estado_cod
)
GO

-- MODIFICAR CATEGORIA
CREATE PROCEDURE spModificarCategoria
(
	@CAT_codigo INT,
	@CAT_nombre VARCHAR(255),
	@CAT_descripcion VARCHAR(255),
	@CAT_ruta_imagen VARCHAR(255),
	@CAT_estado_cod INT
)
AS
UPDATE Categorias
SET
	CAT_nombre=@CAT_nombre,
	CAT_descripcion=@CAT_descripcion,
	CAT_ruta_imagen=@CAT_ruta_imagen,
	CAT_estado_cod=@CAT_estado_cod
WHERE
	CAT_codigo=@CAT_codigo
GO

-- DAR DE BAJA CATEGORIA
CREATE PROCEDURE spBajaCategoria
(
	@CAT_codigo INT,
	@CAT_estado_cod INT
)
AS
UPDATE Categorias
SET
	CAT_estado_cod=@CAT_estado_cod
WHERE
	CAT_codigo=@CAT_codigo
GO

-- AGREGAR ARTICULO
CREATE PROCEDURE spAgregarArticulo
(
	@ART_marca_cod INT,
	@ART_categoria_cod INT,
	@ART_nombre VARCHAR(255),
	@ART_descripcion VARCHAR(255),
	@ART_punto_pedido INT,
	@ART_precio_lista DECIMAL(18,2),
	@ART_ruta_imagen VARCHAR(255),
	@ART_estado_cod INT
)
AS
INSERT INTO Articulos
(
	ART_marca_cod,
	ART_categoria_cod,
	ART_nombre,
	ART_descripcion,
	ART_punto_pedido,
	ART_precio_lista,
	ART_ruta_imagen,
	ART_estado_cod
)
VALUES
(
	@ART_marca_cod,
	@ART_categoria_cod,
	@ART_nombre,
	@ART_descripcion,
	@ART_punto_pedido,
	@ART_precio_lista,
	@ART_ruta_imagen,
	@ART_estado_cod
)
GO

-- MODIFICAR ARTICULO
CREATE PROCEDURE spModificarArticulo
(
	@ART_codigo INT,
	@ART_marca_cod INT,
	@ART_categoria_cod INT,
	@ART_nombre VARCHAR(255),
	@ART_descripcion VARCHAR(255),
	@ART_punto_pedido INT,
	@ART_precio_lista DECIMAL(18,2),
	@ART_ruta_imagen VARCHAR(255),
	@ART_estado_cod INT
)
AS
UPDATE Articulos
SET
	ART_marca_cod=@ART_marca_cod,
	ART_categoria_cod=@ART_categoria_cod,
	ART_nombre=@ART_nombre,
	ART_descripcion=@ART_descripcion,
	ART_punto_pedido=@ART_punto_pedido,
	ART_precio_lista=@ART_precio_lista,
	ART_ruta_imagen=@ART_ruta_imagen,
	ART_estado_cod=@ART_estado_cod
WHERE ART_codigo=@ART_codigo
GO

-- DAR DE BAJA ARTICULO
CREATE PROCEDURE spBajaArticulo (
    @ART_codigo INT,
	@ART_estado_cod INT
  )
AS 
UPDATE Articulos 
SET 
  ART_estado_cod = @ART_estado_cod 
WHERE 
  ART_codigo = @ART_codigo
GO


-- ACTUALIZA ARTICULOS_POR_PROVEEDOR EN CASO DE REALIZARSE UN
-- CONTROL DE INVENTARIOS --NO ES LO MISMO QUE UN TRIGGER--
CREATE PROCEDURE spActualizarStock
(
@AXP_prov_cuit INT,
@AXP_articulo_cod INT,
@AXP_entrada INT,
@AXP_salida INT,
@AXP_precio_unitario  DECIMAL(18,2)
)
AS
	IF EXISTS (SELECT * FROM Articulos_por_Proveedor WHERE AXP_prov_cuit=@AXP_prov_cuit AND AXP_articulo_cod=@AXP_articulo_cod)
	BEGIN
		IF EXISTS (SELECT * FROM Articulos_por_Proveedor WHERE AXP_stock_actual >= @AXP_salida)
			BEGIN
				UPDATE Articulos_por_Proveedor
				SET
				AXP_entrada=@AXP_entrada,
				AXP_salida=@AXP_salida,
				AXP_precio_unitario =@AXP_precio_unitario ,
				AXP_stock_anterior=AXP_stock_actual,
				AXP_stock_actual=AXP_stock_actual+@AXP_entrada-@AXP_salida
				WHERE AXP_prov_cuit=@AXP_prov_cuit
				AND AXP_articulo_cod=@AXP_articulo_cod
			END
		END
	ELSE
	BEGIN
		INSERT INTO Articulos_por_Proveedor(AXP_prov_cuit,AXP_articulo_cod,AXP_precio_unitario ,AXP_stock_actual,AXP_entrada)
		VALUES(@AXP_prov_cuit,@AXP_articulo_cod,@AXP_precio_unitario ,@AXP_entrada,@AXP_entrada)
	END
GO

CREATE PROCEDURE spAgregarEstado
(
@codigoestado int ,
@nombreestado varchar (25)
)
AS
	INSERT INTO Estados(EST_codigo,EST_nombre)
	VALUES(@codigoestado,@nombreestado)
GO

CREATE PROCEDURE spAgregarProveedor
(
@cuit int,
@usuarioid int,
@razonsocial varchar (50),
@nombredecontacto varchar (50)
)
AS
DECLARE @perfil int
SELECT @perfil=USU_perfil_cod FROM Usuarios WHERE USU_id=@usuarioid
IF @perfil=3
	BEGIN
		INSERT INTO Proveedores(PROV_cuit,PROV_usu_id,PROV_razon_social,PROV_nombre_contacto)
		VALUES(@cuit,@usuarioid,@razonsocial,@nombredecontacto)
	END
ELSE PRINT 'Tipo de usuario incorrecto'
GO

CREATE PROCEDURE spAgregarVenta
(
@cuitcliente int,
@mediodepago int,
@codigodeestado int
)
AS
DECLARE @date smalldatetime
SET @date=getdate()
INSERT INTO Ventas(VEN_cli_cuit,VEN_medio_pago_cod,VEN_fecha,VEN_fecha_requerida,VEN_fecha_envio,VEN_codigo_estado)
VALUES(@cuitcliente ,@mediodepago,@date,@date,null,@codigodeestado )
GO


CREATE PROCEDURE spAgregarDetalleRecepcionDeArticulos
(
@codigo int,
@codigodearticulo int,
@cantidaddeunidades int,
@preciounitario decimal (18,2)
)
AS
	-- Se obtiene el cuit proveniente del producto ingresado, 1 producto solo puede ser dado por un único proveedor.
	DECLARE @cuitdeproveedor int,@cuitrecepcion int
	SELECT @cuitdeproveedor=AXP_prov_cuit from Articulos_por_Proveedor WHERE AXP_articulo_cod=@codigodearticulo
	-- Se compara el cuit del proveedor para que este corresponda con el de la recepcion general.
	SELECT @cuitrecepcion=RECART_prov_cuit from Recepcion_Articulos WHERE RECART_codigo=@codigo

	-- Validacion
	IF(@cuitrecepcion=@cuitdeproveedor)
	BEGIN
		INSERT INTO DetalleRecepcion_Articulos(DRECART_codigo,DRECART_prov_cuit,DRECART_articulo_cod,DRECART_cantidad_unidades,DRECART_precio_unitario)
		VALUES(@codigo ,@cuitdeproveedor ,@codigodearticulo ,@cantidaddeunidades ,@preciounitario)
	END
	ELSE PRINT 'El artículo ingresado no pertenece al proveedor de cuit '+ CAST(@cuitrecepcion AS VARCHAR)+'.'
GO

CREATE PROCEDURE spAgregarArt_Prov
(
@AXP_prov_cuit int,
@AXP_articulo_cod int
)
AS
INSERT INTO Articulos_por_Proveedor(AXP_prov_cuit,AXP_articulo_cod,AXP_stock_actual,AXP_stock_anterior,AXP_entrada,AXP_salida,AXP_precio_unitario)
VALUES(@AXP_prov_cuit,@AXP_articulo_cod,0,0,0,0,0)
GO