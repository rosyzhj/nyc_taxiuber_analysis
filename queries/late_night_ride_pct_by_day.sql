
WITH all_rides AS (
    SELECT 
        CAST(STRFTIME('%w', tpep_pickup_datetime) AS INT) AS day_of_week,
        CASE WHEN time_period = "late-night" THEN 1 ELSE 0 END AS is_late
    FROM taxi_trips
    UNION ALL
    SELECT 
        CAST(STRFTIME('%w', pickup_datetime) AS INT) AS day_of_week,
        CASE WHEN time_period = "late-night" THEN 1 ELSE 0 END AS is_late
    FROM uber_trips
)
SELECT 
    day_of_week,
    COUNT(*) AS total_rides,
    SUM(is_late) AS late_rides,
    ROUND(100.0 * SUM(is_late) / COUNT(*), 2) AS late_ride_pct
FROM all_rides
GROUP BY day_of_week
ORDER BY day_of_week;
