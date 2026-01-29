--===========================
--Análise de Desempenho
--===========================

-- Ranking de funcionários por vendas
-- Classificar funcionários de acordo com o faturamento gerado

SELECT 
    RANK() OVER (ORDER BY SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)) DESC) AS Posicao,
    e.FirstName + ' ' + e.LastName AS Funcionario,
    SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)) AS TotalVendido
FROM Employees e
INNER JOIN Orders o ON e.EmployeeID = o.EmployeeID
INNER JOIN [Order Details] od ON o.OrderID = od.OrderID
GROUP BY e.EmployeeID, e.FirstName, e.LastName;

--Eficiência de vendas por região
--Avaliar desempenho de vendas por país


SELECT 
    o.ShipCountry,
    SUM(od.UnitPrice * od.Quantity) AS TotalVendas,
    COUNT(DISTINCT o.OrderID) AS TotalPedidos
FROM Orders o
INNER JOIN [Order Details] od ON o.OrderID = od.OrderID
GROUP BY o.ShipCountry;