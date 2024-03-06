-- CREACION DE NUEVA TABLA CON TODOS LOS DATOS DE VIAJES DE 2023--

CREATE TABLE tripdata2023 AS
SELECT * FROM data202301
UNION ALL
SELECT * FROM data202302
UNION ALL
SELECT * FROM data202303
UNION ALL
SELECT * FROM data202304
UNION ALL
SELECT * FROM data202305
UNION ALL
SELECT * FROM data202306
UNION ALL
SELECT * FROM data202307
UNION ALL
SELECT * FROM data202308
UNION ALL
SELECT * FROM data202309
UNION ALL
SELECT * FROM data202310
UNION ALL
SELECT * FROM data202311
UNION ALL 
SELECT * FROM data202312;

--COMPROBAR VALORES NULOS --

SELECT COUNT(*)
FROM tripdata2023
WHERE start_station_id IS NULL OR
	start_station_name IS NULL OR
	end_station_id IS NULL OR
	end_station_name IS NULL;
-- 1388054 VALORES NULOS EN LAS VARIABLES QUE CONTIENEN LOS IDS O LOS NOMBRES DE LAS ESTACIONES 

-- CREAR TABLA SIN VALORES NULOS Y CON COLUMNAS ADICIONALES QUE FACILITARAN EL ANALISIS COMO EL DIA DE LA SEMANA Y LA DURACION DE CADA VIAJE 

CREATE TABLE tripdata2023_clean AS 
SELECT 
	ride_id,
	rideable_type,
	started_at,
	ended_at,
	(julianday(ended_at)-julianday(started_at))*1440 AS ride_lenght_mins,
	case cast (strftime('%w', started_at) as integer)
		when 0 then 'Sunday'
		when 1 then 'Monday'
		when 2 then 'Tuesday'
		when 3 then 'Wednesday'
		when 4 then 'Thursday'
		when 5 then 'Friday'
		else 'Saturday' end as weekday,
	start_station_id,
	start_station_name,
	end_station_id,
	end_station_name,
	start_lat,
	start_lng,
	end_lat,
	end_lng,
	member_casual	
FROM tripdata2023
WHERE NOT (start_station_id IS NULL OR
	start_station_name IS NULL OR
	end_station_id IS NULL OR
	end_station_name IS NULL);

-- ELIMINAMOS VALORES ATIPICOS, ESTOS SON VIAJES CON DURACION NEGATIVA Y CON DURACION DE MAS DE UN DIA

DELETE FROM tripdata2023_clean
WHERE ride_lenght_mins <= 0 OR ride_lenght_mins > 1440;
