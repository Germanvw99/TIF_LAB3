USE Lab3TIF
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
CREATE PROCEDURE spEditarMedios_de_Pag(
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
@RECART_prov_cuit INT,
@RECART_fecha SMALLDATETIME
)
AS 
	INSERT INTO Recepcion_Articulos(RECART_per_cod,RECART_prov_cuit,RECART_fecha,RECART_estado_cod)
	VALUES(@RECART_per_cod,@RECART_prov_cuit,@RECART_fecha,2)
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
		INSERT INTO Articulos_por_Proveedor
		(
		AXP_prov_cuit,
		AXP_articulo_cod,
		AXP_precio_unitario ,
		AXP_stock_actual,
		AXP_entrada
		)
		VALUES
		(
		@AXP_prov_cuit,
		@AXP_articulo_cod,
		@AXP_precio_unitario ,
		@AXP_entrada,
		@AXP_entrada
		)
	END
GO



