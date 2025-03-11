
/*==========================CONSULTAS PARA ANALISIS=========================================*/


-------a) ¿Cuántos taxis recogen pasajeros cerca de puntos de interés (hoteles, restaurantes, estaciones de transporte, parques, etc.)? -------------T:15:50

WITH Interes_Filtrado AS (
    SELECT i.Clase, i.Ubicacion.STBuffer(300) AS Zona_Buffer --STBuffer indica un área de 300m al alrededor
    FROM Interes i
)
SELECT 
    i.Clase,
    COUNT(DISTINCT g.Id_Viajes_Taxi) AS Cantidad_Viajes
FROM Interes_Filtrado i
JOIN GPS_Viajes_Taxi g
ON g.Ubicacion_Inicio.STIntersects(i.Zona_Buffer) = 1  -- 1 si dos geometrias se intersectan y 0 si no lo hacen
GROUP BY i.Clase
ORDER BY Cantidad_Viajes DESC;


------b) ¿Qué porcentaje de los viajes comienzan o terminan cerca de una estación de transporte?
----------COMIENZAN
SELECT 
    (COUNT(DISTINCT g.Id_Viajes_Taxi) * 100.0) / (SELECT COUNT(*) FROM GPS_Viajes_Taxi) AS Porcentaje_Cerca
FROM GPS_Viajes_Taxi g
JOIN Transporte t 
    ON (g.Ubicacion_Inicio.MakeValid().STDistance(t.Ubicacion.MakeValid()) <= 300) 
    AND (g.Ubicacion_Inicio.MakeValid().STDistance(t.Ubicacion.MakeValid()) > 0);

	
----------TERMINAN
SELECT 
    (COUNT(DISTINCT g.Id_Viajes_Taxi) * 100.0) / (SELECT COUNT(*) FROM GPS_Viajes_Taxi) AS Porcentaje_Cerca
FROM GPS_Viajes_Taxi g
JOIN Transporte t 
    ON (g.Ubicacion_Fin.MakeValid().STDistance(t.Ubicacion.MakeValid()) <= 300) 
	AND (g.Ubicacion_Fin.MakeValid().STDistance(t.Ubicacion.MakeValid()) > 0)


------c) ¿Cuáles son las zonas con más viajes de taxi en una hora específica del día?

SELECT 
    FORMAT(FechaHora_Inicio, 'yyyy-MM-dd HH:00:00') AS Hora,
    COUNT(*) AS Cantidad_Viajes,
    Ubicacion_Inicio.Lat AS Latitud,
    Ubicacion_Inicio.Long AS Longitud
FROM GPS_Viajes_Taxi
WHERE (DATEPART(HOUR, FechaHora_Inicio) = 8)-- Cambia el número de la hora que se requiere
GROUP BY FORMAT(FechaHora_Inicio, 'yyyy-MM-dd HH:00:00'), Ubicacion_Inicio.Lat, Ubicacion_Inicio.Long
ORDER BY Cantidad_Viajes DESC;

------d) ¿Qué punto de interés contiene mayor cantidad de viajes registrados entre Hoteles y Restaurantes?
SELECT 
    i.Clase,
	i.Nombre AS Lugar,
    COUNT(v.Id_Viajes_Taxi) AS Cantidad_Viajes
FROM Interes i
JOIN GPS_Viajes_Taxi v ON v.Ubicacion_Inicio.STDistance(i.Ubicacion) < 300 -- 300m alrededor
WHERE i.Clase IN ('Hotel', 'Restaurant')
GROUP BY i.Nombre, i.Clase
ORDER BY Cantidad_Viajes DESC;


------e) ¿Cuáles son las carreteras más utilizadas para iniciar un viaje?

SELECT 
    c.Nombre AS Nombre_Carretera,
    COUNT(v.Id_Viajes_Taxi) AS Cantidad_Viajes
FROM GPS_Viajes_Taxi v
JOIN Carreteras_Calles c 
ON (v.Ubicacion_Inicio.STDistance(c.Ubicacion) > 0) and (v.Ubicacion_Inicio.STDistance(c.Ubicacion) < 50)-- 50 metros de proximidad
GROUP BY c.Nombre
ORDER BY Cantidad_Viajes DESC;



----f) ¿Cuáles son los lugares de interes con más viajes de taxi?

SELECT 
    i.Nombre AS Punto_Interes,
    COUNT(v.Id_Viajes_Taxi) AS Cantidad_Viajes
FROM GPS_Viajes_Taxi v
JOIN Interes i 
ON (v.Ubicacion_Inicio.STDistance(i.Ubicacion) > 0) and (v.Ubicacion_Inicio.STDistance(i.Ubicacion) < 100) -- 100 metros de proximidad
GROUP BY i.Nombre
ORDER BY Cantidad_Viajes DESC;


------g) ¿Cuáles son las ciudades con mayor actividad de taxis?

SELECT 
    l.Nombre AS Ciudad,
    COUNT(v.Id_Viajes_Taxi) AS Cantidad_Viajes
FROM GPS_Viajes_Taxi v
JOIN Lugares l 
ON (v.Ubicacion_Inicio.STDistance(l.Ubicacion.MakeValid()) > 0) and  (v.Ubicacion_Inicio.STDistance(l.Ubicacion.MakeValid()) <= 500)-- Cercanía de 500 metros
GROUP BY l.Nombre
ORDER BY Cantidad_Viajes DESC;



------h) Listado de viajes empiezan cerca de algun área natural

SELECT 
    v.Id_Viajes_Taxi,
    v.Proveedor,
    v.FechaHora_Inicio,
    v.FechaHora_Fin,
    n.Clase,
    n.Nombre,
    v.Ubicacion_Inicio.STDistance(n.Ubicacion) AS Distancia
FROM GPS_Viajes_Taxi v
JOIN Natural n 
ON (v.Ubicacion_Inicio.STDistance(n.Ubicacion) > 0) and  (v.Ubicacion_Inicio.STDistance(n.Ubicacion) <= 300)-- 300 metros de proximidad
ORDER BY Distancia DESC



-----i) ¿Cuál es la velocidad promedio de los viajes en diferentes tipos de vía en Km/h?

SELECT 
    c.Clase AS Tipo_Via,
    AVG((v.Distancia_Metros / NULLIF(v.DuracionViaje_Segundos, 0)) * 3.6) AS Velocidad_Kmh --convirtiendo a Kilómetros por Hora
FROM GPS_Viajes_Taxi v
JOIN Carreteras_Calles c 
ON (v.Ubicacion_Inicio.STDistance(c.Ubicacion) > 0) and (v.Ubicacion_Inicio.STDistance(c.Ubicacion) <= 50)
GROUP BY c.Clase
ORDER BY Velocidad_Kmh DESC;



-----j) ¿Cuántos viajes terminan en Hospitales?

SELECT 
	v.Id_Viajes_Taxi, v.Proveedor, v.DuracionViaje_Segundos,
	v.Distancia_Metros,
	i.Clase, i.Nombre,
    v.Ubicacion_Fin.STDistance(i.Ubicacion) as Distancia
FROM GPS_Viajes_Taxi v
JOIN Interes i 
ON (v.Ubicacion_Fin.STDistance(i.Ubicacion) > 0) and (v.Ubicacion_Fin.STDistance(i.Ubicacion) <= 200)
WHERE i.Clase = 'hospital'
order by Distancia desc













