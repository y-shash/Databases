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


/*
    Q8
*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE your query has a semicolon (;) at the end of this answer


/*
    Q9
*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE your query has a semicolon (;) at the end of this answer


/*
    Q10
*/
-- PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
-- ENSURE your query has a semicolon (;) at the end of this answer

