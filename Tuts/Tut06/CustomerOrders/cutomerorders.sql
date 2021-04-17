-- Generated by Oracle SQL Developer Data Modeler 20.4.0.374.0801
--   at:        2021-04-17 15:59:35 EET
--   site:      Oracle Database 11g
--   type:      Oracle Database 11g

set echo on
spool customerorders.txt

DROP TABLE customer CASCADE CONSTRAINTS;

DROP TABLE orderline CASCADE CONSTRAINTS;

DROP TABLE orders CASCADE CONSTRAINTS;

DROP TABLE prod_category CASCADE CONSTRAINTS;

DROP TABLE product CASCADE CONSTRAINTS;

-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE customer (
    cust_no       NUMBER(7) NOT NULL,
    cust_name     VARCHAR2(50) NOT NULL,
    cust_address  VARCHAR2(50) NOT NULL,
    cust_phone    CHAR(10),
    cust_level    CHAR(1) NOT NULL
);

ALTER TABLE customer
    ADD CONSTRAINT chk_cust_level CHECK ( cust_level IN ( 'B', 'G', 'S' ) );

COMMENT ON COLUMN customer.cust_no IS
    'customer number';

COMMENT ON COLUMN customer.cust_name IS
    'customer name';

COMMENT ON COLUMN customer.cust_address IS
    'customer address';

COMMENT ON COLUMN customer.cust_phone IS
    'customer phone';

COMMENT ON COLUMN customer.cust_level IS
    'customer level';

ALTER TABLE customer ADD CONSTRAINT customer_pk PRIMARY KEY ( cust_no );

CREATE TABLE orderline (
    ol_qtyordered  NUMBER(7) NOT NULL,
    ol_lineprice   NUMBER(7, 2) NOT NULL,
    order_no       NUMBER(7) NOT NULL,
    prod_no        NUMBER(7) NOT NULL
);

COMMENT ON COLUMN orderline.ol_qtyordered IS
    'quantity ordered';

COMMENT ON COLUMN orderline.ol_lineprice IS
    'order price';

ALTER TABLE orderline ADD CONSTRAINT orderline_pk PRIMARY KEY ( order_no,
                                                                prod_no );

CREATE TABLE orders (
    order_no   NUMBER(7) NOT NULL,
    oder_date  DATE NOT NULL,
    cust_no    NUMBER(7) NOT NULL
);

COMMENT ON COLUMN orders.order_no IS
    'order number';

COMMENT ON COLUMN orders.oder_date IS
    'order date';

ALTER TABLE orders ADD CONSTRAINT orders_pk PRIMARY KEY ( order_no );

CREATE TABLE prod_category (
    pcat_id    NUMBER(7) NOT NULL,
    pcat_name  VARCHAR2(50) NOT NULL
);

COMMENT ON COLUMN prod_category.pcat_id IS
    'product category number';

ALTER TABLE prod_category ADD CONSTRAINT prod_category_pk PRIMARY KEY ( pcat_id );

ALTER TABLE prod_category ADD CONSTRAINT un_pcat_name UNIQUE ( pcat_name );

CREATE TABLE product (
    prod_no         NUMBER(7) NOT NULL,
    prod_desc       VARCHAR2(50) NOT NULL,
    prod_unitprice  NUMBER(7, 2) NOT NULL,
    pcat_id         NUMBER(7) NOT NULL
);

COMMENT ON COLUMN product.prod_no IS
    'product number';

COMMENT ON COLUMN product.prod_desc IS
    'product description';

COMMENT ON COLUMN product.prod_unitprice IS
    'product price';

ALTER TABLE product ADD CONSTRAINT product_pk PRIMARY KEY ( prod_no );

ALTER TABLE orders
    ADD CONSTRAINT customer_orders FOREIGN KEY ( cust_no )
        REFERENCES customer ( cust_no );

ALTER TABLE orderline
    ADD CONSTRAINT orders_orderline FOREIGN KEY ( order_no )
        REFERENCES orders ( order_no );

ALTER TABLE product
    ADD CONSTRAINT prodcategory_product FOREIGN KEY ( pcat_id )
        REFERENCES prod_category ( pcat_id );

ALTER TABLE orderline
    ADD CONSTRAINT product_orderline FOREIGN KEY ( prod_no )
        REFERENCES product ( prod_no );

spool off
set echo off

-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                             5
-- CREATE INDEX                             0
-- ALTER TABLE                             11
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