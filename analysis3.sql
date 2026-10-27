-- Analysis of least sold products 
SELECT ProductID, SUM(QuantityPurchased) AS TotalUnitsSold
FROM sales_transaction
GROUP BY ProductID
HAVING TotalUnitsSold >=1
ORDER BY TotalUnitsSold 
LIMIT 10;  




-- Analysis of daily purchase frequency and revenue generated 
SELECT TransactionDate_Updated AS DATETRANS,COUNT(*) AS Transaction_Count,SUM(QuantityPurchased) AS TotalUnitsSold,
SUM(QuantityPurchased*Price) AS TotalSales 
FROM sales 
GROUP BY  TransactionDate_Updated 
ORDER BY DATETRANS DESC;



















