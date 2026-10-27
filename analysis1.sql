-- Analysis of volume sold and revenue generated 
select ProductID,SUM(QuantityPurchased) as TotalUnitsSold,SUM(QuantityPurchased*Price) as TotalSales
 FROM sales_transaction
 group by ProductID
 order by  TotalSales desc;
 
 


-- Analysis of purchase frequency 
SELECT CustomerID,COUNT(*) AS NumberOfTransactions
FROM sales_transaction
GROUP BY  CustomerID
ORDER BY NumberOfTransactions desc; 



 