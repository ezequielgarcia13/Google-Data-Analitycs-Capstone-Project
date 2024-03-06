--CANTIDAD DE REGISTROS DEL CONJUNTO DE DATOS LIMPIOS
SELECT COUNT(*)
FROM tripdata2023_clean;

-- CANTIDAD DE VIAJES POR TIPO DE USUARIO EN EL AÑO 

SELECT 
	member_casual,
	count(*)
FROM tripdata2023_clean
GROUP BY member_casual;

-- PROMEDIO DE DURACION DE VIAJE PARA CADA TIPO DE USUARIO

SELECT
	member_casual,
	avg(ride_lenght_mins)
FROM tripdata2023_clean
WHERE ride_lenght_mins >= 0
GROUP BY member_casual;

-- LOS MIEMBROS ANUALES REALIZAN VIAJES DE UNA DURACION MENOR QUE LOS USUARIOS CASUALES 

-- TIPO DE BICICLETA POR TIPO DE USUARIO 

SELECT
	member_casual,
	rideable_type,
	count(*) 
FROM tripdata2023_clean
GROUP BY member_casual, rideable_type
ORDER BY count(*) DESC;

-- ESTACIONES MAS FRECUENTES --

SELECT 
	start_station_name,
	count(*) AS cantidad
FROM tripdata2023_clean
GROUP BY start_station_name
ORDER BY cantidad DESC
LIMIT 20;

SELECT 
	end_station_name,
	count(*) AS cantidad
FROM tripdata2023_clean
GROUP BY end_station_name
ORDER BY cantidad DESC
LIMIT 20;

-- HORARIOS MAS CONCURRIDOS -- 

------- INICIO DE VIAJES -------

-- horas de inicio de viaje de miembros --
SELECT 
	strftime('%H', started_at) as started_hour,
	member_casual,
	count(*) AS cantidad
FROM tripdata2023_clean
WHERE member_casual = 'member'
GROUP BY started_hour, member_casual
ORDER BY cantidad DESC;

-- horas de inicio de viaje de usuarios casuales --
SELECT 
	member_casual,
	strftime('%H', started_at) as started_hour,
	count(*) AS cantidad
FROM tripdata2023_clean
WHERE member_casual = 'casual'
GROUP BY started_hour, member_casual
ORDER BY cantidad DESC; 

------- FIN DE VIAJES -------

-- horas de finalizacion de viajes de miembros --
SELECT 
	strftime('%H', ended_at) as ended_hour,
	count(*) AS cantidad
FROM tripdata2023_clean
WHERE member_casual = 'member'
GROUP BY ended_hour
ORDER BY cantidad DESC;

-- horas de finalizacion de viajes de usuarios casuales --
SELECT 
	strftime('%H', ended_at) as ended_hour,
	count(*) AS cantidad
FROM tripdata2023_clean
WHERE member_casual = 'casual'
GROUP BY ended_hour
ORDER BY cantidad DESC;

-- LOS USUARIOS CASUALES REALIZAN SUS VIAJES EN BICICLETA DURANTE LA TARDE MIENTRAS QUE LOS MIEMBROS ANUALES TAMBIEN TOMAN VIAJES POR LAS MAÑANAS

------ DIAS DE LA SEMANA

SELECT 
	weekday,
	count(*) AS cantidad
FROM tripdata2023_clean
WHERE member_casual = 'member'
GROUP BY weekday
ORDER BY cantidad DESC;

SELECT 
	weekday,
	count(*) AS cantidad
FROM tripdata2023_clean
WHERE member_casual = 'casual'
GROUP BY weekday
ORDER BY cantidad DESC;

-- LOS DIAS PREFERIDOS PARA LOS USUARIOS CASUALES SON LOS FINES DE SEMANA. MIENTRAS QUE LOS MIEMBROS ANUALES UTILIZAN EL SERVICIO PREFERENTEMENTE DE LUNES A VIERNES AUNQUE MIERCOLES, MARTES Y JUEVES SON LOS DIAS QUE MAS VIAJAN 

-- DURACION PROMEDIO DE VIAJES POR DIA 

-- CASUAL
SELECT 
	weekday,
	AVG(ride_lenght_mins)
FROM tripdata2023_clean
WHERE member_casual = 'casual'
GROUP BY weekday

-- MEMBER
SELECT 
	weekday,
	AVG(ride_lenght_mins)
FROM tripdata2023_clean
WHERE member_casual = 'member'
GROUP BY weekday

-- VIAJES POR MES 

-- CASUAL

SELECT 
	strftime('%m', started_at) AS mes,
	count(*) as cantidad_viajes
FROM tripdata2023_clean
WHERE member_casual = 'casual'
GROUP BY mes
ORDER BY cantidad_viajes DESC;

-- MEMBER 

SELECT 
	strftime('%m', started_at) AS mes,
	count(*) as cantidad_viajes
FROM tripdata2023_clean
WHERE member_casual = 'member'
GROUP BY mes
ORDER BY cantidad_viajes DESC;
