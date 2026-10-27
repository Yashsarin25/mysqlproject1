-- Month on month growth rate analysis 
SELECT MONTH(TransactionDate_Updated) AS month, round(SUM(QuantityPurchased*Price),2) AS total_sales,LAG(round(SUM(QuantityPurchased*Price),2)) OVER(ORDER BY  MONTH(TransactionDate_Updated) ASC) AS previous_month_sales,
round(cast(round(SUM(QuantityPurchased*Price),2) - LAG(round(SUM(QuantityPurchased*Price),2)) OVER(ORDER BY  MONTH(TransactionDate_Updated) ASC) AS FLOAT) / LAG(round(SUM(QuantityPurchased*Price),2)) OVER(ORDER BY  MONTH(TransactionDate_Updated) ASC) *100,2) as mom_growth_percentage

FROM sales
GROUP BY MONTH(TransactionDate_Updated);




-- Identifing top spending customers 
SELECT CustomerID, COUNT(*) AS NumberOfTransactions, SUM(QuantityPurchased*Price) AS TotalSpent 
FROM sales_transaction
GROUP BY CustomerID
HAVING  NumberOfTransactions>10 AND TotalSpent >1000
ORDER BY TotalSpent  DESC;