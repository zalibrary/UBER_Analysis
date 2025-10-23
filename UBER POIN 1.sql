-- POIN 1

WITH base_data AS (
  SELECT *,
  -- Convert miles dan speed ke km dan km/h
  miles * 1.60934 AS distance_km,
  speed * 1.60934 AS speed_kmh,
  -- Beri keterangan day type
  CASE 
    WHEN day IN ('Saturday','Sunday') THEN 'Weekend'
    ELSE 'Weekday' END AS day_type
  FROM `virtual-dogfish-471800-c7.uber.uber_clean`
)

SELECT 
  category, day_type,
  COUNT(*) AS total_trip,
  ROUND(COUNT(*)/COUNT(DISTINCT start_date),2) AS avg_trip_per_day, 
  ROUND(AVG(CASE WHEN duration > 0 THEN duration END),2) AS avg_duration_minutes,
  ROUND(AVG(distance_km),2) AS avg_distance_km,
  ROUND(AVG(CASE WHEN duration > 0 THEN speed_kmh END),2) AS avg_speed_km,

FROM base_data
GROUP BY 1,2;