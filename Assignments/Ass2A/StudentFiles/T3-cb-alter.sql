--****PLEASE ENTER YOUR DETAILS BELOW****
--T3-cb-alter.sql

--Student ID: Youssef Nehad Mohamed Riyad Shash
--Student Name: 29801362
--Tutorial No: 04

/* Comments for your marker:




*/

/*

Task 3:

Make the listed changes to the "live" database
*/
drop table DEAD_ANIMAL cascade constraints purge;
--PLEASE PLACE REQUIRED SQL STATEMENT(S) BELOW

-- (a)

ALTER TABLE CENTRE
ADD offspring_count NUMERIC(30) DEFAULT 0;

-- (b)

CREATE TABLE DEAD_ANIMAL (
    animal_id   NUMERIC(6) NOT NULL,
    dead_animal_sex CHAR(1) NOT NULL,
    born_date DATE NOT NULL,
    dead_date DATE NOT NULL,
    centre_id CHAR(6) NOT NULL,
    spec_genus VARCHAR(20) NOT NULL,
    spec_name VARCHAR(20) NOT NULL,
    CONSTRAINT danimal_pk PRIMARY KEY (animal_id),
    CONSTRAINT danimal_fk FOREIGN KEY (animal_id) REFERENCES ANIMAL (animal_id),
    CONSTRAINT dcentre_fk FOREIGN KEY (centre_id) REFERENCES CENTRE (centre_id),
    CONSTRAINT spec_dgenus_name_fk FOREIGN KEY (spec_genus, spec_name) REFERENCES SPECIES (spec_genus, spec_name)
        ON DELETE SET NULL
);

COMMENT ON COLUMN DEAD_ANIMAL.animal_id IS
    'The identifier of the  dead animal';
COMMENT ON COLUMN DEAD_ANIMAL.dead_animal_sex IS
    'The sex of the  dead animal';
COMMENT ON COLUMN DEAD_ANIMAL.born_date IS
    'The born date of the  dead animal';
COMMENT ON COLUMN DEAD_ANIMAL.dead_date IS
    'The dead date of the  dead animal';
COMMENT ON COLUMN DEAD_ANIMAL.centre_id IS
    'The centre of the  dead animal die at';
COMMENT ON COLUMN DEAD_ANIMAL.spec_genus IS
    'The species genus of the  dead animal';
COMMENT ON COLUMN DEAD_ANIMAL.spec_name IS
    'The species name of the  dead animal';

Insert into DEAD_ANIMAL values (1, 'F', '01-Jan-2020', '01-Jan-2021','AUS10', 'Myrmecobius', 'fasciatus');

DELETE FROM ANIMAL WHERE ANIMAL_ID=1;
/*
******* Explain here your selected approach and its advantage/s *********
The approach is to separete the dead animals from the alive one to have more realistic databse suitable for statistics
I created a table to record the details of the dead animals and the centres they dead in 
This helps to recognise patterns and make some reasond for the die of these animals
*/



-- (c)

ALTER TABLE CENTRE
ADD centre_type VARCHAR(30) DEFAULT 'other';

UPDATE CENTRE SET CENTRE_TYPE='Zoo' WHERE CENTRE_NAME LIKE '%Zoo%';
UPDATE CENTRE SET CENTRE_TYPE='Wildlife Park' WHERE CENTRE_NAME LIKE '%Park%';
UPDATE CENTRE SET CENTRE_TYPE='Sanctuary' WHERE CENTRE_NAME LIKE '%Sanctuary%';
UPDATE CENTRE SET CENTRE_TYPE='Nature Reserve' WHERE CENTRE_NAME LIKE '%Reserve%';

commit;
