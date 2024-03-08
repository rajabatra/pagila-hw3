/* 
 * A new James Bond movie will be released soon, and management wants to send promotional material to "action fanatics".
 * They've decided that an action fanatic is any customer where at least 4 of their 5 most recently rented movies are action movies.
 *
 * Write a SQL query that finds all action fanatics.
*/
SELECT
    subquery.customer_id,
    subquery.first_name,
    subquery.last_name
FROM (
    SELECT
        customer.customer_id,
        customer.first_name,
        customer.last_name,
        rental.inventory_id,
        RANK() OVER (PARTITION BY customer.customer_id ORDER BY rental.rental_date DESC) AS rank
    FROM customer
    INNER JOIN rental ON customer.customer_id = rental.customer_id
) AS subquery
INNER JOIN inventory ON subquery.inventory_id = inventory.inventory_id
INNER JOIN film ON inventory.film_id = film.film_id
INNER JOIN film_category ON film.film_id = film_category.film_id
INNER JOIN category ON film_category.category_id = category.category_id
WHERE subquery.rank <= 5
GROUP BY subquery.customer_id, subquery.first_name, subquery.last_name
HAVING SUM(CASE WHEN category.name = 'Action' THEN 1 ELSE 0 END) >= 4
ORDER BY subquery.customer_id;
