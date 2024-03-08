/*
 * List the first and last names of all actors who:
 * 1. have appeared in at least one movie in the "Children" category,
 * 2. but that have never appeared in any movie in the "Horror" category.
 */
SELECT DISTINCT
    a.first_name,
    a.last_name
FROM
    actor a
JOIN
    film_actor fa ON a.actor_id = fa.actor_id
JOIN
    film f ON fa.film_id = f.film_id
JOIN
    film_category fc ON f.film_id = fc.film_id
JOIN
    category c ON fc.category_id = c.category_id
WHERE
    c.name = 'Children'
AND a.actor_id NOT IN (
    SELECT
        fa.actor_id
    FROM
        film_actor fa
    JOIN
        film f ON fa.film_id = f.film_id
    JOIN
        film_category fc ON f.film_id = fc.film_id
    JOIN
        category c ON fc.category_id = c.category_id
    WHERE
        c.name = 'Horror'
)
ORDER BY
    last_name, first_name;
