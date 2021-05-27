--****PLEASE ENTER YOUR DETAILS BELOW****
--mh-queries.sql

--Student ID: 29801362
--Student Name: Youssef Nehad Mohamed Riyad Shash
--Tutorial No: 04

/* Comments for your marker:




*/


/*
    Q1
*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE your query has a semicolon (;) at the end of this answer

SELECT ENDORSEMENT.ht_nbr, EMPLOYEE.emp_nbr, EMPLOYEE.emp_lname, EMPLOYEE.emp_fname, 
to_char(ENDORSEMENT.end_last_annual_review,'Day mm yyyy') AS review_date
FROM (MH.ENDORSEMENT JOIN MH.EMPLOYEE ON ENDORSEMENT.emp_nbr = EMPLOYEE.emp_nbr)
where ENDORSEMENT.end_last_annual_review > '31/Mar/20'
ORDER BY ENDORSEMENT.end_last_annual_review;


/*
    Q2
*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE your query has a semicolon (;) at the end of this answer

SELECT CHARTER.charter_nbr, CLIENT.client_nbr, CLIENT.client_lname, CLIENT.client_fname, CHARTER.charter_special_reqs
FROM (MH.CHARTER JOIN MH.CLIENT ON CHARTER.client_nbr = CLIENT.client_nbr)
where CHARTER.charter_special_reqs IS NOT NULL
ORDER BY CHARTER.charter_nbr;

/*
    Q3
*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE your query has a semicolon (;) at the end of this answer
SELECT CHARTER.charter_nbr, CLIENT.client_fname || ' ' || CLIENT.client_lname AS fullname, CHARTER.charter_cost_per_hour
FROM ((MH.CHARTER JOIN MH.CHARTER_LEG ON CHARTER.charter_nbr = CHARTER_LEG.charter_nbr) 
JOIN MH.LOCATION ON CHARTER_LEG.location_nbr_origin = LOCATION.location_nbr) 
JOIN MH.CLIENT ON CHARTER.client_nbr = CLIENT.client_nbr
where ((CHARTER.charter_special_reqs IS NULL) OR (CHARTER.charter_cost_per_hour < 1000))
AND LOCATION.location_name = 'Mount Doom' 
ORDER BY fullname DESC; 

/*
    Q4
*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE your query has a semicolon (;) at the end of this answer

SELECT HELICOPTER_TYPE.ht_nbr,  HELICOPTER_TYPE.ht_name, count(*) AS nbr_ht_owned
FROM MH.helicopter_type JOIN MH.helicopter ON HELICOPTER_TYPE.ht_nbr = HELICOPTER.ht_nbr
GROUP BY HELICOPTER_TYPE.ht_nbr,  HELICOPTER_TYPE.ht_name
HAVING count(*) > 1
ORDER BY nbr_ht_owned DESC;

/*
    Q5
*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE your query has a semicolon (;) at the end of this answer

SELECT LOCATION.location_nbr,  LOCATION.location_name, count(*) AS nbr_location_origin
FROM MH.LOCATION JOIN MH.CHARTER_LEG ON LOCATION.location_nbr = CHARTER_LEG.location_nbr_origin
GROUP BY LOCATION.location_nbr,  LOCATION.location_name
HAVING count(*) > 1
ORDER BY nbr_location_origin;

/*
    Q6
*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE your query has a semicolon (;) at the end of this answer

SELECT HELICOPTER_TYPE.ht_nbr,  HELICOPTER_TYPE.ht_name, SUM(HELICOPTER.heli_hrs_flown) AS hrs_flown 
FROM MH.helicopter_type JOIN MH.helicopter ON HELICOPTER_TYPE.ht_nbr = HELICOPTER.ht_nbr
GROUP BY HELICOPTER_TYPE.ht_nbr,  HELICOPTER_TYPE.ht_name
ORDER BY hrs_flown;
/*
    Q7
*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE your query has a semicolon (;) at the end of this answer
SELECT charter.charter_nbr, to_char(charter_leg.cl_atd, 'dd/MON/yyyy hh:mi:ss PM')
FROM (MH.CHARTER JOIN MH.EMPLOYEE ON CHARTER.emp_nbr = EMPLOYEE.emp_nbr) 
JOIN MH.CHARTER_LEG ON CHARTER.charter_nbr = CHARTER_LEG.charter_nbr
WHERE (EMPLOYEE.emp_lname = 'Baggins' AND EMPLOYEE.emp_fname = 'Frodo')
AND (CHARTER_LEG.cl_atd IS NOT NULL AND CHARTER_LEG.cl_ata IS NOT NULL)
ORDER BY charter_leg.cl_atd
/*
    Q8
*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE your query has a semicolon (;) at the end of this answer

-- SELECT CHARTER.charter_nbr, CLIENT.client_nbr, CLIENT.client_lname, CLIENT.client_fname,
-- CHARTER.charter_cost_per_hour * (to_char(charter_leg.cl_ata, 'dd/MON/yyyy hh:mi:ss PM') - 
-- to_char(charter_leg.cl_atd, 'dd/MON/yyyy hh:mi:ss PM')) AS totalchartercost
-- FROM (MH.CHARTER JOIN MH.CLIENT ON CHARTER.client_nbr = CLIENT.client_nbr) 
-- JOIN MH.CHARTER_LEG ON CHARTER.charter_nbr = CHARTER_LEG.charter_nbr;

/*
    Q9
*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE your query has a semicolon (;) at the end of this answer
SELECT CHARTER.charter_nbr, EMPLOYEE.emp_fname || ' ' || EMPLOYEE.emp_lname AS PILOTNAME, 
CLIENT.client_fname || ' ' || CLIENT.client_lname AS CLIENTNAME
FROM ((MH.CHARTER_LEG JOIN MH.CHARTER ON CHARTER_LEG.charter_nbr = CHARTER.charter_nbr) 
JOIN MH.EMPLOYEE ON CHARTER.emp_nbr = EMPLOYEE.emp_nbr) JOIN MH.CLIENT ON CLIENT.client_nbr = CHARTER.charter_nbr
WHERE (to_char(CHARTER_LEG.cl_etd) = to_char(CHARTER_LEG.cl_atd)) AND EMPLOYEE.emp_is_pilot = 'Y'
ORDER BY charter_nbr;

/*
    Q10
*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE your query has a semicolon (;) at the end of this answer

SELECT CLIENT.client_nbr || ' ' || CLIENT.client_fname || ' ' || CLIENT.client_lname AS CLIENTDET, LOCATION.location_name, count(*) AS FAVORITE_DEST
FROM ((MH.CLIENT JOIN MH.CHARTER ON CLIENT.client_nbr = CHARTER.client_nbr) 
JOIN MH.CHARTER_LEG ON CHARTER.charter_nbr = CHARTER_LEG.charter_nbr)
JOIN MH.LOCATION ON LOCATION.location_nbr = CHARTER_LEG.location_nbr_destination
GROUP BY CLIENT.client_nbr || ' ' || CLIENT.client_fname || ' ' || CLIENT.client_lname, LOCATION.location_name
order by CLIENTDET, LOCATION.location_name;



