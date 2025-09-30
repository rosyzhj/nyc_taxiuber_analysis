
SELECT 
    latitude_pickup, longitude_pickup,
    latitude_dropoff, longitude_dropoff,
    trip_distance,
    tpep_pickup_datetime AS pickup_datetime,
    tpep_dropoff_datetime AS dropoff_datetime,
    CASE 
      WHEN STRFTIME('%w', tpep_pickup_datetime) IN ('0', '6') THEN 'weekend'
      ELSE 'weekday'
    END AS day_type
FROM taxi_trips
WHERE time_period = "late-night"

UNION ALL

SELECT 
    latitude_pickup, longitude_pickup,
    latitude_dropoff, longitude_dropoff,
    trip_miles AS trip_distance,
    pickup_datetime,
    dropoff_datetime,
    CASE 
      WHEN STRFTIME('%w', pickup_datetime) IN ('0', '6') THEN 'weekend'
      ELSE 'weekday'
    END AS day_type
FROM uber_trips
WHERE time_period = "late-night";
