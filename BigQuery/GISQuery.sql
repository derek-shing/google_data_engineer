//GIS function start with ST_

SELECT
  number_of_strikes,
  CONCAT(CAST(ST_Y(center_point_geom) AS STRING) ,",",CAST(ST_X(center_point_geom) AS STRING)) AS CENTER_POINT
FROM
  `bigquery-public-data.noaa_lightning.lightning_2020`
LIMIT
  1000
