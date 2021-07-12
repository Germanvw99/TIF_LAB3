USE Lab3TIF
GO


--Trigger que pone el precio del artículo “automáticamente”.

CREATE TRIGGER TR_InsertPrecio_DV
on DetalleVenta
after INSERT
as
BEGIN
  
  --SE INSERTA PRECIO DEL ARTÍCULO

  DECLARE @precio decimal(18,2),@cart int,@cven int, @cantComprar int
  SELECT @cart=DTV_articulo_cod, @cven=DTV_venta_codigo, @cantComprar=DTV_cantidad_unidades FROM inserted
  SELECT @precio= ART_precio_lista FROM Articulos WHERE ART_codigo=@cart
  UPDATE DetalleVenta SET DTV_precio_unitario=@precio WHERE DTV_venta_codigo=@cven and DTV_articulo_cod=@cart
  
  --SE ACTUALIZA  EL TOTAL DE LA FACTURA DE LA VENTA 
  
  UPDATE Ventas SET VEN_total_facturado=VEN_total_facturado+@precio*@cantComprar WHERE VEN_codigo=@cven

END
GO

--TRIGGER PARA ACTUALIZAR EL STOCK CUANDO SE VENDE UN PRODUCTO

CREATE TRIGGER TR_ActualizarStock
ON DetalleVenta
AFTER INSERT
AS
	BEGIN
	DECLARE @Cart int, @CantCompr int, @stock int 
	SELECT @CantCompr=DTV_cantidad_unidades,@Cart=DTV_articulo_cod FROM inserted
	SELECT @stock=AXP_stock_actual FROM Articulos_por_Proveedor WHERE AXP_articulo_cod=@Cart

IF(@CantCompr<=@stock)

	UPDATE Articulos_por_Proveedor SET AXP_stock_actual=@stock-@CantCompr,AXP_stock_anterior=@stock,AXP_salida=@CantCompr WHERE AXP_articulo_cod=@Cart

ELSE

ROLLBACK

END
GO

CREATE TRIGGER REESTABLECER_IDENTITY
ON Recepcion_Articulos
AFTER INSERT
AS

BEGIN

DBCC CHECKIDENT ('DetalleRecepcion_Articulos', reseed,0);

END
GO

CREATE TRIGGER TR_ObtenerPrecioAxP
ON Articulos_por_Proveedor
AFTER INSERT
AS
	BEGIN
		DECLARE @precio decimal(18,2),@Cart int,@CAxP int
		SELECT @Cart=AXP_articulo_cod, @CAxP=AXP_codigo FROM inserted
		SELECT @precio=ART_precio_lista FROM Articulos WHERE ART_codigo=@Cart

		-- Settea el precio obtenido de la tabla artículos

		UPDATE Articulos_por_Proveedor SET AXP_precio_unitario=@precio WHERE AXP_codigo=@CAxP
	END
GO

CREATE TRIGGER TR_ActualizarRecepcion
ON DetalleRecepcion_Articulos
AFTER INSERT
AS
	BEGIN
		DECLARE @CodRecepcion int,@CodArt int,@CantRecibida int,@Stock_ant int,@Precio decimal(18,2)
		SELECT @CodRecepcion=DRECART_codigo,@CodArt=DRECART_articulo_cod,@CantRecibida=DRECART_cantidad_unidades, @Precio=DRECART_precio_unitario FROM inserted
		SELECT @Stock_ant=AXP_stock_anterior FROM Articulos_por_Proveedor WHERE AXP_articulo_cod=@CodArt

		-- Actualiza el valor del stock al ingresar un artículo
		UPDATE Articulos_por_Proveedor SET AXP_stock_actual+=@CantRecibida,AXP_stock_anterior=@Stock_ant,AXP_entrada=@CantRecibida WHERE AXP_articulo_cod=@CodArt

		-- Actualiza el valor total del registro Recepcion_Artículo
		UPDATE Recepcion_Articulos SET RECART_total_facturado+=@CantRecibida*@Precio WHERE RECART_codigo=@CodRecepcion
	END
GO