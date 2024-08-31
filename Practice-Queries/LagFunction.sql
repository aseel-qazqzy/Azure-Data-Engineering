
-- Lag function
select SalesOrderID,
Lag(TotalDue) OVER(ORDER BY OrderDate) as 'Total Previous day'
from SalesLT.SalesOrderHeader;

-- Compare the TotalDue 
select SalesOrderID,
Lag(TotalDue) over(order by OrderDate) as 'Total Day before',
TotalDue - lag(TotalDue) over(order by OrderDate) as 'Daily_change'
from salesLT.SalesOrderHeader

Select SalesOrderID,
Lag(TotalDue) over(order by OrderDate) as 'Total Day before',
TotalDue - lag(TotalDue) over(order by OrderDate) as 'Daily_change',
((TotalDue - lag(TotalDue) over(order by OrderDate)) * 100) / lag(TotalDue) over(order by OrderDate) as 'Daily Percentage Change'
from salesLT.SalesOrderHeader;



Select SalesOrderID,
Lag(TotalDue) over(order by OrderDate) as 'Total Day before',
TotalDue - lag(TotalDue) over(order by OrderDate) as 'Daily_change',
((TotalDue - lag(TotalDue) over(order by OrderDate)) * 100) / lag(TotalDue) over(partition by CustomerID order by OrderDate) as 'Daily Percentage Change'
from salesLT.SalesOrderHeader;

select SalesOrderID, OrderDate,
Lag(TotalDue) OVER(ORDER BY OrderDate) as 'Total Previous day'
from SalesLT.SalesOrderHeader;

select CustomerID, OrderDate,day(OrderDate), Month(OrderDate), year(OrderDate)
from SalesLT.SalesOrderHeader
order by CustomerID;


Select CustomerID, TotalDue,
Lag(TotalDue) over(order by OrderDate) as 'Total Day before',
TotalDue - lag(TotalDue) over(order by OrderDate) as 'Daily_change',
((TotalDue - lag(TotalDue) over(order by OrderDate)) * 100) / lag(TotalDue) over(partition by CustomerID order by OrderDate) as 'Daily Percentage Change'
from salesLT.SalesOrderHeader

order by CustomerID;

Select ProductID, OrderQty,
LEAD(orderQty) over (Order by ProductID) as 'Next Order Quantity',
Lag(orderQty) over (Order by ProductID) as 'Previous Order Quantity'
from [SalesLT].[SalesOrderDetail];


select CustomerID, Month(OrderDate), year(OrderDate)
from SalesLT.SalesOrderHeader;