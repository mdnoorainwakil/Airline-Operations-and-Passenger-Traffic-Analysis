create database airport_db;
USE airport_db;

SELECT *
FROM airport2;


show databases;
 -- problem 01
 
 select origin_airport,
 destination_airport,
 sum(passengers) as total_passengers

 from airport2 
 group by origin_airport,
 destination_airport;
 
 
 -- problem -2  HEIGHEST AND LOWEST SEAT OCCUPENCY :

SELECT
    Origin_airport,
    Destination_airport,
    AVG(CAST(Passengers AS FLOAT) / NULLIF(Seats, 0)) * 100 AS avg_seat_utilization
FROM airport2
GROUP BY
    Origin_airport,
    Destination_airport
ORDER BY
    avg_seat_utilization DESC;
    
    
-- Problem 3 FIND OUT MOST FREQUENT ROUTE;

select origin_airport,
 destination_airport,
 sum(passengers) as total_passengers
 
from airport2
GROUP BY
    Origin_airport,
    Destination_airport
order by total_passengers DESC;

-- PROBLEM 4 FINDOUT ACTIVITY LEVEL AT VARIOUS ORIGIN CITIES:

select origin_city,
count(flights) as total_flights,
sum(passengers) as total_passengers
 
 from airport2 
 group by origin_city
 
order by total_passengers DESC;

SELECT COUNT(DISTINCT Origin_city) AS total_unique_origin_cities
FROM airport2;

-- PROBLEM 5 IDENTIFY TRAVEL PATTERN 

select origin_airport, sum(distance) as total_distance
from airport2 
group by origin_airport
order by total_distance;

-- PROBLEM 6 SEASONAL TREND 

SELECT
YEAR(STR_TO_DATE(fly_date,'%m/%d/%Y')) AS Year,
MONTH(STR_TO_DATE(fly_date,'%m/%d/%Y')) AS Month,
COUNT(Flights) AS Total_Flights,
SUM(Passengers) AS Total_Passengers,
AVG(Distance) AS Avg_Distance
FROM airport2
GROUP BY
YEAR(STR_TO_DATE(fly_date,'%m/%d/%Y')),
MONTH(STR_TO_DATE(fly_date,'%m/%d/%Y'))
ORDER BY Total_Passengers DESC;

-- PROBLEM 7 IDENTIFY UNDERUTILIZED ROUTE:

 select origin_airport,
 destination_airport, sum(passengers) as Total_Passengers,
 sum(seats) as Total_seats,
 (sum(passengers) *1.0 / nullif(sum(seats),0)) Passengers_to_seats_ratio
 from airport2
 
 group by origin_airport,
 destination_airport
 having Passengers_to_seats_ratio < 0.7
 
 order by Passengers_to_seats_ratio;
 
 -- PROBLEM 08  FINDING MOST ACTIVE AIRPORT:
 select origin_airport, 
 count(flights) as Total_flights
 from airport2
 
 group by origin_airport
 order by Total_flights DESC
 limit 5  ;
 
 -- PROBLEM 9 FLIGHT DISTRIBUTION  AT ONE AIRPORT
 
 select origin_city, 
 count(flights) as Total_flights,
 sum(passengers) as Total_Passengers
 from airport2
 where 
 destination_city = "Bend, OR" and 
 origin_city <> "Bend, OR"
 group by origin_city
 order by Total_flights DESC;
 
-- PROBLEM 10 MAXIMUM EXTENSIVE TRAVEL CONNECTION(MAX DISTANCE)
select origin_airport,
destination_airport,
max(distance) as long_distance

from airport2 
group by origin_airport,destination_airport
order by long_distance DESC
limit 1;


-- PROBLEM 11    Identify the Most and Least Busy Months Based on Total Flights
 
WITH Monthly_flights as
(select 
MONTH(STR_TO_DATE(fly_date,'%m/%d/%Y')) AS Month,
count(flights) as Total_flights
from airport2 
group by 
MONTH(STR_TO_DATE(fly_date,'%m/%d/%Y'))
)
select Month, Total_flights,
CASE
when Total_flights = (select Max(Total_flights) from Monthly_flights) then 'MOST BUSY'
when Total_flights = (select Min(Total_flights) from Monthly_flights) then 'LEAST BUSY'
ELSE NULL
END AS STATUS 
from Monthly_flights
where Total_flights = (select Max(Total_flights) from Monthly_flights) OR
Total_flights = (select Min(Total_flights) from Monthly_flights) ;

-- PROBLEM- 12  Year-over-Year Passenger Growth Analysis by Flight Route

with passenger_summary as 
(select origin_airport, destination_airport,
Year(STR_TO_DATE(fly_date,'%m/%d/%Y')) AS Year,
sum(passengers) as Total_Passengers
from airport2 
group by origin_airport, destination_airport, 
year(STR_TO_DATE(fly_date,'%m/%d/%Y'))),

passengers_growth as(
select origin_airport, destination_airport,
Year, total_passengers,
lag(total_passengers) over (partition by origin_airport, destination_airport order by year) as previous_year_passengers
from passenger_summary)

select  
origin_airport, destination_airport,
Year, total_passengers, 
CASE
when previous_year_passengers is not null then
((total_passengers-previous_year_passengers) * 100.0/ nullif(previous_year_passengers,0))
end as growth_percentage

from passengers_growth
order by 
origin_airport, destination_airport,
Year; 

-- PROBLEM 13 IDENTIFY CONSISTENT ROUTES (TRENDING ROUTES) : 

with flight_summary as (
select origin_airport, destination_airport,
Year(STR_TO_DATE(fly_date,'%m/%d/%Y')) AS Year,
count(flights) as total_flights
from airport2
group by origin_airport, destination_airport, 
year(STR_TO_DATE(fly_date,'%m/%d/%Y'))),

