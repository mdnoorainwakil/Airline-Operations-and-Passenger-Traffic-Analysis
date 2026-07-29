# ✈️ Airline Operations and Passenger Traffic Analysis

## 📌 Project Overview
This project analyzes airline operational performance and passenger traffic using **MySQL** for data analysis and **Power BI** for interactive dashboard development. The dataset contains nearly **16,000+ flight records** with information such as passengers, seats, flights, distance, origin and destination airports, cities, and travel dates. SQL was used to clean, aggregate, and analyze the data using joins, CTEs, window functions, date functions, and aggregation techniques. The processed insights were then visualized in Power BI to build an interactive business dashboard for monitoring passenger demand, airport performance, route efficiency, and operational trends.

---

## 🛠️ Tech Stack
- MySQL
- Power BI
- SQL
- DAX
- Power Query

---

## 📊 Dashboard 1 – Executive Overview

This dashboard provides a high-level summary of airline operations through KPI cards, yearly passenger trends, airport filters, and passenger traffic comparisons between origin and destination airports.


<img width="1432" height="810" alt="Screenshot 2026-07-29 135703" src="https://github.com/user-attachments/assets/5dd8cf13-96a2-4978-aaf6-6e18663c55a8" />

---

## 📈 Dashboard 2 – Route Performance Analysis

This dashboard focuses on route-level analysis, including top passenger routes, total flights by route, airport distribution on the map, and the relationship between route distance and flight activity.

![Route Performance Dashboard](<img width="1421" height="810" alt="Screenshot 2026-07-29 135712" src="https://github.com/user-attachments/assets/23581e8c-c74d-4109-8e19-e5944e94ddb8" />
)

---

## 📉 Dashboard 3 – Advanced Analytics

The final dashboard presents advanced business insights such as average passengers per flight, airport ranking over time, passenger demand versus seat capacity, and the relationship between city population and passenger traffic.

![Advanced Analytics Dashboard](<img width="1436" height="788" alt="Screenshot 2026-07-29 135720" src="https://github.com/user-attachments/assets/3b1cbc46-fbf3-4f1d-a1f0-0680c6b14277" />

---

# 🗄️ SQL Analysis

The analytical layer of this project was developed entirely in MySQL. SQL queries were written to answer real-world business questions related to airline operations and passenger demand.

### Key SQL Analysis
- Route-wise Passenger Analysis
- Seat Utilization Analysis
- Most Frequent Routes
- Origin City Flight Activity
- Seasonal Passenger Trends
- Underutilized Routes
- Most Active Airports
- Airport-wise Passenger Load Factor
- Most & Least Busy Months
- Year-over-Year Passenger Growth
- Flight Growth Trend Analysis
- Reduced Demand Detection
- Underperforming Route Analysis
- Longest Average Distance Routes

---

## 📷 SQL Query Samples

### Seasonal Travel Pattern Analysis
![SQL 1](images/sql_seasonal_travel.png)

### Year-over-Year Passenger Growth (CTE + LAG)
![SQL 2](images/sql_yoy_growth.png)

### Most & Least Busy Months
![SQL 3](images/sql_busy_months.png)

### Flight Route Growth Trend
![SQL 4](images/sql_route_growth.png)

### Longest Average Distance Routes
![SQL 5](images/sql_longest_distance.png)

---

## 📌 Key Insights
- Passenger traffic remained relatively stable across multiple years.
- ORD recorded the highest passenger traffic among origin airports.
- LAS handled the highest passenger traffic among destination airports.
- Average seat utilization remained around **67.83%**.
- Several long-distance routes showed comparatively lower flight frequency.
- Passenger demand and seat capacity were closely aligned across major airports.
- SQL-based trend analysis helped identify seasonal demand patterns and route performance.

---

## 📂 Repository Structure
