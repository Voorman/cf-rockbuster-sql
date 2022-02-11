-- Revenue per country

SELECT
	CO.country,
	SUM(P.amount) AS revenue
FROM
	payment P
	INNER JOIN customer C ON P.customer_id = C.customer_id
	INNER JOIN address A ON C.address_id = A.address_id
	INNER JOIN city CI ON A.city_id = CI.city_id
	INNER JOIN country CO ON CI.country_id = CO.country_id
GROUP BY
	CO.country
ORDER BY
	revenue DESC;
