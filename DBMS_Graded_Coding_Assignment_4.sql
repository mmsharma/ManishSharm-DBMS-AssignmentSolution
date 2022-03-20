Notes - gca4 denotes the database name
1. 
CREATE TABLE passenger (
  PASSENGER_NAME varchar(45) DEFAULT NULL,
  CATEGORY varchar(45) DEFAULT NULL,
  GENDER varchar(45) DEFAULT NULL,
  BOARDING_CITY varchar(45) DEFAULT NULL,
  DESTINATION_CITY varchar(45) DEFAULT NULL,
  DISTANCE int DEFAULT NULL,
  BUS_TYPE varchar(45) DEFAULT NULL,
  ID int NOT NULL,
  PRIMARY KEY (ID)
) 
2. 
CREATE TABLE price (
  ID int NOT NULL,
  BUS_TYPE varchar(45) DEFAULT NULL,
  DISTANCE int DEFAULT NULL,
  PRICE int DEFAULT NULL,
  PRIMARY KEY (ID)
) 
3. 
select gender, count(*) from gca4.passenger where distance >=600
group by gender;

4. 
select min(price) from gca4.price where bus_type = 'Sleeper';

5. 
select passenger_name from gca4.passenger where passenger_name like 'S%';

6. 
select passenger.passenger_name, passenger.boarding_city, passenger.destination_city, passenger.bus_type, price.price
from gca4.passenger 
inner join gca4.price
 on passenger.bus_type = price.bus_type
 and passenger.distance = price.distance;

7.
 select passenger.passenger_name, price.price
from gca4.passenger 
inner join gca4.price
 on passenger.bus_type = price.bus_type
 and passenger.distance = price.distance
 where passenger.bus_type = 'Sitting'
 and passenger.distance =1000;

8.
select passenger.passenger_name, price.bus_type,price.price
from gca4.passenger 
inner join gca4.price
 on passenger.bus_type = price.bus_type
 and passenger.distance = price.distance
 where boarding_city = 'Bengaluru'
 and passenger.destination_city ='Panaji';

9.
 select distinct distance from gca4.passenger order by distance desc;

10.
select passenger_name, 
 distance/total_distance from gca4.passenger,
 (select sum(distance) as total_distance from gca4.passenger) total_table;

11. 
 select distance, price,
 case when price > 1000
 then 'Expensive'
 when price > 500 && price < 1000
 then 'Average Cost'
 else
 'Cheap'
 end as price_category
 from gca4.price;
