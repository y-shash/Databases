--****PLEASE ENTER YOUR DETAILS BELOW****
--T2-cb-dm.sql

--Student ID: 29801362
--Student Name: Youssef Nehad Mohamed Riyad Shash
--Tutorial No: 04

/* Comments for your marker:




*/

/*
Task 2 (c):

Complete the listed DML actions
*/
--PLEASE PLACE REQUIRED SQL STATEMENT(S) BELOW

-- (i)

CREATE SEQUENCE animal_id_seq START WITH 500 INCREMENT BY 1;
CREATE SEQUENCE brevent_id_seq START WITH 500 INCREMENT BY 1;

-- (ii)

UPDATE ANIMAL
SET CENTRE_ID = (SELECT CENTRE_ID FROM CENTRE WHERE
 CENTRE_NAME='Kruger National Park')
WHERE centre_id = (SELECT centre_id FROM CENTRE WHERE
 centre_name='SanWild Wildlife Sanctuary');

DELETE FROM CENTRE 
WHERE CENTRE_ID = (SELECT CENTRE_ID FROM CENTRE WHERE
 CENTRE_NAME='SanWild Wildlife Sanctuary');

-- (iii)

Insert into ANIMAL values (animal_id_seq.nextval, 'F', NULL, (SELECT CENTRE_ID FROM CENTRE WHERE
CENTRE_NAME='Australia Zoo'), (SELECT SPEC_GENUS FROM SPECIES WHERE SPEC_POPULAR_NAME='Tasmanian Devil'), 
(SELECT SPEC_NAME FROM SPECIES WHERE SPEC_POPULAR_NAME='Tasmanian Devil'));
-- Insert into ANIMAL values (animal_id_seq.nextval, 'F', NULL, centre_id, spec_genus, spec_name
 
 
Insert into ANIMAL values (animal_id_seq.nextval, 'M', NULL, (SELECT CENTRE_ID FROM CENTRE WHERE
 CENTRE_NAME='Werribee Open Range Zoo'), (SELECT SPEC_GENUS FROM SPECIES WHERE SPEC_POPULAR_NAME='Tasmanian Devil'), 
 (SELECT SPEC_NAME FROM SPECIES WHERE SPEC_POPULAR_NAME='Tasmanian Devil'));


-- (iv)

Insert into BREEDING_EVENT values (brevent_id_seq.nextval, '10-Feb-2021', (SELECT ANIMAL_ID FROM ANIMAL 
WHERE CENTRE_ID=(SELECT CENTRE_ID FROM CENTRE WHERE CENTRE_NAME='Australia Zoo') 
AND SPEC_GENUS=(SELECT SPEC_GENUS FROM SPECIES WHERE SPEC_POPULAR_NAME='Tasmanian Devil')
AND SPEC_NAME=(SELECT SPEC_NAME FROM SPECIES WHERE SPEC_POPULAR_NAME='Tasmanian Devil') ), 
(SELECT ANIMAL_ID FROM ANIMAL WHERE CENTRE_ID=(SELECT CENTRE_ID FROM CENTRE WHERE CENTRE_NAME='Werribee Open Range Zoo')
AND SPEC_GENUS=(SELECT SPEC_GENUS FROM SPECIES WHERE SPEC_POPULAR_NAME='Tasmanian Devil')
AND SPEC_NAME=(SELECT SPEC_NAME FROM SPECIES WHERE SPEC_POPULAR_NAME='Tasmanian Devil') ));

Insert into ANIMAL values (animal_id_seq.nextval, 'F', (SELECT BREVENT_ID FROM BREEDING_EVENT WHERE BREVENT_DATE='10-Feb-2021'),
(SELECT CENTRE_ID FROM CENTRE WHERE CENTRE_NAME='Australia Zoo'), (SELECT SPEC_GENUS FROM SPECIES WHERE SPEC_POPULAR_NAME='Tasmanian Devil'), 
(SELECT SPEC_NAME FROM SPECIES WHERE SPEC_POPULAR_NAME='Tasmanian Devil'));

Insert into ANIMAL values (animal_id_seq.nextval, 'M', (SELECT BREVENT_ID FROM BREEDING_EVENT WHERE BREVENT_DATE='10-Feb-2021'),
(SELECT CENTRE_ID FROM CENTRE WHERE CENTRE_NAME='Australia Zoo'), (SELECT SPEC_GENUS FROM SPECIES WHERE SPEC_POPULAR_NAME='Tasmanian Devil'), 
(SELECT SPEC_NAME FROM SPECIES WHERE SPEC_POPULAR_NAME='Tasmanian Devil'));
