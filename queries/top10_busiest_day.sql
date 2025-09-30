
WITH combined_rides AS (
    SELECT 
        DATE(tpep_pickup_datetime) AS trip_date,
        COUNT(*) AS total_rides,
        AVG(trip_distance) AS avg_distance
    FROM taxi_trips
    WHERE tpep_pickup_datetime BETWEEN '2023-01-01' AND '2023-12-31'
    GROUP BY trip_date

    UNION ALL

    SELECT 
        DATE(pickup_datetime) AS trip_date,
        COUNT(*) AS total_rides,
        AVG(trip_miles) AS avg_distance
    FROM uber_trips
    WHERE pickup_datetime BETWEEN '2023-01-01' AND '2023-12-31'
    GROUP BY trip_date
),
daily_stats AS (
    SELECT
        trip_date,
        SUM(total_rides) AS total_rides,
        AVG(avg_distance) AS avg_distance
    FROM combined_rides
    GROUP BY trip_date
)
SELECT 
    ds.trip_date,
    ds.total_rides,
    ds.avg_distance,
    dw.daily_precipitation AS avg_precipitation,
    dw.daily_average_wind_speed AS avg_wind_speed
FROM daily_stats ds
LEFT JOIN daily_weather dw ON ds.trip_date = DATE(dw.date)
ORDER BY ds.total_rides DESC
LIMIT 10;
