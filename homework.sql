select c.store_id, count(distinct customer_id) as customer_n
from customer c 
group by c.store_id 
having count(distinct customer_id) > 300

select c.customer_id , ct.city 
from customer c 
left join address adr on c.address_id  = adr.address_id 
left join city ct on ct.city_id = adr.city_id 


select count(distinct fa.actor_id)
from film_actor fa 
left join film f3 on f3.film_id = fa.film_id 
where fa.film_id in (
select f2.film_id 
from film f2 
where f2.rental_rate = 2.99);

select s.first_name , s.last_name, s2.store_id, ct.city 
from staff s
left join store s2 on s2.store_id = s.staff_id 
left join address a on s2.address_id = a.address_id 
left join city ct on ct.city_id = a.city_id 
where s2.store_id = 
(
select c.store_id
from customer c 
group by c.store_id 
having count(distinct customer_id) > 300);









