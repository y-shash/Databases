--****PLEASE ENTER YOUR DETAILS BELOW****
--T2-cb-insert.sql

--Student ID: Youssef Nehad Mohamed Riyad Shash
--Student Name: 29801362
--Tutorial No: 04
--
/* Comments for your marker:




*/

/*
Task 2 (b):

Load the ANIMAL and BREEDING_EVENT tables with your own test data using the 
supplied T2-cb-insert.sql file script file, and SQL commands which will  
insert as a minimum, the following sample data -
 - 12 animals, some of which must have been captured from the wild, i.e. 
      are not the offspring from a breeding event, and
- 4 breeding events
Your inserted rows must meet the assignment specification requirements
*/
--PLEASE PLACE REQUIRED SQL STATEMENT(S) BELOW

-- INSERTING into ANIMAL


Insert into ANIMAL values (1, 'F', 13, 'AUS10', 'Myrmecobius', 'fasciatus');
Insert into ANIMAL values (2, 'F', NULL, 'AUS30', 'Sarcophilus', 'harrisii');
Insert into ANIMAL values (3, 'F', 14, 'AUS10', 'Macrotis', 'lagotis');
Insert into ANIMAL values (4, 'M', 15, 'AUS40', 'Lasiorhinus', 'krefftii');
Insert into ANIMAL values (5, 'M', NULL,'AUS40', 'Setonix', 'brachyurus');
Insert into ANIMAL values (6, 'M', 16, 'AUS20', 'Acinonyx', 'jubatus');
Insert into ANIMAL values (7, 'M', 17, 'AUS20', 'Diceros', 'bicornis');
Insert into ANIMAL values (8, 'F', NULL, 'AUS30', 'Equus', 'zebra');
Insert into ANIMAL values (9, 'F', 18, 'AUS10', 'Panthera', 'leo');
Insert into ANIMAL values (10, 'M', 19, 'AUS40', 'Hippopotamus', 'amphibius');
Insert into ANIMAL values (11, 'F', 20, 'AUS20', 'Equus', 'grevyi');
Insert into ANIMAL values (12, 'M', NULL, 'AUS30', 'Myrmecobius', 'fasciatus');


-- INSERTING into BREEDING_EVENT

Insert into BREEDING_EVENT values (13, '21-May-2020', 1, 12);
Insert into BREEDING_EVENT values (14, '09-Jan-2021', 3, 5);
Insert into BREEDING_EVENT values (15, '15-Oct-2020', 8, 4);
Insert into BREEDING_EVENT values (16, '29-Jul-2020', 2, 6);

commit;