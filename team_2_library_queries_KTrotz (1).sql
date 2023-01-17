#Query 1
-- Selects the city,person's income, mental health, physical health, diabtetes, and high blood pressure prevalence, where the person's income is between 50000 and 65000--
CREATE OR REPLACE VIEW person_income_and_health 

AS

SELECT city,pers_income_2021,mental_health_issues_prev,physical_health_issues_prev,diabetes_prev,high_BP_prev
FROM cities
JOIN personal_income USING (metro_id)
JOIN city_states USING(city_id)
WHERE pers_income_2021 BETWEEN 50000 AND 65000
ORDER BY pers_income_2021;

#Query 2 
CREATE OR REPLACE VIEW location_population_physical_health

AS 

SELECT CONCAT(city,", ",state_abbrev,", USA") AS location,total_state_pop,physical_health_issues_prev
FROM city_states
JOIN cities USING(city_id)
JOIN state_pop USING(state_id)

ORDER BY total_state_pop DESC;

#Query 3
CREATE OR REPLACE VIEW city_coordinate_view

AS 
 
SELECT city_id,CONCAT(longitude,", ",latitude) AS coordinates,CONCAT(common_name," (",scientific_name,")") AS tree_name,condition_description,native_description
FROM tree_measurements
JOIN tree_classifications USING(tree_id)
JOIN tree_condition USING(condition_id)
JOIN tree_native_status USING(native_id)

GROUP BY city_id;




