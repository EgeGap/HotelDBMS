
CREATE TABLE HOTELS
(
HOTEL_ID INT not null,
HOTEL_NAME VARCHAR(50) not null,
HOTEL_TOWN VARCHAR(50) not null,
HOTEL_COUNTRY VARCHAR(50) not null,
HOTEL_PHONE VARCHAR(50) not null,
HOTEL_ADDRESS VARCHAR(50) not null,
HOTEL_BREAKFAST BOOLEAN not null,
HOTEL_CARPARK BOOLEAN not null,
DISTANCE_TO_CITY_CENTER INT not null,
IS_LOCATED_IN_CITY_CENTER BOOLEAN not null,
PRIMARY KEY (HOTEL_ID)
);

CREATE TABLE HOTEL_ROOM_TYPE
(
HOTEL_ROOM_TYPE_ID INT not null,
TYPE_NAME VARCHAR(50) not null,
DESCRIPTION VARCHAR(200),
JACUZZI BOOLEAN,
SMOKE_ROOM BOOLEAN,
PRIMARY KEY (HOTEL_ROOM_TYPE_ID)
);

CREATE TABLE HOTEL_ROOMS(
ROOM_NUMBER INT not null,
TYPE_ID INT not null,
HOTEL_ID INT not null,
FLOOR_LOCATION INT not null,
PERSON_COUNT INT not null,
BED_COUNT INT not null,
PRIMARY KEY (ROOM_NUMBER),
FOREIGN KEY (HOTEL_ID) REFERENCES HOTELS (HOTEL_ID),
FOREIGN KEY (TYPE_ID) REFERENCES HOTEL_ROOM_TYPE (HOTEL_ROOM_TYPE_ID)
);


CREATE TABLE DEPARTMENTS(
DEP_ID INT not null,
DEP_NAME VARCHAR(250) not null,
PRIMARY KEY (DEP_ID)
);


CREATE TABLE EMPLOYEES(
EMPLOYEE_ID INT not null,
EMPLOYEE_NAME VARCHAR(50) not null,
EMPLOYEE_SURNAME VARCHAR(50) not null,
EMPLOYEE_PHONE VARCHAR(50),
DEP_ID INT not null,
WORK_TIME INT,
START_DATE date not null,
HOTEL_ID INT not null,
PRIMARY KEY (EMPLOYEE_ID),
FOREIGN KEY (HOTEL_ID) REFERENCES HOTELS (HOTEL_ID),
FOREIGN KEY (DEP_ID) REFERENCES DEPARTMENTS (DEP_ID)
);


CREATE TABLE CUSTOMERS(
CUSTOMER_ID INT not null,
CUSTOMER_NAME VARCHAR(50) not null,
CUSTOMER_SURNAME VARCHAR(50) not null,
CUSTOMER_BIRTHDAY Date,
CUSTOMER_MAILADDRESS VARCHAR(50),
CUSTOMER_PHONE varchar(11),
CUSTOMER_TOWN VARCHAR(50),
CUSTOMER_COUNTRY VARCHAR(50),
PRIMARY KEY (CUSTOMER_ID)
);

CREATE TABLE RESERVATIONS(
RESERVATION_ID INT not null,
RESERVATION_DATE_TIME DATE not null,
HOTEL_ID INT not null,
CUSTOMER_ID INT not null,
PERSON_COUNT INT not null,
TOTAL_PAYMENT DECIMAL(28,8) not null,
HOTEL_ENTRY_TIME DATE not null,
HOTEL_EXIT_TIME DATE not null,
EXTRA_NOTE VARCHAR(4000),
RESERVATION_STATUS VARCHAR(50) not null,
PRIMARY KEY (RESERVATION_ID),
FOREIGN KEY (HOTEL_ID) REFERENCES HOTELS (HOTEL_ID),
FOREIGN KEY (CUSTOMER_ID) REFERENCES CUSTOMERS (CUSTOMER_ID)
);


