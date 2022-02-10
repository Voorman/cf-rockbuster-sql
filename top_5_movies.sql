-- Top 5 films
SELECT
	F.title,
	SUM(P.amount) AS total_revenue
FROM
	payment P
	INNER JOIN rental R ON P.rental_id = R.rental_id
	INNER JOIN inventory I ON R.inventory_id = I.inventory_id
	INNER JOIN film F ON I.film_id = F.film_id
GROUP BY
	F.title
ORDER BY
	total_revenue
LIMIT 10;
