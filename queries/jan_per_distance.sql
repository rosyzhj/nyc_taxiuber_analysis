
SELECT 
    trip_distance
FROM (
    SELECT 
        CAST(trip_distance AS FLOAT) AS trip_distance
    FROM taxi_trips 
    WHERE tpep_pickup_datetime BETWEEN '2024-01-01' AND '2024-01-31'

    UNION ALL

    SELECT 
        CAST(trip_miles AS FLOAT) AS trip_distance
    FROM uber_trips 
    WHERE pickup_datetime BETWEEN '2024-01-01' AND '2024-01-31'
) AS combined_results
WHERE trip_distance IS NOT NULL
ORDER BY trip_distance
LIMIT 1 OFFSET (
    SELECT CAST(COUNT(*) * 0.95 AS INTEGER) 
    FROM (
        SELECT 
            CAST(trip_distance AS FLOAT) AS trip_distance
        FROM taxi_trips 
        WHERE tpep_pickup_datetime BETWEEN '2024-01-01' AND '2024-01-31'

        UNION ALL

        SELECT 
            CAST(trip_miles AS FLOAT) AS trip_distance
        FROM uber_trips 
        WHERE pickup_datetime BETWEEN '2024-01-01' AND '2024-01-31'
    )
) - 1;
