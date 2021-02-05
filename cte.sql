select customer_id , rental_date , rental_id ,
row_number() over (partition by customer_id order by rental_date)
from rental r;

create or replace view feature as 
	select r.customer_id, f.title, f.special_features 
	from rental r 
	inner join customer c on c.customer_id = r.customer_id
	inner join inventory i on i.inventory_id = r.inventory_id 
	inner join film f on f.film_id = f.film_id 
	
create materialized view customer_behind as 
select f.customer_id, count(f.title) as col 
from feature f
where 'Behind the Scenes' = any(f.special_features)
group by f.customer_id
with no data;

refresh materialized view customer_behind;


select title, special_features 
from film
where array_position(special_features, 'Behind the Scenes') is not null


select title, special_features 
from film
where special_features @> array['Behind the Scenes']


select title, special_features 
from film
where special_features && array['Behind the Scenes']




