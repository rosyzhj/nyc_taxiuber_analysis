
WITH combined_rides AS (
    SELECT 
        CAST(STRFTIME('%H', tpep_pickup_datetime) AS INT) AS pickup_hour,
        trip_distance,
        trip_time / 60.0 AS trip_time_min,
        'taxi' AS source
    FROM taxi_trips

    UNION ALL

    SELECT 
        CAST(STRFTIME('%H', pickup_datetime) AS INT) AS pickup_hour,
        trip_miles AS trip_distance,
        trip_time / 60.0 AS trip_time_min,
        'uber' AS source
    FROM uber_trips
)

SELECT 
    source,
    pickup_hour,
    COUNT(*) AS total_trips,
    ROUND(AVG(trip_distance), 2) AS avg_distance_miles,
    ROUND(AVG(trip_time_min), 2) AS avg_duration_min
FROM combined_rides
GROUP BY source, pickup_hour
ORDER BY source, pickup_hour;
