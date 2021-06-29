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
	INSERT INTO Recepcion_Articulos(RECART_per_cod,RECART_prov_cuit,RECART_fecha)
	VALUES(@RECART_per_cod,@RECART_prov_cuit,@RECART_fecha)
GO