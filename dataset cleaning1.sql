select ï»¿TransactionID  from sales_transaction;

alter table sales_transaction 
rename column  ï»¿TransactionID to TransactionID;

select TransactionID from sales_transaction;