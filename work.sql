select city, count(city) 
from airports_data ad 
group by city
having count(city)>1 


select distinct(a.city) 
from airports a
join flights f on f.departure_airport = a.airport_code 
join aircrafts_data ad on ad.aircraft_code = f.aircraft_code 
where ad."range" = (select max(range) 
from aircrafts_data ad)

select f.flight_id 
from flights f 
order by f.actual_departure - f.scheduled_departure
limit 10

//3
select *
from bookings b 
left join tickets t on t.book_ref = b.book_ref 
left join ticket_flights tf on tf.ticket_no = t.ticket_no 
left join boarding_passes bp on bp.ticket_no = t.ticket_no 
where boarding_no = null
// Нет

 //4
select a.model, round(cast(count(a.model) as decimal)/(select count(f.flight_no)
from flights f), 2) as percentage
from aircrafts a 
join flights f on f.aircraft_code = a.aircraft_code 
group by a.model


//6
with business as (
	select f.flight_id, min(tf.amount) as minBus
	from flights f 
	join ticket_flights tf on tf.flight_id = f.flight_id
	group by f.flight_id, tf.fare_conditions 
	having tf.fare_conditions = 'Business'),
economy as (
	select f.flight_id, max(tf.amount) as maxEco
	from flights f 
	join ticket_flights tf on tf.flight_id = f.flight_id
	group by f.flight_id, tf.fare_conditions 
	having tf.fare_conditions = 'Economy'),
city as (
	select f.flight_id as id, ad.city  
	from flights f 
	join airports_data ad on ad.airport_code = f.arrival_airport)
select c.city, b.minBus - e.maxeco as difference
from business b
join economy e on e.flight_id = b.flight_id 
join city c on c.id = b.flight_id
where  b.minBus - e.maxeco < 0;


with ports as (
	select f.arrival_airport as ar, f.departure_airport as dep, ad.coordinates as co1, ad2.coordinates as co2, ad3."range" as maxDis
	from flights f
	join airports_data ad on ad.airport_code = f.departure_airport 
	join airports_data ad2 on ad2.airport_code = f.arrival_airport
	join aircrafts_data ad3 on ad3.aircraft_code = f.aircraft_code)
select acos(sin(co1[0])*sin(co2[0]) + cos(co1[0])*cos(co2[0])*cos(co1[1] - co2[1]))*6371 as distance, ar, dep, maxDis
from ports p

with ports as (
	select f.arrival_airport as ar, f.departure_airport as dep, ad.coordinates as co1, ad2.coordinates as co2, ad3."range" as maxDis
	from flights f
	join airports_data ad on ad.airport_code = f.departure_airport 
	join airports_data ad2 on ad2.airport_code = f.arrival_airport
	join aircrafts_data ad3 on ad3.aircraft_code = f.aircraft_code)
select co1, co2
from ports p






