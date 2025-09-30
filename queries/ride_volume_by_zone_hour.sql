
SELECT 
    STRFTIME('%H', tpep_pickup_datetime) AS pickup_hour,
    PULocationID AS pickup_zone_id,
    COUNT(*) AS ride_count,
    'taxi' AS mode
FROM taxi_trips
GROUP BY pickup_hour, pickup_zone_id

UNION ALL

SELECT 
    STRFTIME('%H', pickup_datetime) AS pickup_hour,
    PULocationID AS pickup_zone_id,
    COUNT(*) AS ride_count,
    'uber' AS mode
FROM uber_trips
GROUP BY pickup_hour, pickup_zone_id

ORDER BY pickup_hour, pickup_zone_id, mode;