CREATE TABLE RESERVATION_RESULT(
RESULT_ID INT not null,
RESERVATION_ID INT not null,
CUSTOMER_ENTRY_TIME DATE ,
CUSTOMER_EXIT_TIME DATE ,
CUSTOMER_COMMENT VARCHAR(50),
PRIMARY KEY (RESULT_ID),
FOREIGN KEY (RESERVATION_ID) REFERENCES RESERVATIONS (RESERVATION_ID)
);

INSERT INTO departments values (0,'Front Office Deparment');
INSERT INTO departments values (1,'Housekeeping Deparment');
INSERT INTO departments values (2,'Food and Beverage Service Deparment');
INSERT INTO departments values (3,'Kitchen or Food Production Deparment');
INSERT INTO departments values (4,'Engineering and Maintenance Deparment');
INSERT INTO departments values (5,'Accounts and Credits Deparment');
INSERT INTO departments values (6,'Security Department Deparment');
INSERT INTO departments values (7,'Purchase Department Deparment');
INSERT INTO departments values (8,'Sales and Marketing Department Deparment');
INSERT INTO departments values (9,'Security Department Deparment');

INSERT INTO customers values (0,'John','Galvan','1959-01-01','John@gmail.com','90507032005','Berlin','Germany');
INSERT INTO customers values (1,'Dominique','Casey','1989-06-01','dominiq@gmail.com','90503200005','Paris','France');
INSERT INTO customers values (2,'Ayaan','Mcdaniel','1994-02-09','ayaan@gmail.com','10507210005','San Francisco','USA');
INSERT INTO customers values (3,'Almora','Navarro','1992-06-05','Almora@gmail.com','20507030005','New York','USA');
INSERT INTO customers values (4,'Braylon','Andrade','1959-01-03','Braylon@gmail.com','30507100005','Istanbul','Turkey');
INSERT INTO customers values (5,'Reagan','Ware','1999-07-02','Reagan@gmail.com','90507001005','Istanbul','Turkey');
INSERT INTO customers values (6,'Skyler','Jennings','1989-03-03','Skyler@gmail.com','10527000005','Oakland','USA');
INSERT INTO customers values (7,'Crixus','Joseph','1999-11-05','Crixus@gmail.com','10507004005','Istanbul','Turkey');
INSERT INTO customers values (8,'Xiomara','Meza','2000-04-01','Xiomara@gmail.com','10507000505','Ankara','Turkey');
INSERT INTO customers values (9,'Naten','Evans','2005-01-01','Naten@gmail.com','10507000075','London','UK');
INSERT INTO customers values (10,'Selcuk','Genc','2005-01-01',null,'10507000075','London','UK');

INSERT INTO hotel_room_type values (0,'Single','A room assigned to one person. May have one or more beds.',true,true);
INSERT INTO hotel_room_type values (1,'Double','A room assigned to two people. May have one or more beds.',false,true);
INSERT INTO hotel_room_type values (2,'Triple','A room assigned to three people. May have two or more beds.',false,false);
INSERT INTO hotel_room_type values (3,'Quad','A room assigned to four people. May have two or more beds.',false,true);
INSERT INTO hotel_room_type values (4,'Master Suite','A parlour or living room connected to one or more bedrooms.',false,true);
INSERT INTO hotel_room_type values (5,'Junior Suite',' A single room with a bed and sitting area.',true,true);
INSERT INTO hotel_room_type values (6,'Twin','A room with two beds. May be occupied by one or more people.',true,false);
INSERT INTO hotel_room_type values (7,'King','A room with a king-sized bed. May be occupied by one or more people.',false,true);
INSERT INTO hotel_room_type values (8,'Queen','A room with a queen-sized bed. May be occupied by one or more people.',true,false);
INSERT INTO hotel_room_type values (9,'Mini-Suite','A single room with a bed and sitting area.',true,true);
INSERT INTO hotel_room_type values (10,'Mini-Suite','A single room with a bed and sitting area.',true,true);

