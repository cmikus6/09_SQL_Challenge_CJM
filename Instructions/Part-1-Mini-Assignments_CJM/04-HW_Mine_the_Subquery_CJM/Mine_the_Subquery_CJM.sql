--For Reference
select * from film;
select * from actor;
select * from film_actor;
select * from rental;
select * from staff;
select * from inventory;

--All actors appearing in the film 'ALTER VICTORY'
select first_name, last_name from actor
where actor_id in
	(select actor_id from film_actor
	where film_id in
		(select film_id from film
		where title = 'ALTER VICTORY')
	);

--Titles of films that employee Jon Stephens rented to customers
select title from film
where film_id in
	(select film_id from inventory
	 where inventory_id in
	 	(select inventory_id from rental
		 where staff_id in
			(select staff_id from staff
			 where last_name = 'Stephens')
		 )
	 )
order by title;
	 