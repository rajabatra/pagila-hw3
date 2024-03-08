/*
 * Compute the country with the most customers in it. 
 */
Select country.country from customer
Join address On customer.address_id = address.address_id
Join city ON address.city_id = city.city_id
Join country On city.country_id = country.country_id
Group by country.country
Order by Count(customer.customer_id) DESC Limit 1;
