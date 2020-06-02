-- Drop table if exists
DROP TABLE firepower;

--Show entire table as it exists within the most recent query
SELECT * FROM firepower;

--Remove rows with no reserve personnel
delete from firepower 
where reservepersonnel = 0;

--Add one fighter aircraft to every nation with none
update firepower
set fighteraircraft = 1
where fighteraircraft = 0;

select AVG(totalmilitarypersonnel) as avg_militarypersonnel, 
	AVG(totalaircraftstrength) as avg_aircraftstrength,
	AVG(totalhelicopterstrength) as avg_helicopterstrength,
	AVG(totalpopulation) as avg_population
from firepower;
