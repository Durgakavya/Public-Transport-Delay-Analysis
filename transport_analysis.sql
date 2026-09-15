/*
===========================================================
PROJECT: Public Transport Delay & Route Efficiency Analysis
DATABASE: SQL Server
AUTHOR: G. Durga Kavya
PURPOSE: Analyze route performance, passenger demand,
         and public transport delays using SQL.
===========================================================
*/

-- =========================================================
-- STEP 1: PROJECT OVERVIEW
-- =========================================================
-- Business objective:
-- Analyze public transport trips to identify:
-- 1. Departure delays
-- 2. Passenger demand by route
-- 3. High-demand and delayed routes
-- 4. Route performance
-- 5. Peak passenger-demand hours

-- =========================================================
-- STEP 2: DATABASE STRUCTURE
-- =========================================================
-- Tables:
-- routes : Route master information
-- trips  : Individual trip and operational information

-- =========================================================
-- STEP 3: CREATE DATABASE
-- =========================================================

CREATE DATABASE PublicTransportAnalysis;
GO

USE PublicTransportAnalysis;
GO

-- =========================================================
-- STEP 4: CREATE ROUTES TABLE AND INSERT ROUTE DATA
-- =========================================================

CREATE TABLE routes
(
    route_id INT PRIMARY KEY,
    route_name VARCHAR(100),
    start_point VARCHAR(100),
    end_point VARCHAR(100),
    distance_km DECIMAL(6,2),
    vehicle_type VARCHAR(30)
);
GO

INSERT INTO routes
(route_id, route_name, start_point, end_point, distance_km, vehicle_type)
VALUES
(101, 'Route 101', 'KPHB', 'Ameerpet', 12.50, 'Bus'),
(102, 'Route 102', 'Miyapur', 'Secunderabad', 18.20, 'Bus'),
(103, 'Route 103', 'LB Nagar', 'Mehdipatnam', 16.40, 'Bus'),
(104, 'Route 104', 'Kukatpally', 'Hitech City', 10.80, 'Bus'),
(105, 'Route 105', 'Uppal', 'Madhapur', 15.60, 'Metro'),
(106, 'Route 106', 'Nagole', 'Ameerpet', 14.30, 'Metro'),
(107, 'Route 107', 'Gachibowli', 'Secunderabad', 25.70, 'Bus'),
(108, 'Route 108', 'Begumpet', 'Mehdipatnam', 11.90, 'Bus'),
(109, 'Route 109', 'Kondapur', 'Uppal', 22.40, 'Bus'),
(110, 'Route 110', 'Madhapur', 'LB Nagar', 20.10, 'Metro');
GO

-- =========================================================
-- STEP 5: CREATE TRIPS TABLE
-- =========================================================

CREATE TABLE trips
(
    trip_id INT PRIMARY KEY,
    route_id INT,
    trip_date DATE,
    scheduled_departure TIME,
    actual_departure TIME,
    scheduled_arrival TIME,
    actual_arrival TIME,
    passenger_count INT,
    trip_status VARCHAR(20),
    FOREIGN KEY (route_id) REFERENCES routes(route_id)
);
GO

-- =========================================================
-- STEP 6: INSERT TRIP DATA
-- =========================================================

INSERT INTO trips
(trip_id, route_id, trip_date, scheduled_departure, actual_departure,
 scheduled_arrival, actual_arrival, passenger_count, trip_status)
