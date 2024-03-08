/*
 * Write a SQL query that lists the title of all movies where at least 2 actors were also in 'AMERICAN CIRCUS'.
 */
SELECT film2.title from film film1
join film_actor fa1 ON (film1.film_id = fa1.film_id)
join actor a ON (fa1.actor_id = a.actor_id)
join film_actor fa2 ON (a.actor_id = fa2.actor_id)
join film film2 ON (film2.film_id = fa2.film_id)
where film1.title = 'AMERICAN CIRCUS'
group by film2.title
having COUNT(DISTINCT a.actor_id) >= 2
order by film2.title;
