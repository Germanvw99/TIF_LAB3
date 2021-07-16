--Consultas

--los artículos mayores de una determinada cantidad en stock.

SELECT ART_nombre AS 'Artículo',
Articulos_por_Proveedor.AXP_stock_actual AS 'Stock'
FROM Articulos_por_Proveedor
INNER JOIN Articulos ON Articulos.ART_codigo = Articulos_por_Proveedor.AXP_codigo
WHERE Articulos_por_Proveedor.AXP_stock_actual > 1000
GO


-- o con un procedimiento almacenado

CREATE PROCEDURE ArticulosMayorStock
@stock INT
AS
SELECT ART_nombre AS 'Artículo',
Articulos_por_Proveedor.AXP_stock_actual AS 'Stock'
FROM Articulos_por_Proveedor
INNER JOIN Articulos ON Articulos.ART_codigo = Articulos_por_Proveedor.AXP_codigo
WHERE Articulos_por_Proveedor.AXP_stock_actual > @stock
GO

EXEC ArticulosMayorStock 1000


--MOSTRAR CANTIDAD DE VENTAS REALIZADAS POR CUIT DE CLIENTE
select distinct CLI_username AS Cliente ,COUNT(*) AS Cantidad_de_ventas_asociadas from Ventas
inner join Clientes
on CLI_cuit=VEN_cli_cuit
group by CLI_username



-- DETALLE DE VENTA DE UNA FACTURA DADA
SELECT SUM(DTV_precio_unitario * DTV_cantidad_unidades) AS 'Total Parcial',
art_nombre 'Nombre Artículo',
DTV_cantidad_unidades 'Unidades',
DTV_precio_unitario 'Precio'
FROM DetalleVenta
INNER JOIN articulos on DTV_articulo_cod = ART_codigo
WHERE DTV_venta_codigo = 2
GROUP BY art_nombre,DTV_articulo_cod,DTV_cantidad_unidades,DTV_precio_unitario

-- O CON UN PROCEDIMIENTO ALMACENADO
CREATE PROCEDURE DetalleVentaPorFactura
@CodFactura INT
AS
SELECT SUM(DTV_precio_unitario * DTV_cantidad_unidades) AS 'Total Parcial',
art_nombre 'Nombre Artículo',
DTV_cantidad_unidades 'Unidades',
DTV_precio_unitario 'Precio'
FROM DetalleVenta
INNER JOIN articulos on DTV_articulo_cod = ART_codigo
WHERE DTV_venta_codigo = @CodFactura
GROUP BY art_nombre,DTV_articulo_cod,DTV_cantidad_unidades,DTV_precio_unitario
GO

EXEC DetalleVentaPorFactura 2