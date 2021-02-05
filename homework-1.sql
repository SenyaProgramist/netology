select * from customer where active = 0 ;
select * from film where release_year = 2006 ;
select * from payment order by payment_date desc limit 10;

select tc.table_name , tc.constraint_name 
from information_schema.table_constraints tc
where tc.constraint_type = 'PRIMARY KEY' and tc.constraint_schema = 'dvd-rental'

select tc.table_name, tc.constraint_name 
from information_schema.table_constraints tc
where tc.constraint_type = 'PRIMARY KEY' and constraint_catalog = 'dvdrental'




