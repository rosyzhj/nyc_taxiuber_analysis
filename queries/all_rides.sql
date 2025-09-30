
-- Late-Night Uber
SELECT 
    pulocationid AS pickup_zone,
    dolocationid AS dropoff_zone,
    'Uber' AS source,
    time_period
FROM uber_trips

UNION ALL

-- Late-Night Taxi
SELECT 
    pulocationid,
    dolocationid,
    'Taxi' AS source,
    time_period
FROM taxi_trips
