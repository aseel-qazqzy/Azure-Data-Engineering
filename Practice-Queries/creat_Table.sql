select ProductID, OrderQty,
SUM(OrderQty) OVER (PARTITION BY ProductID) As 'Total order Quantity'
from SalesLT.SalesOrderDetail

;



select ProductID, OrderQty,
SUM(OrderQty)  As 'Total order Quantity'
from SalesLT.SalesOrderDetail
group by ProductID, OrderQty

;
