SELECT 
    OrderID, OrderDate, ShippedDate, 
    DATEDIFF(ShippedDate, OrderDate) AS DaysToShip
FROM Orders
WHERE ShippedDate IS NOT NULL; 
