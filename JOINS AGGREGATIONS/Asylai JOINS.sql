--Task1
SELECT
    f.title,
    cat.name AS category_name
FROM film f
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category cat     ON fc.category_id = cat.category_id
ORDER BY f.title
LIMIT 20;

--Task2 
select 
    first_name,
    last_name,
    email
from customer
where email like '%@sakilacustomer.org'
order by last_name;

--Task3

select
 count(*) AS film_count
from film
group by rating
order by film_count DESC;

--Task4
select 
    a.actor_id,
    a.first_name,
    a.last_name,
    count(f.film_id) as film_count
from actor a
join film_actor fa 
    on a.actor_id = fa.actor_id
join film f 
    on fa.film_id = f.film_id
group by
    a.actor_id, 
    a.first_name, 
    a.last_name
order by 
    film_count desc
limit 10;  

--Task5
select 
    c.customer_id,
    c.first_name,
    c.last_name,
    round(sum(p.amount), 2) as total_paid
from customer c
join payment p 
    on c.customer_id = p.customer_id
join rental r 
    on p.rental_id = r.rental_id
group by 
    c.customer_id,
    c.first_name,
    c.last_name
having 
    sum(p.amount) > 150
order by 
    total_paid desc;

