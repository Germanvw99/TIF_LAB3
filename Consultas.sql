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
GO


--CANTIDAD DE VENTAS DETALLADAS POR VENTA , CANTIDAD DE ARTÍCULOS COMPRADOS Y MONTO..

SELECT DTV_venta_codigo AS [VENTA] ,
COUNT(*) AS [Cantidad de Compras],
SUM(DTV_cantidad_unidades) AS [Total de Unidades], 
SUM(DTV_precio_unitario*DTV_cantidad_unidades) AS [MONTO]
FROM DetalleVenta GROUP BY DTV_venta_codigo
GO

--CANTIDAD DE UNIDADES VENDIDAS DE CADA ARTÍCULO, ORDENADAS DE MAYOR A MENOR ( MÁS DEMANDADA A LA MENOS DEMANDADA)

SELECT AXP_articulo_cod AS [CÓDIGO],A.ART_nombre AS [NOMBRE], AXP_salida AS [CANTIDAD VENDIDA] FROM Articulos_por_Proveedor AS AP INNER JOIN Articulos AS A
ON A.ART_codigo=AP.AXP_articulo_cod
ORDER BY AXP_salida DESC

GO