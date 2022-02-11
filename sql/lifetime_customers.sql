-- Lifetime Customers Query

WITH top10_countries (
		country_id,
		country,
		number_of_counties
) AS (
		SELECT
			D.COUNTRY_ID,
			country,
			COUNT(D.COUNTRY_ID) AS number_of_counties
		FROM
			CUSTOMER A
			INNER JOIN ADDRESS B ON A.ADDRESS_ID = B.ADDRESS_ID
			INNER JOIN CITY C ON B.CITY_ID = C.CITY_ID
			INNER JOIN COUNTRY D ON C.COUNTRY_ID = D.COUNTRY_ID
		GROUP BY
			D.COUNTRY_ID,
			country
		ORDER BY
			COUNT(D.COUNTRY_ID)
			DESC
		LIMIT 10),
	top10_cities (city_id,
		city,
		country,
		number_of_cities)
	AS (
		SELECT
			G.city_id,
			G.city,
			H.country,
			count(G.city)
		FROM
			customer E
			INNER JOIN address F ON E.address_id = F.address_id
			INNER JOIN city G ON F.city_id = G.city_id
			INNER JOIN top10_countries H ON G.country_id = H.country_id
		GROUP BY
			H.country,
			G.city,
			G.city_id
		ORDER BY
			COUNT(G.city)
			DESC
		LIMIT 10
)
SELECT
	R.customer_id,
	R.first_name,
	R.last_name,
	S.country,
	S.city,
	SUM(P.amount) AS total_amound_paid
FROM
	payment P
	INNER JOIN customer R ON P.customer_id = R.customer_id
	INNER JOIN address Q ON R.address_id = Q.address_id
	INNER JOIN top10_cities S ON Q.city_id = S.city_id
GROUP BY
	R.customer_id,
	R.first_name,
	R.last_name,
	S.country,
	S.city
ORDER BY
	SUM(P.amount)
	DESC
LIMIT 5;