VALUES
(5001, 101, '2026-09-01', '07:00:00', '07:05:00', '07:45:00', '07:52:00', 82, 'Completed'),
(5002, 102, '2026-09-01', '07:30:00', '07:42:00', '08:30:00', '08:48:00', 115, 'Completed'),
(5003, 103, '2026-09-01', '08:00:00', '08:03:00', '08:50:00', '08:55:00', 96, 'Completed'),
(5004, 104, '2026-09-01', '08:15:00', '08:20:00', '09:00:00', '09:08:00', 125, 'Completed'),
(5005, 105, '2026-09-01', '09:00:00', '09:01:00', '09:40:00', '09:42:00', 210, 'Completed'),
(5006, 106, '2026-09-01', '09:30:00', '09:45:00', '10:15:00', '10:35:00', 185, 'Completed'),
(5007, 107, '2026-09-01', '10:00:00', '10:08:00', '11:10:00', '11:25:00', 78, 'Completed'),
(5008, 108, '2026-09-01', '11:00:00', '11:02:00', '11:45:00', '11:49:00', 64, 'Completed'),
(5009, 109, '2026-09-01', '12:00:00', '12:18:00', '13:10:00', '13:35:00', 132, 'Completed'),
(5010, 110, '2026-09-01', '13:00:00', '13:05:00', '13:55:00', '14:05:00', 198, 'Completed'),
(5011, 101, '2026-09-02', '07:00:00', '07:12:00', '07:45:00', '08:00:00', 91, 'Completed'),
(5012, 102, '2026-09-02', '07:30:00', '07:35:00', '08:30:00', '08:40:00', 108, 'Completed'),
(5013, 103, '2026-09-02', '08:00:00', '08:10:00', '08:50:00', '09:05:00', 103, 'Completed'),
(5014, 104, '2026-09-02', '08:15:00', '08:18:00', '09:00:00', '09:07:00', 118, 'Completed'),
(5015, 105, '2026-09-02', '09:00:00', '09:04:00', '09:40:00', '09:47:00', 225, 'Completed'),
(5016, 106, '2026-09-02', '09:30:00', '09:50:00', '10:15:00', '10:40:00', 192, 'Completed'),
(5017, 107, '2026-09-02', '10:00:00', '10:05:00', '11:10:00', '11:18:00', 83, 'Completed'),
(5018, 108, '2026-09-02', '11:00:00', '11:06:00', '11:45:00', '11:55:00', 71, 'Completed'),
(5019, 109, '2026-09-02', '12:00:00', '12:20:00', '13:10:00', '13:40:00', 140, 'Completed'),
(5020, 110, '2026-09-02', '13:00:00', '13:02:00', '13:55:00', '14:01:00', 205, 'Completed'),
(5021, 101, '2026-09-03', '07:00:00', '07:08:00', '07:45:00', '07:55:00', 88, 'Completed'),
(5022, 102, '2026-09-03', '07:30:00', '07:50:00', '08:30:00', '08:55:00', 121, 'Completed'),
(5023, 103, '2026-09-03', '08:00:00', '08:05:00', '08:50:00', '08:58:00', 99, 'Completed'),
(5024, 104, '2026-09-03', '08:15:00', '08:25:00', '09:00:00', '09:15:00', 127, 'Completed'),
(5025, 105, '2026-09-03', '09:00:00', '09:03:00', '09:40:00', '09:45:00', 218, 'Completed'),
(5026, 106, '2026-09-03', '09:30:00', '09:55:00', '10:15:00', '10:48:00', 201, 'Completed'),
(5027, 107, '2026-09-03', '10:00:00', '10:15:00', '11:10:00', '11:35:00', 81, 'Completed'),
(5028, 108, '2026-09-03', '11:00:00', '11:04:00', '11:45:00', '11:51:00', 69, 'Completed'),
(5029, 109, '2026-09-03', '12:00:00', '12:10:00', '13:10:00', '13:25:00', 135, 'Completed'),
(5030, 110, '2026-09-03', '13:00:00', '13:10:00', '13:55:00', '14:12:00', 190, 'Completed'),
(5031, 101, '2026-09-04', '07:00:00', '07:03:00', '07:45:00', '07:50:00', 79, 'Completed'),
(5032, 102, '2026-09-04', '07:30:00', '07:45:00', '08:30:00', '08:52:00', 117, 'Completed'),
(5033, 103, '2026-09-04', '08:00:00', '08:02:00', '08:50:00', '08:54:00', 94, 'Completed'),
(5034, 104, '2026-09-04', '08:15:00', '08:22:00', '09:00:00', '09:10:00', 122, 'Completed'),
(5035, 105, '2026-09-04', '09:00:00', '09:02:00', '09:40:00', '09:45:00', 230, 'Completed'),
(5036, 106, '2026-09-04', '09:30:00', '09:42:00', '10:15:00', '10:32:00', 178, 'Completed'),
(5037, 107, '2026-09-04', '10:00:00', '10:10:00', '11:10:00', '11:30:00', 85, 'Completed'),
(5038, 108, '2026-09-04', '11:00:00', '11:01:00', '11:45:00', '11:48:00', 66, 'Completed'),
(5039, 109, '2026-09-04', '12:00:00', '12:15:00', '13:10:00', '13:32:00', 128, 'Completed'),
(5040, 110, '2026-09-04', '13:00:00', '13:04:00', '13:55:00', '14:06:00', 212, 'Completed');
GO

-- =========================================================
-- STEP 7: VERIFY THE DATA
-- =========================================================

SELECT *
FROM trips
ORDER BY trip_id;

SELECT COUNT(*) AS total_trips
FROM trips;

SELECT
    route_id,
    COUNT(*) AS trip_count
