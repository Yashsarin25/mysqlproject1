-- Analysing low frequency but high value customers 
SELECT CustomerID, COUNT(*) AS NumberOfTransactions,SUM(QuantityPurchased*Price) AS TotalSpent
FROM sales_transaction 
GROUP BY CustomerID
HAVING NumberOfTransactions<=2
ORDER BY NumberOfTransactions ASC, TotalSpent DESC;




-- Most puchased products by each customers 
SELECT CustomerID,ProductID,COUNT(*) AS TimesPurchased
FROM sales_transaction
GROUP BY CustomerID,ProductID
HAVING TimesPurchased>1
ORDER BY TimesPurchased DESC;