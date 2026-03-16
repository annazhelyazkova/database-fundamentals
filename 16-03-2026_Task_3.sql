SELECT 
    YEAR(FirstOrderDate) AS JoinYear,
    QUARTER(FirstOrderDate) AS JoinQuater,
    COUNT(CustomerID) AS NewCustomersCount
FROM (
	SELECT CustomerId, MIN(OrderDate) As FirstOrderDate
	FROM Orders
	GROUP BY CustomerID
) AS CustomerJoins
GROUP BY JoinYear, JoinQuater
ORDER BY JoinYear, JoinQuater;