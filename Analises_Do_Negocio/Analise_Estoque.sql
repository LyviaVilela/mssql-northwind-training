--===========================
--Análise de Estoque
--===========================

--Produtos com estoque crítico 
--Produtos que precisam de reposição urgente

SELECT ProductName, UnitsInStock
FROM Products
WHERE UnitsInStock <= ReorderLevel;

--Produtos sem vendas
--Identificar produtos que não geraram vendas

SELECT 
    p.ProductID,
    p.ProductName,
    p.UnitsInStock,
    p.UnitPrice
FROM Products p
WHERE NOT EXISTS (
    SELECT 1
    FROM [Order Details] od
    WHERE p.ProductID = od.ProductID
);

--Valor total de estoque por categoria
--Calcular o valor financeiro do estoque agrupado por categoria

SELECT 
    c.CategoryName,
    SUM(p.UnitPrice * p.UnitsInStock) AS ValorTotalEstoque
FROM Products p
INNER JOIN Categories c ON p.CategoryID = c.CategoryID
GROUP BY c.CategoryName;
