
WITH RECURSIVE hourly_series AS (
    SELECT 
        '2023-09-25 00:00:00' AS date_hour
    UNION ALL
    SELECT 
        datetime(date_hour, '+1 hour')
    FROM 
        hourly_series
    WHERE 
        date_hour < '2023-10-04 00:00:00'  -- total 9 days
),
hourly_data AS (
    SELECT 
        hs.date_hour,
        COUNT(tt.tpep_pickup_datetime) AS hired_trips,
        SUM(COALESCE(hw.hourly_precipitation, 0)) AS total_precipitation,
        AVG(COALESCE(hw.hourly_wind_speed, 0)) AS average_wind_speed
    FROM 
        hourly_series hs
    LEFT JOIN 
        hourly_weather hw ON hs.date_hour BETWEEN hw.date AND hw.date + 1
    LEFT JOIN 
        taxi_trips tt ON DATE(hs.date_hour) = DATE(tt.tpep_pickup_datetime) 
        AND strftime('%H', hs.date_hour) = strftime('%H', tt.tpep_pickup_datetime)
    GROUP BY 
        hs.date_hour
)
SELECT 
    date_hour,
    hired_trips,
    total_precipitation,
    average_wind_speed
FROM 
    hourly_data
ORDER BY 
    date_hour ASC;
