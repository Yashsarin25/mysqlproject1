-- To identify duplicate records and clean 
select TransactionID,COUNT(*) 
FROM sales_transaction
group by TransactionID
having COUNT(*)>1;


create table sales as 
(select distinct * from sales_transaction);

drop table sales_transaction;

alter table sales rename to sales_transaction;

select * from sales_transaction;



-- Identify discrepancies and clean them 
select TransactionID,st.price as TransactionPrice,pi.price as InventoryPrice
from product_inventory as pi join  sales_transaction as st on pi.ProductID = st.ProductID
where pi.price != st.price;

update product_inventory as pi join  sales_transaction as st on pi.ProductID = st.ProductID
set  st.price = pi.price;

select * from sales_transaction;

