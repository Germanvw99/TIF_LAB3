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
