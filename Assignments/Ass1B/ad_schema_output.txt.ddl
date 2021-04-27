-- Generated by Oracle SQL Developer Data Modeler 20.4.0.374.0801
--   at:        2021-04-27 23:32:49 EET
--   site:      Oracle Database 11g
--   type:      Oracle Database 11g

--student id: 29801362
--student name: Youssef Nehad Mohamed Riyad Shash
-- Capture run of script in file called ad_schema_output.txt
set echo on
SPOOL ad_schema_output.txt

DROP TABLE clinic CASCADE CONSTRAINTS;

DROP TABLE drug CASCADE CONSTRAINTS;

DROP TABLE drug_details CASCADE CONSTRAINTS;

DROP TABLE invoice CASCADE CONSTRAINTS;

DROP TABLE owner CASCADE CONSTRAINTS;

DROP TABLE pet CASCADE CONSTRAINTS;

DROP TABLE service CASCADE CONSTRAINTS;

DROP TABLE service_details CASCADE CONSTRAINTS;

DROP TABLE vet CASCADE CONSTRAINTS;

-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE clinic (
    clinic_id       NUMBER(4) NOT NULL,
    clinic_name     VARCHAR2(50) NOT NULL,
    clinic_address  VARCHAR2(50) NOT NULL,
    clinic_phone    CHAR(10) NOT NULL
);

COMMENT ON COLUMN clinic.clinic_id IS
    'clinic id';

COMMENT ON COLUMN clinic.clinic_name IS
    'clinic name';

COMMENT ON COLUMN clinic.clinic_address IS
    'the clinic address';

COMMENT ON COLUMN clinic.clinic_phone IS
    'clinic phone number';

ALTER TABLE clinic ADD CONSTRAINT clinic_pk PRIMARY KEY ( clinic_id );

CREATE TABLE drug (
    qty_supplied  NUMBER(2) NOT NULL,
    drug_cost     NUMBER(10, 2) NOT NULL,
    drug_id       NUMBER(3) NOT NULL
);

COMMENT ON COLUMN drug.qty_supplied IS
    'drug quantity supplied';

COMMENT ON COLUMN drug.drug_cost IS
    'drug cost';

COMMENT ON COLUMN drug.drug_id IS
    'drug id';

ALTER TABLE drug ADD CONSTRAINT drug_pk PRIMARY KEY ( drug_id );

CREATE TABLE drug_details (
    drug_name          VARCHAR2(50) NOT NULL,
    drug_instructions  VARCHAR2(50) NOT NULL,
    drug_id            NUMBER(3) NOT NULL
);

COMMENT ON COLUMN drug_details.drug_name IS
    'drug name';

COMMENT ON COLUMN drug_details.drug_instructions IS
    'drug instructions';

COMMENT ON COLUMN drug_details.drug_id IS
    'drug id';

ALTER TABLE drug_details ADD CONSTRAINT drug_details_pk PRIMARY KEY ( drug_id );

ALTER TABLE drug_details ADD CONSTRAINT un_drug_name UNIQUE ( drug_name );

CREATE TABLE invoice (
    pet_id            NUMBER(3) NOT NULL,
    vet_id            NUMBER(4) NOT NULL,
    service_datetime  DATE NOT NULL,
    total_amount      NUMBER(10, 2) NOT NULL,
    pay_type          VARCHAR2(4) NOT NULL
);

COMMENT ON COLUMN invoice.pet_id IS
    'pet id';

COMMENT ON COLUMN invoice.vet_id IS
    'vet id';

COMMENT ON COLUMN invoice.service_datetime IS
    'service date ad time';

COMMENT ON COLUMN invoice.total_amount IS
    'total costs of vist';

COMMENT ON COLUMN invoice.pay_type IS
    'payment type';

ALTER TABLE invoice ADD CONSTRAINT invoice_pk PRIMARY KEY ( pet_id,
                                                            service_datetime );

CREATE TABLE owner (
    owner_id           NUMBER(4) NOT NULL,
    owner_givname      VARCHAR2(50) NOT NULL,
    owner_famname      VARCHAR2(50) NOT NULL,
    owner_addstreet    VARCHAR2(50) NOT NULL,
    owner_addtown      VARCHAR2(50) NOT NULL,
    owner_addpostcode  NUMBER(4) NOT NULL,
    owner_phone        CHAR(10),
    vet_id             NUMBER(4) NOT NULL
);

COMMENT ON COLUMN owner.owner_id IS
    'owners'' identification number';

COMMENT ON COLUMN owner.owner_givname IS
    'owner given name';

COMMENT ON COLUMN owner.owner_famname IS
    'owner family name';

COMMENT ON COLUMN owner.owner_addstreet IS
    'owner address street';

COMMENT ON COLUMN owner.owner_addtown IS
    'owner address town';

COMMENT ON COLUMN owner.owner_addpostcode IS
    'owner address postcode';

COMMENT ON COLUMN owner.owner_phone IS
    'owner phone number';

COMMENT ON COLUMN owner.vet_id IS
    'vet id';

ALTER TABLE owner ADD CONSTRAINT owner_pk PRIMARY KEY ( owner_id );

