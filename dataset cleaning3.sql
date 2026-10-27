-- Fixing column name 
alter table customer_profiles 
rename column ï»¿CustomerID to CustomerID;

-- Finding nulls and substitute with a common value 
select count(*)
from customer_profiles 
where CustomerID IS NULL OR Age IS NULL OR Gender IS NULL OR Location IS NULL OR JoinDate IS NULL;


-- Cleaning nulls 
update customer_profiles
set CustomerID = 'unknown'
where CustomerID IS NULL;

update customer_profiles
set Age = 'unknown'
where Age IS NULL;

update customer_profiles
set Gender = 'unknown'
where Gender IS NULL;

update customer_profiles
set Location = 'unknown'
where Location is null ;

update customer_profiles
set JoinDate = 'unknown'
where JoinDate is null;

select * from customer_profiles;






-- Fixing datatype for date column 
alter table sales
add column TransactionDate_Updated date;

update sales 
set TransactionDate_Updated = cast(TransactionDate as date);

select * from sales 