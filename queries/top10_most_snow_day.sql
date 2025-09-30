
SELECT 
    dw.date,
    dw.daily_snowfall,
    COUNT(tt.tpep_pickup_datetime) AS hired_trips
FROM 
    daily_weather dw
LEFT JOIN 
    taxi_trips tt ON DATE(dw.date) = DATE(tt.tpep_pickup_datetime)
WHERE 
    dw.date BETWEEN '2020-01-01' AND '2024-08-31'
GROUP BY 
    dw.date, dw.daily_snowfall
ORDER BY 
    dw.daily_snowfall DESC
LIMIT 10;
