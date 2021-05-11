--****PLEASE ENTER YOUR DETAILS BELOW****
--T1-cb-schm.sql

--Student ID: Youssef Nehad Mohamed Riyad Shash
--Student Name: 29801362
--Tutorial No: 04

/* Comments for your marker:




*/

/*
Using the model and details supplied, and the supplied T1-cb-schm.sql
file, create an SQL schema file which can be used to create this database in
Oracle.
*/
--PLEASE PLACE REQUIRED SQL STATEMENT(S) BELOW

drop table ANIMAL purge;
drop table BREEDING_EVENT purge;
drop table SPECIES purge;
drop table CENTRE purge;


-- Create Tables

create table CENTRE (
    centre_id   CHAR(6) NOT NULL,
    centre_name VARCHAR(40) CONSTRAINT uq_centre_name UNIQUE NOT NULL,
    centre_address  VARCHAR(100) NOT NULL,
    centre_director VARCHAR(30) NOT NULL,
    centre_phone_no VARCHAR(20) NOT NULL,
    CONSTRAINT pk_centre PRIMARY KEY (centre_id)
);

COMMENT ON COLUMN CENTRE.centre_id IS
    'The identifier of the centre';

COMMENT ON COLUMN CENTRE.centre_name IS
    'The name of the centre';

COMMENT ON COLUMN CENTRE.centre_address IS
    'The address of the centre';

COMMENT ON COLUMN CENTRE.centre_director IS
    'The director of the centre';

COMMENT ON COLUMN CENTRE.centre_phone_no IS
    'The phone no of the centre';


create table SPECIES (
    spec_genus   VARCHAR(20) NOT NULL,
    spec_name VARCHAR(20) NOT NULL,
    spec_popular_name  VARCHAR(40) CONSTRAINT uq_spec_popular_name UNIQUE NOT NULL,
    spec_family VARCHAR(20) NOT NULL,
    spec_natural_range VARCHAR(100) NOT NULL,
    CONSTRAINT spec_pk PRIMARY KEY (spec_genus, spec_name)
);

COMMENT ON COLUMN SPECIES.spec_genus IS
    'The species genus';

COMMENT ON COLUMN SPECIES.spec_name IS
    'The species name';

COMMENT ON COLUMN SPECIES.spec_popular_name IS
    'The species popular name';

COMMENT ON COLUMN SPECIES.spec_family IS
    'The species family name';

COMMENT ON COLUMN SPECIES.spec_natural_range IS
    'Description of the natural range of the species';


create table BREEDING_EVENT (
    brevent_id   NUMERIC(6) NOT NULL,
    brevent_date DATE NOT NULL,
    mother_id  NUMERIC(6) NOT NULL,
    father_id NUMERIC(6) NOT NULL,
    CONSTRAINT pk_breeding_event PRIMARY KEY (brevent_id)
    
);

COMMENT ON COLUMN BREEDING_EVENT.brevent_id IS
    'The identifier of the breeding event';

COMMENT ON COLUMN BREEDING_EVENT.brevent_date IS
    'The date of which the breeding took place';

COMMENT ON COLUMN BREEDING_EVENT.mother_id IS
    'The animal_id of the animal who was the mother';

COMMENT ON COLUMN BREEDING_EVENT.father_id IS
    'The animal_id of the animal who was the father';


create table ANIMAL (
    animal_id   NUMERIC(6) NOT NULL,
    animal_sex CHAR(1) NOT NULL,
    brevent_id  NUMERIC(6),
    centre_id CHAR(6) NOT NULL,
    spec_genus VARCHAR(20) NOT NULL,
    spec_name VARCHAR(20) NOT NULL,
    CONSTRAINT animal_pk PRIMARY KEY (animal_id),
    CONSTRAINT fk_animal_breeding FOREIGN KEY (brevent_id) REFERENCES BREEDING_EVENT (brevent_id),
    CONSTRAINT fk_animal_centre FOREIGN KEY (centre_id) REFERENCES CENTRE (centre_id) ON DELETE SET NULL,
    CONSTRAINT fk_animal_species FOREIGN KEY (spec_genus, spec_name) REFERENCES SPECIES (spec_genus, spec_name)
        ON DELETE SET NULL 
);

COMMENT ON COLUMN ANIMAL.animal_id IS
    'The identifier of the animal';

COMMENT ON COLUMN ANIMAL.animal_sex IS
    'The animal sex';

COMMENT ON COLUMN ANIMAL.brevent_id IS
    'If bred in captivity (i.e. at a centre), the id of the breeding event
    which produced the animal. Animals which have been captured
    from the wild will have no brevent_id assigned';

COMMENT ON COLUMN ANIMAL.centre_id IS
    'The "home" center where the animal is normally located.
    Animals are sometimes located at other centres for a breeding
    event';

COMMENT ON COLUMN ANIMAL.spec_genus IS
    'The species genus for the animal';
    
COMMENT ON COLUMN ANIMAL.spec_name IS
    'The species name for the animal';
    
ALTER TABLE BREEDING_EVENT
    ADD CONSTRAINT breeding_animal_fk FOREIGN KEY (mother_id, father_id) REFERENCES ANIMAL (animal_id)
        ON DELETE SET NULL;

    
