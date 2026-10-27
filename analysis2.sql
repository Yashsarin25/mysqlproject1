-- Fixing column name 
select * from product_inventory;

alter table product_inventory
rename column ï»¿ProductID to ProductID;


-- Category wise volume sold and revenue generated 
SELECT pi.Category, SUM(st.QuantityPurchased) as TotalUnitsSold, SUM(st.QuantityPurchased*st.Price) as TotalSales
FROM sales_transaction AS st  join product_inventory AS pi ON pi.ProductID = st.ProductID
GROUP BY pi.Category
ORDER BY TotalSales DESC;




-- Top 10 revenue generating products 
SELECT ProductID,SUM(QuantityPurchased*Price) AS TotalRevenue
FROM sales_transaction
GROUP BY ProductID
ORDER BY TotalRevenue DESC 
LIMIT 10;