FROM trips
GROUP BY route_id
ORDER BY route_id;

-- =========================================================
-- STEP 8: CALCULATE DEPARTURE DELAY
-- =========================================================

SELECT
    trip_id,
    route_id,
    DATEDIFF(
        MINUTE,
        scheduled_departure,
        actual_departure
    ) AS departure_delay_minutes
FROM trips;

-- =========================================================
-- STEP 9: FIND THE MOST DELAYED TRIPS
-- =========================================================

SELECT TOP 5
    trip_id,
    route_id,
    scheduled_departure,
    actual_departure,
    DATEDIFF(
        MINUTE,
        scheduled_departure,
        actual_departure
    ) AS departure_delay_minutes
FROM trips
ORDER BY departure_delay_minutes DESC;

-- =========================================================
-- STEP 10: ROUTES WITH AVERAGE DELAY ABOVE 10 MINUTES
-- =========================================================

SELECT
    r.route_name,
    AVG(
        DATEDIFF(
            MINUTE,
            t.scheduled_departure,
            t.actual_departure
        )
    ) AS avg_delay
FROM trips AS t
INNER JOIN routes AS r
    ON t.route_id = r.route_id
GROUP BY r.route_name
HAVING AVG(
        DATEDIFF(
            MINUTE,
            t.scheduled_departure,
            t.actual_departure
        )
    ) > 10
ORDER BY avg_delay DESC;

-- =========================================================
-- STEP 11: TOTAL PASSENGERS BY ROUTE
-- =========================================================

SELECT
    route_id,
    SUM(passenger_count) AS total_passengers
FROM trips
GROUP BY route_id
ORDER BY total_passengers DESC;

-- =========================================================
-- STEP 12: TOTAL PASSENGERS WITH ROUTE NAMES (JOIN)
-- =========================================================

SELECT
    r.route_name,
    SUM(t.passenger_count) AS total_passengers
FROM trips AS t
INNER JOIN routes AS r
    ON t.route_id = r.route_id
GROUP BY r.route_name
ORDER BY total_passengers DESC;

-- =========================================================
-- STEP 13: AVERAGE DELAY + PASSENGER DEMAND
-- =========================================================

SELECT
    r.route_name,
    SUM(t.passenger_count) AS total_passengers,
    AVG(
        DATEDIFF(
            MINUTE,
            t.scheduled_departure,
            t.actual_departure
        )
    ) AS avg_delay
FROM trips AS t
INNER JOIN routes AS r
    ON t.route_id = r.route_id
GROUP BY r.route_name
ORDER BY avg_delay DESC;

-- =========================================================
-- STEP 14: HIGH-DEMAND + HIGH-DELAY ROUTES
-- =========================================================

SELECT
    r.route_name,
    SUM(t.passenger_count) AS total_passengers,
    AVG(
        DATEDIFF(
            MINUTE,
            t.scheduled_departure,
            t.actual_departure
        )
    ) AS avg_delay
FROM trips AS t
INNER JOIN routes AS r
    ON t.route_id = r.route_id
GROUP BY r.route_name
HAVING
    SUM(t.passenger_count) > 500
    AND
    AVG(
        DATEDIFF(
            MINUTE,
            t.scheduled_departure,
            t.actual_departure
        )
    ) > 10
ORDER BY avg_delay DESC;

-- =========================================================
-- STEP 15: BUSINESS INSIGHT
-- =========================================================
-- Routes identified in Step 14 are high-priority routes
-- because they combine strong passenger demand with
-- significant departure delays.

-- =========================================================
-- STEP 16: CLASSIFY ROUTES BY AVERAGE DELAY
-- =========================================================

SELECT
    delay_category,
    COUNT(*) AS route_count
FROM
(
    SELECT
        r.route_name,
        AVG(
            DATEDIFF(
                MINUTE,
                t.scheduled_departure,
                t.actual_departure
            )
        ) AS avg_delay,
        CASE
            WHEN AVG(
                DATEDIFF(
                    MINUTE,
                    t.scheduled_departure,
                    t.actual_departure
                )
            ) > 15 THEN 'Severe Delay'
            WHEN AVG(
                DATEDIFF(
                    MINUTE,
                    t.scheduled_departure,
                    t.actual_departure
                )
            ) >= 10 THEN 'Moderate Delay'
            ELSE 'Low Delay'
        END AS delay_category
    FROM trips AS t
    INNER JOIN routes AS r
        ON t.route_id = r.route_id
    GROUP BY r.route_name
) AS route_delays
GROUP BY delay_category
ORDER BY route_count DESC;

