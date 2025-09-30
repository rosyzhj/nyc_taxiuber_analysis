
CREATE TABLE IF NOT EXISTS hourly_weather(
    id INTEGER PRIMARY KEY,
    date DATETIME,
    hourly_precipitation FLOAT,
    hourly_wind_speed FLOAT
);

CREATE TABLE IF NOT EXISTS daily_weather(
    id INTEGER PRIMARY KEY,
    date DATETIME,
    daily_precipitation FLOAT,
    daily_average_wind_speed FLOAT,
    daily_snowfall FLOAT
);

CREATE TABLE IF NOT EXISTS taxi_trips (
    tpep_pickup_datetime     TIMESTAMP,
    tpep_dropoff_datetime    TIMESTAMP,
    trip_time                FLOAT,    
    trip_distance            FLOAT,
    pulocationid             INTEGER,
    latitude_pickup          FLOAT,
    longitude_pickup         FLOAT,
    dolocationid            INTEGER,
    latitude_dropoff         FLOAT,
    longitude_dropoff        FLOAT,
    fare_amount              FLOAT,
    tip_amount               FLOAT,
    total_amount             FLOAT,
    airport_fee              FLOAT,
    congestion_surcharge     FLOAT,
    mta_tax                  FLOAT,
    tolls_amount             FLOAT,
    improvement_surcharge    FLOAT,
    extra                    FLOAT,
    cbd_congestion_fee       FLOAT,
    total_surcharge          FLOAT,
    total_fares              FLOAT,
    is_post_cbd_fee          BOOLEAN,
    time_period              VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS uber_trips (
    pickup_datetime         TIMESTAMP,
    dropoff_datetime        TIMESTAMP,
    trip_time               FLOAT,
    trip_miles              FLOAT,
    pulocationid            INTEGER,
    latitude_pickup         FLOAT,
    longitude_pickup        FLOAT,
    dolocationid            INTEGER,
    latitude_dropoff        FLOAT,
    longitude_dropoff       FLOAT,
    base_passenger_fare     FLOAT,
    tips                    FLOAT,
    tolls                   FLOAT,
    bcf                     FLOAT,
    congestion_surcharge    FLOAT,
    airport_fee             FLOAT,
    cbd_congestion_fee      INTEGER,
    sales_tax               FLOAT,
    total_surcharge         FLOAT,
    total_fares             FLOAT,
    is_post_cbd_fee         BOOLEAN,
    time_period             VARCHAR(20)
);


CREATE TABLE IF NOT EXISTS sunrise_sunset(
    date DATE
    sunrise_datetime DATETIME,
    sunset_datetime DATETIME
);
