\# Public Transport Delay \& Route Efficiency Analysis

\## 📌 Project Overview

This project analyzes public transport trip data using SQL Server to understand route performance, passenger demand, and operational delays.

The analysis focuses on identifying high-demand routes, delayed routes, peak passenger-demand periods, and routes that may require operational improvement.

\---

\## 🎯 Project Objective

The main objectives of this project are:

\- Analyze passenger demand across different routes

\- Calculate departure delays for individual trips

\- Identify routes with high average delays

\- Find routes with both high passenger demand and high delays

\- Identify peak passenger-demand hours

\- Rank routes based on passenger demand and delays

\- Classify routes based on their overall performance

\- Generate business insights from transportation data

\---

\## 🗂️ Dataset

The project contains two relational tables:

\### 1. `routes`

Stores information about public transport routes.

| Column | Description |

|---|---|

| `route\_id` | Unique route identifier |

| `route\_name` | Name of the route |

| `start\_point` | Starting location |

| `end\_point` | Destination |

| `distance\_km` | Route distance in kilometers |

| `vehicle\_type` | Type of vehicle |

\### 2. `trips`

Stores individual trip and operational information.

| Column | Description |

|---|---|

| `trip\_id` | Unique trip identifier |

| `route\_id` | Route associated with the trip |

| `trip\_date` | Date of the trip |

| `scheduled\_departure` | Planned departure time |

| `actual\_departure` | Actual departure time |

| `scheduled\_arrival` | Planned arrival time |

| `actual\_arrival` | Actual arrival time |

| `passenger\_count` | Number of passengers |

| `trip\_status` | Trip completion status |

The dataset contains \*\*40 trips across 10 routes over 4 days\*\*.

\---

\## 🛠️ Tools \& Technologies

\- SQL Server

\- SQL Server Management Studio (SSMS)

\- GitHub

\---

\## 🧠 SQL Concepts Used

This project demonstrates practical SQL concepts including:

\- SELECT statements

\- Aggregate functions

\- GROUP BY

\- HAVING

\- INNER JOIN

\- CASE statements

\- Subqueries

\- Common Table Expressions (CTEs)

\- Window functions

\- RANK()

\- DATEDIFF()

\- DATEPART()

\- Data aggregation

\- Conditional classification

\---

\## 🔍 Business Questions

The project answers the following business questions:

1\. Which routes have the highest passenger demand?

2\. Which trips experience the highest departure delays?

3\. Which routes have the highest average delay?

4\. Which routes have both high passenger demand and high delays?

5\. What is the peak passenger-demand hour?

6\. Which routes have above-average passenger demand?

7\. How do routes rank based on passenger demand?

8\. How do routes rank based on average delay?

9\. Which routes demonstrate good performance?

10\. Which routes require operational improvement?

\---

\## 📊 Key Analysis

\### Passenger Demand

Passenger demand is aggregated at route level to identify the busiest routes.

The analysis shows that:

\- \*\*Route 105\*\* has the highest passenger demand with \*\*883 passengers\*\*.

\- \*\*Route 110\*\* has the second-highest demand with \*\*805 passengers\*\*.

\- \*\*Route 106\*\* has the third-highest demand with \*\*756 passengers\*\*.

\### Route Delays

Average departure delay is calculated using the difference between scheduled and actual departure times.

The analysis identifies \*\*Route 106\*\* and \*\*Route 109\*\* as important routes for delay investigation.

\### High-Demand \& High-Delay Routes

Routes with more than 500 passengers and an average delay above 10 minutes are considered high-priority routes.

The analysis identifies:

\- \*\*Route 106 — 756 passengers, 18-minute average delay\*\*

\- \*\*Route 109 — 535 passengers, 15-minute average delay\*\*

These routes may require additional operational attention because delays affect a relatively large number of passengers.

\---

\## 📈 Route Performance Classification

Routes are classified using passenger demand and average delay.

The classification includes:

\- \*\*High Demand - Good Performance\*\*

\- \*\*High Demand - Delayed\*\*

\- \*\*Low Demand - Good Performance\*\*

\- \*\*Low Demand - Delayed\*\*

This classification helps convert raw SQL results into practical business insights.

\---

\## 💡 Business Insights

The analysis can help transport operators:

\- Prioritize routes with frequent delays

\- Focus improvement efforts on high-demand routes

\- Understand passenger-demand patterns

\- Identify peak operating periods

\- Improve schedule planning

\- Allocate transport resources more effectively

\- Monitor route-level operational performance

\---

\## 📁 Project Structure

```text

Public-Transport-Delay-Analysis/

│

├── transport\_analysis.sql

├── README.md

│

└── screenshots/

&#x20;   ├── 01\_database\_tables.png

&#x20;   ├── 02\_trip\_data.png

&#x20;   ├── 03\_delay\_analysis.png

&#x20;   └── 04\_final\_route\_performance.png

