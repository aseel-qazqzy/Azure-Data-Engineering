select a.CustomerID, CONCAT(a.Title,'',a.FirstName,' ', NULLIF(a.MiddleName,''),a.LastName)
, b.TotalDue, b.STATUS, Rank() over(Partition by b.Status order by b.TotalDue DESC) AS Total_Rank
from SalesLT.Customer a
inner join SalesLT.SalesOrderHeader b
on a.CustomerID = b.CustomerID;

select DISTINCT Status
from SalesLT.SalesOrderHeader;

select a.CustomerID, b.SalesOrderID, CONCAT(a.Title,'',a.FirstName,' ', NULLIF(a.MiddleName,''),a.LastName)
, b.OrderQty,b.ProductID,
 SUM(OrderQty) over(Partition by a.CustomerID order by b.OrderQty DESC) AS Running_Qty_Total
from SalesLT.Customer a
inner join SalesLT.SalesOrderHeader h 
on a.CustomerID = h.CustomerID
inner join SalesLT.SalesOrderDetail b
on h.SalesOrderID = b.SalesOrderID;

select a.CustomerID,
 SUM(OrderQty)  AS Running_Qty_Total
from SalesLT.Customer a
inner join SalesLT.SalesOrderHeader h 
on a.CustomerID = h.CustomerID
inner join SalesLT.SalesOrderDetail b
on h.SalesOrderID = b.SalesOrderID
group by a.CustomerID;
