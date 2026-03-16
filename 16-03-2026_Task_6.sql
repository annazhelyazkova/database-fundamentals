SELECT 
    COUNT(*) AS TotalOrders,
    SUM(CASE WHEN DAYOFWEEK(OrderDate) IN (1, 2, 3, 4, 5) THEN 1 ELSE 0 END) AS WeekendOrders,
    ROUND((SUM(CASE WHEN DAYOFWEEK(OrderDate) IN  (1, 2, 3, 4, 5) THEN 1 ELSE 0 END) / COUNT(*)) * 100,2) AS WeekendSharePercentage
FROM Orders;