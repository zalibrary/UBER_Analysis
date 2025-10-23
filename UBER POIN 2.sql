-- POIN 2 (TOTAL SPEED)
-- Total trip per jam pada weekend dan weekday
-- Top 10 hari dan jam tersibuk

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

--weekend

--SELECT start_hour, COUNT(*) AS count_trip_weekend
--FROM base_data
--WHERE day_type = 'Weekend'
--GROUP BY 1 ORDER BY start_hour;

--weekday
--SELECT start_hour, COUNT(*) AS count_trip_weekday
--FROM base_data
--WHERE day_type = 'Weekday'
--GROUP BY 1 ORDER BY start_hour;

--Top 10 hari dan jam tersibuk
SELECT day, start_hour, COUNT(*) AS count_trip
FROM base_data
GROUP BY 1,2 ORDER BY COUNT(*) DESC LIMIT 10;