-- =========================================================
-- STEP 17: FIND THE PEAK PASSENGER-DEMAND HOUR
-- =========================================================

SELECT
    DATEPART(HOUR, scheduled_departure) AS departure_hour,
    SUM(passenger_count) AS total_passengers
FROM trips
GROUP BY DATEPART(HOUR, scheduled_departure)
ORDER BY total_passengers DESC;

-- =========================================================
-- STEP 18: TRIP STATUS COUNT
-- =========================================================

SELECT
    trip_status,
    COUNT(*) AS total_trips
FROM trips
GROUP BY trip_status
ORDER BY total_trips DESC;

-- =========================================================
-- STEP 19: TRIP STATUS PERCENTAGE
-- =========================================================

SELECT
    trip_status,
    COUNT(*) AS total_trips,
    CAST(
        COUNT(*) * 100.0 /
        SUM(COUNT(*)) OVER()
        AS DECIMAL(5,2)
    ) AS percentage_of_trips
FROM trips
GROUP BY trip_status
ORDER BY total_trips DESC;

-- =========================================================
-- STEP 20: RANK ROUTES BY PASSENGER DEMAND
-- =========================================================

SELECT
    r.route_name,
    SUM(t.passenger_count) AS total_passengers,
    RANK() OVER (
        ORDER BY SUM(t.passenger_count) DESC
    ) AS passenger_rank
FROM trips AS t
INNER JOIN routes AS r
    ON t.route_id = r.route_id
GROUP BY r.route_name
ORDER BY passenger_rank;

-- =========================================================
-- STEP 21: RANK ROUTES BY AVERAGE DELAY
-- =========================================================

SELECT
    r.route_name,
    AVG(
        DATEDIFF(
            MINUTE,
            t.scheduled_departure,
            t.actual_departure
        )
    ) AS avg_delay,
    RANK() OVER (
        ORDER BY AVG(
            DATEDIFF(
                MINUTE,
                t.scheduled_departure,
                t.actual_departure
            )
        ) DESC
    ) AS delay_rank
FROM trips AS t
INNER JOIN routes AS r
    ON t.route_id = r.route_id
GROUP BY r.route_name
ORDER BY delay_rank;

-- =========================================================
-- STEP 22: ROUTE PERFORMANCE SUMMARY
-- =========================================================

SELECT
    r.route_name,
    SUM(t.passenger_count) AS total_passengers,
    AVG(
        DATEDIFF(
            MINUTE,
            t.scheduled_departure,
            t.actual_departure
        )
    ) AS avg_delay,
    RANK() OVER (
        ORDER BY SUM(t.passenger_count) DESC
    ) AS passenger_rank
FROM trips AS t
INNER JOIN routes AS r
    ON t.route_id = r.route_id
GROUP BY r.route_name
ORDER BY passenger_rank;

-- =========================================================
-- STEP 23: ROUTES WITH ABOVE-AVERAGE PASSENGER DEMAND
-- =========================================================

SELECT
    r.route_name,
    SUM(t.passenger_count) AS total_passengers
FROM trips AS t
INNER JOIN routes AS r
    ON t.route_id = r.route_id
GROUP BY r.route_name
HAVING SUM(t.passenger_count) >
(
    SELECT AVG(route_passengers)
    FROM
    (
        SELECT
            SUM(passenger_count) AS route_passengers
        FROM trips
        GROUP BY route_id
    ) AS route_totals
)
ORDER BY total_passengers DESC;

-- =========================================================
-- STEP 24: PASSENGER SHARE OF TOTAL DEMAND
-- =========================================================

SELECT
    r.route_name,
    SUM(t.passenger_count) AS passenger_count,
    CAST(
        SUM(t.passenger_count) * 100.0
        / SUM(SUM(t.passenger_count)) OVER()
        AS DECIMAL(5,2)
    ) AS percentage_total_passengers
FROM trips AS t
INNER JOIN routes AS r
    ON t.route_id = r.route_id
GROUP BY r.route_name
ORDER BY passenger_count DESC;

-- =========================================================
-- STEP 25: CUMULATIVE PASSENGER SHARE
-- =========================================================

SELECT
    r.route_name,
    SUM(t.passenger_count) AS passenger_count,
    CAST(
        SUM(t.passenger_count) * 100.0
        / SUM(SUM(t.passenger_count)) OVER()
        AS DECIMAL(5,2)
    ) AS percentage_total_passengers,
    CAST(
        SUM(SUM(t.passenger_count)) OVER(
            ORDER BY SUM(t.passenger_count) DESC
            ROWS UNBOUNDED PRECEDING
        ) * 100.0
        / SUM(SUM(t.passenger_count)) OVER()
        AS DECIMAL(5,2)
    ) AS cumulative_percentage
