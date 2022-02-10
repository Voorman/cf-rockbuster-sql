-- descriptive statistics table film from rockbuster database
SELECT
	min(release_year) AS min_release_year,
	max(release_year) AS max_release_year,
	ROUND(avg(release_year)::numeric,2) AS avg_release_year,

	min(rental_duration) AS min_rental_duration,
	max(rental_duration) AS max_rental_duration,
	avg(rental_duration) AS avg_rental_duration,
	
	min(rental_rate) AS min_rental_rate,
	max(rental_rate) AS max_rental_rate,
	avg(rental_rate) AS avg_rental_rate,
	
	min(length) AS min_length,
	max(length) AS max_length,
	avg(length) AS avg_length,
	
	min(replacement_cost) AS min_replacement_cost,
	max(replacement_cost) AS max_replacement_cost,
	avg(replacement_cost) AS avg_replacement_cost,

	min(last_update) AS min_last_update,
	max(last_update) AS max_last_update
FROM
	film;
