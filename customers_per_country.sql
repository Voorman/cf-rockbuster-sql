
-- customers per country

SELECT
	CO.country,
	count(C.customer_id)
FROM
	customer C
	INNER JOIN address A ON C.address_id = A.address_id
	INNER JOIN city CI ON A.city_id = CI.city_id
	INNER JOIN country CO ON CI.country_id = CO.country_id
GROUP BY
	CO.country
ORDER BY
	CO.country;
