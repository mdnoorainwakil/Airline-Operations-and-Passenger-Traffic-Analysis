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

(<img width="1421" height="810" alt="Screenshot 2026-07-29 135712" src="https://github.com/user-attachments/assets/23581e8c-c74d-4109-8e19-e5944e94ddb8" />
)

---

## 📉 Dashboard 3 – Advanced Analytics

The final dashboard presents advanced business insights such as average passengers per flight, airport ranking over time, passenger demand versus seat capacity, and the relationship between city population and passenger traffic.

(<img width="1436" height="788" alt="Screenshot 2026-07-29 135720" src="https://github.com/user-attachments/assets/3b1cbc46-fbf3-4f1d-a1f0-0680c6b14277" />

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
<img width="625" height="455" alt="Screenshot 2026-07-29 134956" src="https://github.com/user-attachments/assets/491258d5-a18d-4b63-8d5c-b74e395c5b12" />


### Year-over-Year Passenger Growth (CTE + LAG)
<img width="1147" height="492" alt="Screenshot 2026-07-29 135103" src="https://github.com/user-attachments/assets/9915fb69-5620-47b1-9361-6f258e34cf02" />
<img width="982" height="258" alt="Screenshot 2026-07-29 135112" src="https://github.com/user-attachments/assets/5ab129c6-62ed-4581-ace7-3571ebe0b242" />


### Most & Least Busy Months
<img width="920" height="538" alt="Screenshot 2026-07-29 135150" src="https://github.com/user-attachments/assets/7e55d415-c2ba-431f-9579-1b49f111180a" />


### Flight Route Growth Trend
<img width="1107" height="533" alt="Screenshot 2026-07-29 135418" src="https://github.com/user-attachments/assets/d792bbd9-095e-4c22-b361-9dbed059d27b" />
<img width="941" height="181" alt="Screenshot 2026-07-29 135429" src="https://github.com/user-attachments/assets/30e79ed6-298e-4576-a9be-75132f8827e0" />


### Longest Average Distance Routes
<img width="917" height="527" alt="Screenshot 2026-07-29 135133" src="https://github.com/user-attachments/assets/49cacc20-33f3-435f-9f82-7a777ec3b96c" />


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
