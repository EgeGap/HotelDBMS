SELECT * FROM hotels;

SELECT * FROM reservation_result;

select *
from hotels h, hotel_rooms h1
where h.hotel_id=h1.hotel_id and h1.hotel_id=3;


/*Special Query 1*/
select c2.customer_name,COUNT(*) as Cancellation
from reservations r, customers c2, hotels h1
where r.reservation_status='Cancelled' and c2.customer_id = r.customer_id and h1.hotel_id=r.hotel_id and (h1.hotel_name='Sheraton' or h1.hotel_name='Hilton') and r.reservation_date_time > (current_date - INTERVAL '12 months') 
group by c2.customer_name
HAVING COUNT(*) >= 2;
select *
from hotels;

/*Special Query 2*/
select *,h1.distance_to_city_center
from hotels h1
where h1.hotel_town='Ankara' and h1.hotel_breakfast= true and h1.hotel_carpark=true and h1.is_located_in_city_center = true
order by h1.distance_to_city_center ASC;

SELECT * FROM customers		/*prints names starting with A*/
WHERE customer_name LIKE 'A%';

SELECT * FROM hotels h2 		/*prints the locations that are not Turkey France or UK*/
WHERE h2.hotel_country NOT IN ('Turkey', 'France', 'UK');

SELECT * FROM hotels h2 		/*prints the locations that are in Germany or Spain*/
WHERE h2.hotel_country IN ('Turkey', 'Spain');


select count(distinct customer_id ) as TotalPassengers  /*This query calculates how many unique customers has made a booking */
from customers;

select LOWER(customers.customer_name) as firstnames /*lists people's first names who booked a room*/
from customers natural join reservations
where customers.customer_id =reservations.customer_id
group by customers.customer_name;


select sum(r2.total_payment ) as totalPaidAmount, c2.customer_name as Name  /*prints the total amount paid by the customers on booking */
from reservations r2, customers c2
where r2.customer_id =c2.customer_id
group by c2.customer_name ;

select avg(r2.total_payment ) as "Average Amount Paid For Booking" /* This query prints the average amount paid for a booking */
from reservations r2, customers c2
where r2.customer_id =c2.customer_id;


select r2.total_payment , c2.customer_name/*top 3 booking made in terms of price*/
from reservations r2, customers c2
where r2.customer_id =c2.customer_id
order by r2.total_payment desc limit 3;


select room_number , bed_count /* shows the room numbers that has more than 1 bed and also display those numbers */
from hotel_rooms hr 
group by room_number , bed_count
having bed_count > 1;

SELECT c2.customer_name ,    /* this query shows the customers that has done a payment that is more than 300 dollars together with his name and surname*/
      c2.customer_surname
FROM customers c2
WHERE EXISTS
    (SELECT 1
     FROM reservations r2
     WHERE r2.customer_id =c2.customer_id
       AND r2.total_payment > 30000 )
ORDER BY c2.customer_name,
         c2.customer_surname;
        
select c2.customer_phone ,c2.customer_name /* Shows the phone number of a customer whose email is null*/
from customers c2
where c2.customer_mailaddress is null;

select h.hotel_country , h.hotel_town /* This query shows all the hotel's country and city that hotel name is not null*/
from hotels h 
where h.hotel_name is not null;

SELECT customer_id , total_payment /* prints the customer id and the total amount which made a booking that has a price between 4000 and 5000*/
FROM reservations r2 
WHERE total_payment  between 4000 and 10000;


select max(r.total_payment )/* This query finds the maximum amount that is in the reservation table*/
from reservations r ;

select min(r.total_payment )/* This query finds the minimum amount that is in the reservation table*/
from reservations r ;

SELECT customer_comment    /*shows the customer comments of the resevations where the total payment is between 2000 and 20000*/
from reservation_result rr 
WHERE rr.reservation_id = some (SELECT r1.reservation_id FROM reservations r1
						WHERE r1.total_payment between 2000 and 20000);
					
SELECT * FROM hotel_rooms hr where hr.person_count =1 /* selects all the hotel rooms that has id number of 1 and not 3*/
UNION
SELECT * FROM hotel_rooms hr where hr.person_count !=3;
					
SELECT e2.employee_id, e2.employee_name , e2.employee_surname FROM employees e2 /* selects all the employees except that has employee id not euqal to 5*/
EXCEPT
SELECT e2.employee_id, e2.employee_name , e2.employee_surname FROM employees e2 where e2.employee_id =5;

SELECT * FROM employees e2 where employee_id between 2 and 4/* find the conductor that has id of 3-5 and 1-10 intersection*/
INTERSECT 
SELECT * FROM employees e2 where employee_id between 3 and 8;

select   /*takes the first letter of the name and prints it as inital*/
	c2.customer_name  ,
	SUBSTRING( c2.customer_name, 1, 1 ) AS initial
FROM
	customers c2
ORDER BY
	c2.customer_surname;


select        /*lists the customer details and the prices they paid for booking*/
	r2.total_payment ,
	c2.customer_name ,
	c2.customer_surname 
FROM
	customers c2
INNER JOIN reservations r2
    ON r2.customer_id =c2.customer_id
ORDER BY r2.reservation_date_time ;

SELECT rr.reservation_id ,rr.customer_entry_time /* shows the reservation id and customer entry times using joins*/
FROM reservation_result rr  
LEFT OUTER JOIN reservations rr2
ON rr2.reservation_id =rr.reservation_id ;


   
select hr.room_number , hr.person_count /*shows the rooms that has more more than average capacity*/
from hotel_rooms hr 
where hr.person_count > all (select ROUND(AVG (hr2.person_count ), 2) from hotel_rooms hr2 );