INSERT INTO hotels values (0,'Majestic Cabin Resort','Jerusalem','Israel','90507061005','address',true,false,32,true);
INSERT INTO hotels values (1,'Secret Echo Resort','Dhabi','United Arab Emirates','90207032005','address',false,true,15,true);
INSERT INTO hotels values (2,'Sapphire Creek Hotel','Vienna','Austria','90907732655','address',true,false,26,true);
INSERT INTO hotels values (3,'Hilton','Ankara','Turkey','90203032005','address',true,true,3,true);
INSERT INTO hotels values (4,'Spring Nebula Motel','Quito','Ecuador','phone','90507332504',false,false,46,true);
INSERT INTO hotels values (5,'Hilton','Budapest','Hungary','90805231025','address',false,true,7,true);
INSERT INTO hotels values (6,'Marina Horizon Hotel','Baku','Azerbaijan','90527032051','address',true,false,18,true);
INSERT INTO hotels values (7,'Sheraton','Ankara','Turkey','90502012005','address',true,true,20,true);
INSERT INTO hotels values (8,'Pleasant Shield Resort & Spa','Kathmandu','Nepal','90302032038','address',false,false,13,true);
INSERT INTO hotels values (9,'Elder Citadel Motel','Minsk','Belarus','90505032032','address',true,true,8,true);
INSERT INTO hotels values (10,'Sheraton','Ankara','Turkey','90502012005','address',true,true,20,true);
INSERT INTO hotels values (11,'Sheraton','Ankara','Turkey','90502012005','address',true,true,36,false);
INSERT INTO hotels values (12,'Sheraton','Ankara','Turkey','90502012005','address',true,true,40,true);
INSERT INTO hotels values (13,'Maidan','Istanbul','Turkey','90502523032','address',true,true,40,true);

INSERT INTO employees values (0,'Bruce','Galvan','90507032005',1,7,'2008-06-02',2);
INSERT INTO employees values (1,'Dominique','Casey','90503200005',1,8,'2015-01-03',1);
INSERT INTO employees values (2,'Nick','Mcdaniel','10507210005',1,8,'2012-01-06',3);
INSERT INTO employees values (3,'Kimora','Navarro','20507030005',1,8,'2003-02-01',3);
INSERT INTO employees values (4,'Braylon','Andrade','30507100005',1,8,'2020-03-01',9);
INSERT INTO employees values (5,'Jonathan','Ware','90507001005',1,8,'2005-01-01',6);
INSERT INTO employees values (6,'Skyler','Jennings','10527000005',1,8,'2018-02-01',0);
INSERT INTO employees values (7,'Ronnie','Joseph','10507004005',1,8,'2019-06-01',3);
INSERT INTO employees values (8,'Wayne','Meza','10507000505',1,8,'2016-01-06',2);
INSERT INTO employees values (9,'Brice','Evans','10507000075',1,8,'2011-01-02',2);

INSERT INTO hotel_rooms values (0,1,3,4,8,3);
INSERT INTO hotel_rooms values (1,2,3,4,3,2);
INSERT INTO hotel_rooms values (2,7,3,4,4,2);
INSERT INTO hotel_rooms values (3,6,3,4,2,4);
INSERT INTO hotel_rooms values (4,2,3,4,5,2);
INSERT INTO hotel_rooms values (5,5,3,4,6,1);
INSERT INTO hotel_rooms values (6,4,3,4,3,1);
INSERT INTO hotel_rooms values (7,9,3,4,2,1);
INSERT INTO hotel_rooms values (8,0,3,4,2,1);
INSERT INTO hotel_rooms values (9,1,3,4,1,2);

