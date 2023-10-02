USE sakila;


select f.title, f.description, c.name from film f inner join film_category fc 
on f.film_id = fc.film_id inner join category c on c.category_id = fc.category_id group by 1,2,3;

select CONCAT(a.first_name,' ',a.last_name) Actor_name, c.name, count(c.name) 
from actor a inner join film_actor fa on a.actor_id = fa.actor_id
inner join film_category fc on fa.film_id = fc.film_id
inner join category c on fc.category_id = c.category_id group by 1,2 order by 1;

/* SLIDE 2 */
-- Count of movies based on language -- 
SELECT name from language;
SELECT l.name, count(*) count from language l inner join film f 
on l.language_id = f.language_id group by 1;



/* SLIDE 3 */
-- number of films from each category -- 
SELECT c.name, count(*) count_movies from film f inner join film_category fc
on f.film_id = fc.film_id inner join category c on fc.category_id = c.category_id group by 1 order by 2 desc;


/* SLIDE 4 */
-- count of customer from country --
-- India has more number of customers -- 
SELECT c.country, count(*) count_customers from country c inner join city cy on c.country_id = cy.country_id
inner join address a on cy.city_id = a.city_id inner join customer ct
on a.address_id = ct.address_id group by 1 order by count(*) desc;


/* SLIDE 5 */
-- how many times a movie has been rented -- 
SELECT f.title, COUNT(r.rental_id) AS times_rented
FROM category c inner join film_category fc on c.category_id = fc.category_id
inner join film f on f.film_id = fc.film_id
inner join inventory i on fc.film_id = i.film_id inner join
rental r on i.inventory_id = r.inventory_id group by 1 order by 4 desc;


/* SLIDE 6 */
-- which category of movie has been rented more -- 
-- sports movie are rented more --
SELECT c.name, count(r.rental_id) AS times_rented from
category c inner join film_category fc on c.category_id = fc.category_id
inner join inventory i on fc.film_id = i.film_id inner join
rental r on i.inventory_id = r.inventory_id group by 1 order by 2 desc;

/* SLIDE 7 */
-- Number of DVD's of each actor -- 
SELECT CONCAT(a.first_name,' ', a.last_name) Full_name, count(*) films
FROM actor AS a
JOIN film_actor AS fa USING (actor_id)
GROUP BY actor_id, first_name, last_name
ORDER BY films DESC;

/* SLIDE 8 */
-- amount for category of movie has been rented more -- 
SELECT c.name, SUM(p.amount) AS total_rental_cost from category c 
inner join film_category fc on c.category_id = fc.category_id
inner join inventory i on fc.film_id = i.film_id 
inner join rental r on i.inventory_id = r.inventory_id 
inner join payment p on p.rental_id = r.rental_id
group by 1 order by 2 desc;

/* SLIDE 9*/
-- Total rental cost of movie --
SELECT f.title, SUM(p.amount) AS movie_total_rental_cost from film f
inner join inventory i on f.film_id = i.film_id
inner join film_category fc on fc.film_id = i.film_id 
inner join rental r on i.inventory_id = r.inventory_id 
inner join payment p on p.rental_id = r.rental_id
group by 1 order by 2 desc;
