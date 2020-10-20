/* Lab 20 Oct. | SQL SELF & CROSS JOIN */

-- Get all pairs of actors that worked together.

select a1.actor_id as actor1, a2.actor_id as actor2 
from sakila.film_actor as a1
join sakila.film_actor as a2 on a2.film_id=a1.film_id 
and a1.actor_id<a2.actor_id
group by a1.actor_id, a2.actor_id ; 

***

-- Get all pairs of customers that have rented the same film more than 3 times.

select r.customer_id, i.film_id, count(i.film_id) as count_f 
from sakila.rental as r
join sakila.inventory as i on i.inventory_id=r.inventory_id
group by i.film_id, r.customer_id
having count_f>2;

-- other way : 
select inventory.film_id, rental.customer_id, count(rental.rental_id)
from rental, inventory
where inventory.inventory_id=rental.inventory_id
group by inventory.film_id, rental.customer_id
having count(rental.rental_id)>2;

***

-- Get all possible pairs of actors and films.

select a2.film_id, a5.title, a1.actor_id, concat(a1.first_name,' ',a1.last_name) as actor1, 
a4.actor_id, concat(a4.first_name,' ',a4.last_name) as actor2
from actor a1
join film_actor a2
on a1.actor_id = a2.actor_id
join film_actor a3
on a3.film_id=a2.film_id 
and a3.actor_id!=a2.actor_id
join actor a4
on a4.actor_id=a3.actor_id
join film a5
on a5.film_id=a2.film_id
order by a2.film_id, a5.title, a1.actor_id, a4.actor_id ;
