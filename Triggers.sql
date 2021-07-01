USE Lab3TIF
GO


--Trigger que pone el precio del artículo “automáticamente”.

CREATE TRIGGER TR_InsertPrecio_DV
on DetalleVenta
after INSERT
as
BEGIN
  DECLARE @precio decimal(18,2),@cart int,@cven int
  SELECT @cart=DTV_articulo_cod, @cven=DTV_venta_codigo FROM inserted
  select @precio= ART_precio_lista from Articulos where ART_codigo=@cart
  UPDATE DetalleVenta set DTV_precio_unitario=@precio where DTV_venta_codigo=@cven and DTV_articulo_cod=@cart
END
go
