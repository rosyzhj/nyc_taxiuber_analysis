
SELECT 
    hour,
    day_type,
    AVG(ride_count) AS avg_ride_count
FROM (
    SELECT 
        STRFTIME('%Y-%m', tpep_pickup_datetime) AS month,
        STRFTIME('%H', tpep_pickup_datetime) AS hour,
        CASE 
            WHEN STRFTIME('%w', tpep_pickup_datetime) IN ('0', '6') THEN 'weekend'
            ELSE 'weekday'
        END AS day_type,
        COUNT(*) AS ride_count
    FROM taxi_trips
    GROUP BY month, hour, day_type

    UNION ALL

    SELECT 
        STRFTIME('%Y-%m', pickup_datetime) AS month,
        STRFTIME('%H', pickup_datetime) AS hour,
        CASE 
            WHEN STRFTIME('%w', pickup_datetime) IN ('0', '6') THEN 'weekend'
            ELSE 'weekday'
        END AS day_type,
        COUNT(*) AS ride_count
    FROM uber_trips
    GROUP BY month, hour, day_type
)
GROUP BY hour, day_type
ORDER BY hour, day_type;

