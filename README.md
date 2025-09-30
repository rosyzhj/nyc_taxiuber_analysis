# NYC Ride Behavior Analysis

This project explores temporal and spatial patterns in New York City taxi and Uber rides, focusing on ride volume, fare characteristics, and rider behavior during different time periods.

## Project Overview

This project analyzes a cleaned and aggregated dataset of NYC ride-hailing trips (Yellow Taxi and Uber) to uncover:

* Temporal dynamics: ride volume and patterns by hour, weekday, and time of day (daytime vs. late-night).

* Fare and tipping behavior: average fares, tips, and tip rates across different conditions.

* Travel flow insights: origin–destination pair analysis, zone-level travel demand, and neighborhood clustering.


## Methods & Tools

Languages: Python, SQL

Libraries: Pandas, Plotly, GeoPandas, NetworkX

Features:
* Time-based aggregation (hour, weekday, daytime/ late-night)
* Geospatial network graph construction
* Community detection (Louvain method)

## Data Sources
 
1. **Trip Data**: Yellow Taxi and Uber trip data are from [TLC Trip Record Data](https://www.nyc.gov/site/tlc/about/tlc-trip-record-data.page). This project only includes trip data spanning from January 2020 through August 2024. The shapefile used to convert location IDs and geographical coordinates can also be found on this website.

2. **Weather Data**: Historical weather data are from [local climatological data](https://www.ncei.noaa.gov/access/search/data-search/local-climatological-data?stations=72505394728), the data spans from 2020 through October 2024.

3. Zone shapefiles and location IDs for mapping and OD graphing
