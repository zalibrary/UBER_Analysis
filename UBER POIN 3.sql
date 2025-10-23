-- Poin 3

WITH base_data AS (
  SELECT *,
  -- Convert miles dan speed ke km dan km/h
  miles * 1.60934 AS distance_km,
  speed * 1.60934 AS speed_kmh,
  -- Beri keterangan day type
  CASE WHEN day IN ('Saturday','Sunday') THEN 'Weekend'
  ELSE 'Weekday' END AS day_type
  FROM `virtual-dogfish-471800-c7.uber.uber_clean`
),

threshold AS (
  SELECT *,
    CASE 
      WHEN speed_kmh > 40 THEN 'Efficient'
      WHEN speed_kmh BETWEEN 25 AND 40 THEN 'Moderate'
      ELSE 'Inefficient'
    END AS efficiency_category
  FROM base_data
),

purpose AS (
  SELECT
    day_type,
    purpose,
    COUNT(*) AS total_trips,
    COUNTIF(efficiency_category = 'Inefficient') AS inefficient_trips
  FROM threshold
  GROUP BY 1,2
)


SELECT
  day_type,
  purpose,
  inefficient_trips,
  total_trips,
  ROUND((inefficient_trips/total_trips)*100,2) AS inefficient_percentage
FROM purpose
--WHERE total_trips > 10
QUALIFY ROW_NUMBER() OVER (PARTITION BY day_type ORDER BY inefficient_trips/total_trips DESC) <= 2
ORDER BY 1, 5 DESC;


--SELECT 
-- day_type,
  --- efficiency_category,
  -- COUNT(*) total_trip,
  -- ROUND(AVG(CASE WHEN duration > 0 THEN duration END),2) AS avg_duration_minutes,
  -- ROUND(AVG(distance_km),2) AS avg_distance_km,
  -- ROUND(AVG(CASE WHEN duration > 0 THEN speed_kmh END),2) AS avg_speed_km
-- FROM threshold
-- GROUP BY 1,2 ORDER BY 1,2;
