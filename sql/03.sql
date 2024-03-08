/*
 * List the total amount of money that customers from each country have payed.
 * Order the results from most to least money.
 */
Select c.country, SUM(p.amount) AS total_payments
FROM
    payment p
JOIN
    customer cu ON p.customer_id = cu.customer_id
JOIN
    address a ON cu.address_id = a.address_id
JOIN
    city ci ON a.city_id = ci.city_id
JOIN
    country c ON ci.country_id = c.country_id
GROUP BY
    c.country
ORDER BY
    total_payments DESC, country;