CREATE TABLE pet (
    pet_id         NUMBER(3) NOT NULL,
    pet_gender     VARCHAR2(7) NOT NULL,
    pet_name       VARCHAR2(20) NOT NULL,
    pet_type       VARCHAR2(50) NOT NULL,
    pet_birthdate  DATE NOT NULL,
    pet_decreased  CHAR(1) NOT NULL,
    owner_id       NUMBER(4) NOT NULL
);

COMMENT ON COLUMN pet.pet_id IS
    'pet identification number';

COMMENT ON COLUMN pet.pet_gender IS
    'pet gender';

COMMENT ON COLUMN pet.pet_name IS
    'pet name';

COMMENT ON COLUMN pet.pet_birthdate IS
    'pet birth date';

COMMENT ON COLUMN pet.owner_id IS
    'owners'' identification number';

ALTER TABLE pet ADD CONSTRAINT owner_pet_pk PRIMARY KEY ( pet_id );

CREATE TABLE service (
    service_cost      NUMBER(10, 2) NOT NULL,
    vet_notes         VARCHAR2(50) NOT NULL,
    service_length    NUMBER(2, 2) NOT NULL,
    pet_id            NUMBER(3) NOT NULL,
    service_datetime  DATE NOT NULL,
    clinic_id         NUMBER(4) NOT NULL,
    vet_id            NUMBER(4) NOT NULL,
    service_code      CHAR(5) NOT NULL,
    drug_id           NUMBER(3) NOT NULL,
    pet_id2           NUMBER(3) NOT NULL
);

COMMENT ON COLUMN service.service_cost IS
    'service cost';

COMMENT ON COLUMN service.vet_notes IS
    'vet notes on the pet condition';

COMMENT ON COLUMN service.service_length IS
    'the length of the service';

COMMENT ON COLUMN service.pet_id IS
    'pet id';

COMMENT ON COLUMN service.service_datetime IS
    'service date ad time';

COMMENT ON COLUMN service.clinic_id IS
    'clinic id';

COMMENT ON COLUMN service.vet_id IS
    'vet id';

COMMENT ON COLUMN service.drug_id IS
    'drug id';

COMMENT ON COLUMN service.pet_id2 IS
    'pet identification number';

ALTER TABLE service
    ADD CONSTRAINT service_pk PRIMARY KEY ( service_code,
                                            service_datetime,
                                            pet_id );

CREATE TABLE service_details (
    service_desc      VARCHAR2(50) NOT NULL,
    service_code      CHAR(5) NOT NULL,
    service_datetime  DATE NOT NULL,
    pet_id            NUMBER(3) NOT NULL
);

COMMENT ON COLUMN service_details.service_desc IS
    'service description';

COMMENT ON COLUMN service_details.service_datetime IS
    'service date ad time';

COMMENT ON COLUMN service_details.pet_id IS
    'pet id';

CREATE TABLE vet (
    vet_id       NUMBER(4) NOT NULL,
    vet_name     VARCHAR2(50) NOT NULL,
    vet_phone    CHAR(10),
    vet_empdate  DATE NOT NULL,
    vet_spec     VARCHAR2(50),
    clinic_id    NUMBER(4) NOT NULL
);

COMMENT ON COLUMN vet.vet_id IS
    'vet id';

COMMENT ON COLUMN vet.vet_name IS
    'vet name';

COMMENT ON COLUMN vet.vet_phone IS
    'vet phone number';

COMMENT ON COLUMN vet.vet_spec IS
    'vet specialisation';

COMMENT ON COLUMN vet.clinic_id IS
    'clinic id';

ALTER TABLE vet ADD CONSTRAINT vet_pk PRIMARY KEY ( vet_id );

ALTER TABLE service
    ADD CONSTRAINT clinic_service FOREIGN KEY ( clinic_id )
        REFERENCES clinic ( clinic_id );

ALTER TABLE vet
    ADD CONSTRAINT clinic_vet FOREIGN KEY ( clinic_id )
        REFERENCES clinic ( clinic_id );

ALTER TABLE drug_details
    ADD CONSTRAINT drug_details FOREIGN KEY ( drug_id )
        REFERENCES drug ( drug_id );

ALTER TABLE service
    ADD CONSTRAINT drug_service FOREIGN KEY ( drug_id )
        REFERENCES drug ( drug_id );

ALTER TABLE service
    ADD CONSTRAINT invoice_service FOREIGN KEY ( pet_id,
                                                 service_datetime )
        REFERENCES invoice ( pet_id,
                             service_datetime );

ALTER TABLE pet
    ADD CONSTRAINT owner_pet FOREIGN KEY ( owner_id )
        REFERENCES owner ( owner_id );

ALTER TABLE service
    ADD CONSTRAINT pet_service FOREIGN KEY ( pet_id2 )
        REFERENCES pet ( pet_id );

ALTER TABLE service_details
    ADD CONSTRAINT service_details FOREIGN KEY ( service_code,
                                                 service_datetime,
                                                 pet_id )
        REFERENCES service ( service_code,
                             service_datetime,
                             pet_id );

ALTER TABLE owner
    ADD CONSTRAINT vet_owner FOREIGN KEY ( vet_id )
        REFERENCES vet ( vet_id );

ALTER TABLE service
    ADD CONSTRAINT vet_service FOREIGN KEY ( vet_id )
        REFERENCES vet ( vet_id );

SPOOL off
set echo off

-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                             9
-- CREATE INDEX                             0
-- ALTER TABLE                             19
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