FROM trips AS t
INNER JOIN routes AS r
    ON t.route_id = r.route_id
GROUP BY r.route_name
ORDER BY passenger_count DESC;

-- =========================================================
-- STEP 26: ROUTE PERFORMANCE USING A CTE
-- =========================================================

WITH route_performance AS
(
    SELECT
        r.route_name,
        SUM(t.passenger_count) AS total_passengers,
        AVG(
            DATEDIFF(
                MINUTE,
                t.scheduled_departure,
                t.actual_departure
            )
        ) AS avg_delay
    FROM trips AS t
    INNER JOIN routes AS r
        ON t.route_id = r.route_id
    GROUP BY r.route_name
)
SELECT
    route_name,
    total_passengers,
    avg_delay
FROM route_performance
ORDER BY avg_delay DESC;

-- =========================================================
-- STEP 27: ROUTES ABOVE THE OVERALL AVERAGE DELAY
-- =========================================================

WITH route_delays AS
(
    SELECT
        r.route_name,
        AVG(
            DATEDIFF(
                MINUTE,
                t.scheduled_departure,
                t.actual_departure
            )
        ) AS avg_delay
    FROM trips AS t
    INNER JOIN routes AS r
        ON t.route_id = r.route_id
    GROUP BY r.route_name
)
SELECT
    route_name,
    avg_delay
FROM route_delays
WHERE avg_delay >
(
    SELECT AVG(avg_delay)
    FROM route_delays
)
ORDER BY avg_delay DESC;

-- =========================================================
-- STEP 28: COMBINE PASSENGER DEMAND AND DELAY RANKING
-- =========================================================

WITH route_performance AS
(
    SELECT
        r.route_name,
        SUM(t.passenger_count) AS total_passengers,
        AVG(
            DATEDIFF(
                MINUTE,
                t.scheduled_departure,
                t.actual_departure
            )
        ) AS avg_delay
    FROM trips AS t
    INNER JOIN routes AS r
        ON t.route_id = r.route_id
    GROUP BY r.route_name
)
SELECT
    route_name,
    total_passengers,
    avg_delay,
    RANK() OVER (
        ORDER BY total_passengers DESC
    ) AS passenger_rank,
    RANK() OVER (
        ORDER BY avg_delay DESC
    ) AS delay_rank
FROM route_performance
ORDER BY passenger_rank;

-- =========================================================
-- STEP 29: ROUTE PERFORMANCE CLASSIFICATION
-- =========================================================

WITH route_performance AS
(
    SELECT
        r.route_name,
        SUM(t.passenger_count) AS total_passengers,
        AVG(
            DATEDIFF(
                MINUTE,
                t.scheduled_departure,
                t.actual_departure
            )
        ) AS avg_delay
    FROM trips AS t
    INNER JOIN routes AS r
        ON t.route_id = r.route_id
    GROUP BY r.route_name
)
SELECT
    route_name,
    total_passengers,
    avg_delay,
    CASE
        WHEN total_passengers > 500
             AND avg_delay < 10
            THEN 'EXCELLENT'
        WHEN total_passengers > 300
             AND avg_delay <= 15
            THEN 'AVERAGE'
        ELSE 'NEEDS IMPROVEMENT'
    END AS performance_result
FROM route_performance
ORDER BY total_passengers DESC;

-- =========================================================
-- STEP 30: FINAL ROUTE PERFORMANCE ANALYSIS
-- =========================================================

WITH route_analysis AS
(
    SELECT
        r.route_name,
        SUM(t.passenger_count) AS total_passengers,
        AVG(
            DATEDIFF(
                MINUTE,
                t.scheduled_departure,
                t.actual_departure
            )
        ) AS avg_delay
    FROM trips AS t
    INNER JOIN routes AS r
        ON t.route_id = r.route_id
    GROUP BY r.route_name
)
SELECT
    route_name,
    total_passengers,
    avg_delay,
    CASE
        WHEN total_passengers > 500 AND avg_delay < 10
            THEN 'High Demand - Good Performance'
        WHEN total_passengers > 500 AND avg_delay >= 10
            THEN 'High Demand - Delayed'
        WHEN total_passengers <= 500 AND avg_delay < 10
            THEN 'Low Demand - Good Performance'
        ELSE 'Low Demand - Delayed'
    END AS route_performance
FROM route_analysis
ORDER BY total_passengers DESC;

-- =========================================================
-- END OF PROJECT
-- =========================================================
