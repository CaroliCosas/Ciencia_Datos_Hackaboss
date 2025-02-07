-- ### Ejercicios 01: Subqueries

/*
1. Encontrar el cliente que ha alquilado más películas.

2. Encontrar la categoría con más películas.

3. Encontrar la tienda con más ingresos.

4. Encontrar la película más alquilada.

5. Encontrar el actor que ha aparecido en más películas.
*/

-- 1. Encontrar el cliente que ha alquilado más películas.

-- opcion 1
use sakila;
select * from sakila.customer
where customer_id = (
SELECT customer_id FROM sakila.rental
group by customer_id
order by count(customer_id) desc limit 1)

-- opcion 2
use sakila;
select c.customer_id, c.first_name, c.last_name, total_rentals
from customer c join (
select r.customer_id, count(r.rental_id) as total_rentals
from rental r 
group by r.customer_id 
order by count(r.rental_id) desc limit 1

) as subquery on c.customer_id = subquery.customer_id;


-- 2. Encontrar la categoría con más películas.

-- opcion1
select * from category
where category_id = (
SELECT category_id FROM film_category
group by category_id
order by count(category_id) desc limit 1);

-- opcion2
select c.category_id, c.name, total_films
from category c join (

select category_id, count(*) as total_films
from film_category 
group by category_id
order by total_films desc limit 1

) as subquery on c.category_id = subquery.category_id;




-- 3. Encontrar la tienda con más ingresos.





-- 4. Encontrar la película más alquilada.






-- 5. Encontrar el actor que ha aparecido en más películas.
