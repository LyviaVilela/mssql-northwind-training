--===========================
--Análise de Clientes
--===========================

--Clientes com maior volume de compras
--Clientes que mais geraram faturamento

SELECT 
    c.ContactName,
    SUM(od.UnitPrice * od.Quantity) AS TotalGasto
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
LEFT JOIN [Order Details] od ON o.OrderID = od.OrderID
GROUP BY c.ContactName
ORDER BY TotalGasto DESC;

--Segmentação de clientes por valor
--Classificar clientes de acordo com o total gasto

SELECT 
    c.ContactName,
    SUM(od.UnitPrice * od.Quantity) AS TotalGasto,
    CASE 
        WHEN SUM(od.UnitPrice * od.Quantity) >= 50000 THEN 'Alto Valor'
        WHEN SUM(od.UnitPrice * od.Quantity) >= 20000 THEN 'Médio Valor'
        ELSE 'Baixo Valor'
    END AS Segmento
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
LEFT JOIN [Order Details] od ON o.OrderID = od.OrderID
GROUP BY c.ContactName;

--Análise geográfica de clientes
--Identificar a distribuição de clientes por país

SELECT Country, COUNT(*) AS TotalClientes
FROM Customers
GROUP BY Country
ORDER BY TotalClientes DESC;