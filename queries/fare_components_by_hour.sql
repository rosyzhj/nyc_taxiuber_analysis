
WITH individual_fares AS (
    SELECT
        CAST(STRFTIME('%H', tpep_pickup_datetime) AS INT) AS pickup_hour,
        AVG(total_fares) AS avg_total_fares,
        AVG(fare_amount) AS avg_fare_amount,
        AVG(total_surcharge) AS avg_total_surcharge,
        AVG(mta_tax) AS avg_tax
    FROM taxi_trips
    GROUP BY pickup_hour

    UNION ALL

    SELECT
        CAST(STRFTIME('%H', pickup_datetime) AS INT) AS pickup_hour,
        AVG(total_fares) AS avg_total_fares,
        AVG(base_passenger_fare) AS avg_fare_amount,
        AVG(total_surcharge) AS avg_total_surcharge,
        AVG(sales_tax) AS avg_tax
    FROM uber_trips
    GROUP BY pickup_hour
),

combined_avg AS (
    SELECT
        pickup_hour,
        AVG(avg_total_fares) AS avg_total_fares,
        AVG(avg_fare_amount) AS avg_fare_amount,
        AVG(avg_total_surcharge) AS avg_total_surcharge,
        AVG(avg_tax) AS avg_tax
    FROM individual_fares
    GROUP BY pickup_hour
)

SELECT 
    pickup_hour,
    ROUND(100 * avg_fare_amount / avg_total_fares, 2) AS base_fare_pct,
    ROUND(100 * avg_total_surcharge / avg_total_fares, 2) AS surcharge_pct,
    ROUND(100 * avg_tax / avg_total_fares, 2) AS tax_pct
FROM combined_avg
ORDER BY pickup_hour;