INSERT INTO reservations values (0,'2016-01-01',3,2,5,10000,'2016-03-11','2016-03-14','wants pet service','Confirmed');
INSERT INTO reservations values (1,'2021-01-01',5,0,5,50000,'2021-01-01','2021-01-05','none','Cancelled');
INSERT INTO reservations values (2,'2018-01-01',3,7,5,3000,'2018-03-02','2018-03-08','none','Confirmed');
INSERT INTO reservations values (3,'2021-01-01',7,4,5,1120,'2021-02-05','2021-02-09','demands wake up call','Cancelled');
INSERT INTO reservations values (4,'2016-01-01',3,2,5,7300,'2016-01-12','2016-01-19','none','Waiting List');
INSERT INTO reservations values (5,'2015-01-01',3,0,5,12000,'2015-08-22','2015-08-27','none','Confirmed');
INSERT INTO reservations values (6,'2021-01-01',3,6,5,20400,'2021-06-26','2021-06-29','none','Waiting List');
INSERT INTO reservations values (7,'2021-01-01',3,4,5,72000,'2021-01-16','2021-01-18','needs beverage to room','Cancelled');
INSERT INTO reservations values (8,'2019-01-01',3,9,5,10100,'2019-11-12','2019-11-15','none','Waiting List');
INSERT INTO reservations values (9,'2019-01-01',3,2,5,30070,'2019-02-24','2019-02-26','none','Confirmed');

INSERT INTO reservation_result values (0,0,'2016-03-11','2016-03-15','Average');
INSERT INTO reservation_result values (1,1,'2021-01-01','2021-01-04','Foods could be better');
INSERT INTO reservation_result values (2,2,'2018-03-02','2018-03-06','none');
INSERT INTO reservation_result values (3,3,'2021-02-05','2016-01-011','Excellent');
INSERT INTO reservation_result values (4,4,'2016-01-12','2016-01-14','none');
INSERT INTO reservation_result values (5,5,'2015-08-22','2015-08-27','Cancelled');
INSERT INTO reservation_result values (6,6,'2021-06-26','2021-06-29','none');
INSERT INTO reservation_result values (7,7,'2021-01-16','2021-01-18','none');
INSERT INTO reservation_result values (8,8,'2019-11-12','2019-11-14','Satisfied');
INSERT INTO reservation_result values (9,9,'2019-02-24','2019-02-26','none');


CREATE VIEW ViewDepartment AS
SELECT dep_id ,dep_name 
FROM departments;

insert into ViewDepartment select 11,'Medic';

DELETE FROM hotel_room_type 
WHERE hotel_room_type_id = 10;

DELETE FROM employees 
WHERE employee_name = 'Harley';

DELETE FROM customers 
WHERE customer_name = 'Angelina';

DELETE FROM departments
WHERE dep_name = 'Front Office Deparment';

DELETE FROM hotels 
WHERE hotel_id = 300;

DELETE FROM reservations 
WHERE person_count = 52;

DELETE FROM reservation_result 
WHERE reservation_id = 3;

DELETE FROM hotel_rooms 
WHERE floor_location = 3;

ALTER table employees 
ADD  salary numeric(7);

UPDATE hotel_room_type 
SET jacuzzi = true
WHERE hotel_room_type_id = 0;

UPDATE hotel_rooms 
SET person_count = 5
WHERE hotel_id = 3;

UPDATE customers 
SET customer_name = 'Delgado'
WHERE customer_surname = 'Blevins';

UPDATE departments 
SET dep_id = 17
WHERE dep_id = 5;


UPDATE employees 
SET employee_phone = '90504867864'
WHERE employee_phone = '90507032005';

UPDATE hotels 
SET hotel_breakfast= true
WHERE hotel_breakfast = false;

UPDATE reservation_result 
SET customer_comment = 'cancelled'
WHERE reservation_id =8;

UPDATE reservations 
SET extra_note = 'demands wake up service'
WHERE customer_id  = 4 ;


ALTER TABLE employees DROP COLUMN work_time;


