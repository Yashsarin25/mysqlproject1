-- First and most recent purchases for various customers 
SELECT CustomerID,MIN(cast(TransactionDate as date)) AS FirstPurchase ,MAX(cast(TransactionDate as date)) AS LastPurchase,
MAX(cast(TransactionDate as date)) - MIN(cast(TransactionDate as date)) AS DaysBetweenPurchases
FROM sales_transaction
GROUP BY CustomerID
HAVING MAX(cast(TransactionDate as date)) - MIN(cast(TransactionDate as date)) >0
ORDER BY DaysBetweenPurchases DESC;




-- Segmenting the customers and counting frequency of each segment 
SELECT CustomerSegment, count(*)
FROM
(select cp.CustomerID,CASE WHEN SUM(st.QuantityPurchased) BETWEEN 1 AND 10 THEN 'Low'
 WHEN SUM(st.QuantityPurchased) BETWEEN 11 AND 30 THEN 'Med'
  WHEN SUM(st.QuantityPurchased) > 30  THEN 'High' END as CustomerSegment
from customer_profiles as cp join sales_transaction as st on st.CustomerID = cp.CustomerID
GROUP BY cp.CustomerID) AS T
GROUP BY CustomerSegment