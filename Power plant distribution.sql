CREATE TABLE power_plants_distributions
(
	plant_id serial primary key,
	plant_name varchar(50),
	plant_type varchar(50),
	capacity_mw int,
	generation_mwh int,
	country varchar(50),
	city varchar(50),
	comission_date date,
	operating_cost_million_usd numeric(10,2),
	co2_emission_cost_tons int

);

select * from power_plants_distributions;



--List all power plants.

select * from power_plants_distributions;

--Show plant name, type, and capacity.

select plant_name, plant_type, capacity_mw
from power_plants_distributions;

--Find all Solar power plants.
select * from power_plants_distributions;

select plant_type from power_plants_distributions
where plant_type='Solar';

--Count total number of power plants.

select count(*)
from power_plants_distributions;

--Find plants with capacity greater than 1000 MW.

select * from power_plants_distributions
where capacity_mw>1000;

--Filtering & Sorting

--List plants commissioned after 2020.

select * from power_plants_distributions
where comission_date> '2020-01-01';

--Find power plants in India.
select * from power_plants_distributions
where country='India';

--Sort plants by capacity in descending order.

select * from power_plants_distributions
order by capacity_mw desc;

--Show top 10 plants by power generation.

select * from power_plants_distributions
order by capacity_mw desc limit 10;

--Find plants with zero CO₂ emissions.

SELECT *
FROM power_plants_distributions
WHERE co2_emission_tons = 0;



--Total power generation per country.

select country, sum(capacity_mw)
from power_plants_distributions
group by country;

--Average capacity by plant type.


select * from power_plants_distributions;

select plant_type, avg(capacity_mw) as average_by_plant_type
from power_plants_distributions
group by plant_type;


--Maximum and minimum capacity per plant type.
select plant_type, max(capacity_mw) as maximum_by_plant_type
from power_plants_distributions
group by plant_type;


select plant_type, min(capacity_mw) as minimum_by_plant_type
from power_plants_distributions
group by plant_type;


--Total operating cost per country.

select country, sum(operating_cost_million_usd)
from power_plants_distributions
group by country;

--Count number of plants per city.

select city, count(*)
from power_plants_distributions
group by city;




---Number of plants commissioned per year.

select 
	extract (year from comission_date) as year,
	count(*) as number_of_per_year
	from power_plants_distributions
	group by year
	order by year;

--Average generation for plants commissioned after 2018.

select
	 avg(generation_mwh) as avarage_generation
	 from power_plants_distributions
	 where comission_date > '2018-01-01';

--Advanced / Analytical

--Top 5 highest CO₂-emitting power plants.

select co2_emission_cost_tons
from power_plants_distributions
order by co2_emission_cost_tons desc limit 5;

--Percentage contribution of each plant type to total generation.

SELECT
    plant_type,
    ROUND(
        SUM(generation_mwh) * 100.0 / 
        (SELECT SUM(generation_mwh) FROM power_plants_distributions),
        2
    ) AS generation_percentage
FROM power_plants_distributions
GROUP BY plant_type;


--Find countries where average CO₂ emissions exceed 300,000 tons.

SELECT country, AVG(co2_emissions_cost_tons) AS avg_emissions
FROM power_plants_distributions
GROUP BY country
HAVING AVG(co2_emissions_cost_tons) > 300000;

