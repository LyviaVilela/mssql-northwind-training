--===========================
--Análise de Vendas
--===========================

--Faturamento mensal e anual
--Avaliar faturamento e volume de vendas ao longo do tempo

SELECT 
   YEAR(o.OrderDate) AS Ano,
   MONTH(o.OrderDate) AS Mes,
   SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)) AS Faturamento
FROM Orders o
INNER JOIN [Order Details] od ON o.OrderID = od.OrderID
GROUP BY YEAR(o.OrderDate), MONTH(o.OrderDate)
ORDER BY Ano, Mes;

--Tendência de vendas ao longo do tempo
--Avaliar o volume de produtos vendidos ao longo do tempo

SELECT 
    YEAR(o.OrderDate) AS Ano,
    MONTH(o.OrderDate) AS Mes,
    SUM(od.Quantity) AS TotalVendido
FROM Orders o
INNER JOIN [Order Details] od ON o.OrderID = od.OrderID
GROUP BY YEAR(o.OrderDate), MONTH(o.OrderDate)
ORDER BY Ano, Mes;

--Top 10 produtos mais vendidos
--Produtos que geram maior faturamento

SELECT TOP 10
    RANK() OVER (ORDER BY SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)) DESC) AS Posicao,
    p.ProductName,
    SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)) AS TotalVendido
FROM Products p
INNER JOIN [Order Details] od ON p.ProductID = od.ProductID
GROUP BY p.ProductName
ORDER BY TotalVendido DESC;

