--For Reference
select * from inventory;
select * from film;

--Creating the view total_count using a subquery instead of a join
create view title_count AS
SELECT film.title,
	(select count(film_id) as Number_of_Copies from inventory
	where inventory.film_id = film.film_id
	group by film_id)
from film;

--Filtering the view to show only titles with seven copies	
select * from title_count
where number_of_copies = 7;