flight_growth as 
(select origin_airport, destination_airport, Year,total_flights,
lag(total_flights) over (partition by origin_airport, destination_airport order by year) as previous_year_flights 
from flight_summary )

select origin_airport, destination_airport, 
Year, 
total_flights,
CASE WHEN previous_year_flights is not null and previous_year_flights  > 0 then 
((total_flights - previous_year_flights ) * 100.0/ previous_year_flights )
else NULL 
end as Growth_Rate,

CASE WHEN previous_year_flights is not null and  total_flights > previous_year_flights  then 
1
else 0
end as Growth_Indicator
from  flight_growth;

-- PROBLEM 14 Airport-wise Passenger Load Factor Analysis

select 
origin_airport,
sum(passengers) as Total_Passengers,
sum(seats) as Total_seats,
count(flights) as Total_flights,
round((sum(passengers) * 100.0 /nullif (sum(seats),0)), 2) as passenegrs_seat_ratio
from airport2
group by origin_airport
order by  passenegrs_seat_ratio  DESC ;

-- PROBLEM 15 SEASONAL TRAVEL PATTERN ( BASIS ON CITIES)
SELECT
    Origin_City,
    YEAR(STR_TO_DATE(fly_date, '%m/%d/%Y')) AS Year,
    MONTHNAME(STR_TO_DATE(fly_date, '%m/%d/%Y')) AS Month,
    SUM(Passengers) AS Total_Passengers
FROM airport2
GROUP BY
    Origin_City,
    YEAR(STR_TO_DATE(fly_date, '%m/%d/%Y')),
    MONTH(STR_TO_DATE(fly_date, '%m/%d/%Y')),
    MONTHNAME(STR_TO_DATE(fly_date, '%m/%d/%Y'))
ORDER BY
    Origin_City,
    Total_Passengers DESC;
    
    
-- PROBLEM 16 IDENTIFY REDUCED DEMAND :
with yearly_passenger_count as 
(select origin_airport,  destination_airport,
    YEAR(STR_TO_DATE(fly_date, '%m/%d/%Y')) AS Year,
    SUM(Passengers) AS Total_Passengers
    from airport2
    
group by 
    origin_airport,
    Destination_airport,
    YEAR(STR_TO_DATE(fly_date, '%m/%d/%Y'))),
    
yearly_decline as(select 
y1.origin_airport, y1.destination_airport, y1.year year1,
y1.Total_Passengers passengers_year1,
y2.year year2,
y2.Total_Passengers passengers_year2,
((y2.Total_Passengers - y1.Total_Passengers) / nullif(y1.Total_Passengers, 0)) * 100 percentage_change

from yearly_passenger_count y1 
join yearly_passenger_count y2
on y1.origin_airport = y2.origin_airport 
and y1.destination_airport = y2.destination_airport
and y1. year = y2.year+1)

select
origin_airport, destination_airport, year1,
passengers_year1,
year2,
passengers_year2,
percentage_change

from yearly_decline
where percentage_change < 0 
order by percentage_change DESC
limit 5 ;

-- 	PROBLEM-17 HEIGHLIGHTS THE UNDERPERFORMING ROUTES:
SELECT
    origin_airport,
    destination_airport,
    SUM(passengers) AS Total_Passengers,
    SUM(seats) AS Total_Seats,
    sum(flights) as total_flights,
    ROUND((SUM(passengers) * 100.0 / NULLIF(SUM(seats), 0)), 2) AS Seat_Utilization_Percentage
FROM airport2
GROUP BY origin_airport, destination_airport
HAVING Seat_Utilization_Percentage < 70
ORDER BY Seat_Utilization_Percentage ASC;



-- PROBLEM-19 Longest Average Distance Route :
WITH distance_stat AS (
    SELECT
        origin_city,
        destination_city,
        AVG(distance) AS avg_flight_distance
    FROM airport2
    GROUP BY
        origin_city,
        destination_city
)

SELECT
    origin_city,
    destination_city,
    ROUND(avg_flight_distance, 2) AS Avg_Flight_Distance
FROM distance_stat
ORDER BY avg_flight_distance DESC
LIMIT 5;


WITH route_performance AS (
    SELECT
        origin_airport,
        destination_airport,
        AVG(distance) AS Avg_Distance,
        SUM(flights) AS Total_Flights,
        SUM(passengers) AS Total_Passengers
    FROM airport2
    GROUP BY
        origin_airport,
        destination_airport
)

SELECT
    origin_airport,
    destination_airport,
    ROUND(Avg_Distance,2) AS Avg_Distance,
    Total_Flights,
    Total_Passengers
FROM route_performance
ORDER BY
    Avg_Distance DESC,
    Total_Flights DESC,
    Total_Passengers DESC
LIMIT 10;

-- PROBLEM 19 Identify the most significant flight routes based on flight frequency and average travel distance.

WITH route_distance AS (
    SELECT
        origin_airport,
        destination_airport,
        SUM(flights) AS total_flights,
        AVG(distance) AS avg_distance
    FROM airport2
    GROUP BY
        origin_airport,
        destination_airport
),

weighted_route AS (
    SELECT
        origin_airport,
        destination_airport,
        total_flights,
        avg_distance,
        total_flights * avg_distance AS weighted_distance
    FROM route_distance
)

SELECT
    origin_airport,
    destination_airport,
    total_flights,
    ROUND(avg_distance, 2) AS avg_distance,
    ROUND(weighted_distance, 2) AS weighted_distance
FROM weighted_route
ORDER BY weighted_distance DESC
LIMIT 5;