USE master
GO

CREATE DATABASE DATOS_GEOGRAFICOS_LIMPIOS;
GO
USE DATOS_GEOGRAFICOS_LIMPIOS;
GO


--1. Tabla de viaje de Taxis
CREATE TABLE GPS_Viajes_Taxi (
	Id_Viajes_Taxi INT PRIMARY KEY IDENTITY,
    Proveedor NVARCHAR(50),
    FechaHora_Inicio DATETIME,
    FechaHora_Fin DATETIME,
    DuracionViaje_Segundos INT,
    Distancia_Metros INT,
    TiempoEspera_Segundos BIGINT,
	Ubicacion_Inicio_Temporal NVARCHAR(200),
	Ubicacion_Fin_Temporal NVARCHAR(200),
	Ubicacion_Inicio GEOGRAPHY,
	Ubicacion_Fin GEOGRAPHY
);

-- 2️. Infraestructura vial
CREATE TABLE Carreteras_Calles (
	Id_Carreteras_Calles INT PRIMARY KEY IDENTITY,
    Codigo BIGINT,
    Clase NVARCHAR(100),
    Nombre NVARCHAR(100),
	Referencia NVARCHAR(100),
	Sentido_Via NVARCHAR(5),
    Velocidad_Maxima INT,
	EsPuente NVARCHAR(5),
	EsTunel NVARCHAR(5),
    Ubicacion GEOGRAPHY
);

-- 3. Puntos de tráfico
CREATE TABLE Trafico (
	Id_Trafico INT PRIMARY KEY IDENTITY,
    Codigo BIGINT,
    Clase NVARCHAR(100),
    Nombre NVARCHAR(100),
    Ubicacion GEOGRAPHY
);

-- 4️. Transporte público
CREATE TABLE Transporte (
	Id_Transporte INT PRIMARY KEY IDENTITY,
    Codigo BIGINT,
    Clase NVARCHAR(100),
    Nombre NVARCHAR(100),
    Ubicacion GEOGRAPHY
);

-- 5. Puntos de interés (Restaurantes, Edificios, Parques, etc.)
CREATE TABLE Interes (
	Id_Interes INT PRIMARY KEY IDENTITY,
    Codigo BIGINT,
    Clase NVARCHAR(100),
    Nombre NVARCHAR(400),
    Ubicacion GEOGRAPHY
);


-- 6. Lugares (Pueblos, Ciudades, aldeas, etc.)
CREATE TABLE Lugares (
	Id_Lugares INT PRIMARY KEY IDENTITY,
    Codigo BIGINT,
    Clase NVARCHAR(100),
    Poblacion INT,
    Nombre NVARCHAR(100),
    Ubicacion GEOGRAPHY
);

-- 7. Áreas Naturales y agua (ríos, etc.)
CREATE TABLE Natural (
	Id_Natural INT PRIMARY KEY IDENTITY,
    Codigo BIGINT,
    Clase NVARCHAR(100),
    Nombre NVARCHAR(100),
    Ubicacion GEOGRAPHY
);


/*-------------------------------------------------------------*/


/*******CONSULTAS PARA INSERCION DE DATOS GPS_VIAJES_TAXI*******/

select ID, Proveedor, FechaHora_Entrega, FechaHora_Recogida, DuracionViaje_Segundos,Distancia_Metros,TiempoEspera_Segundos,
geography::STGeomFromText(UbicacionWKT_Recogida, 4326) AS UbicacionRecogida,
geography::STGeomFromText(UbicacionWKT_Entrega, 4326) AS UbicacionEntrega
from DATOS_GEOGRAFICOS.dbo.TaxiViajes_GPS



/*-------------INSERT CARRETERA_CALLE----------------*/
insert into DATOS_GEOGRAFICOS_LIMPIOS.dbo.Carreteras_Calles(Codigo, Clase, Nombre, Referencia, Sentido_Via, Velocidad_Maxima, EsPuente, EsTunel, Ubicacion)
select c.Osm_id, c.Fclass, c.Name, c.Ref, c.Oneway, c.MaxSpeed, c.Bridge, c.Tunnel,  geography::STGeomFromText(c.Geometria.STAsText(), 4326)
From DATOS_GEOGRAFICOS.dbo.Carreteras_Calles as c
where Name != ''


/*-------------INSERT AGUA----------------*/
insert into DATOS_GEOGRAFICOS_LIMPIOS.dbo.Natural(Codigo, Clase, Nombre, Ubicacion)
select a.Osm_id, a.Fclass, a.Name, geography::STGeomFromText(a.Geometria.STAsText(), 4326)
From DATOS_GEOGRAFICOS.dbo.Agua as a
where a.Name != ''


/*-------------INSERT NATURAL----------------*/
insert into DATOS_GEOGRAFICOS_LIMPIOS.dbo.Natural(Codigo, Clase, Nombre, Ubicacion)
select l.Osm_id, l.Fclass, l.Name, geography::STGeomFromText(l.Geometria.STAsText(), 4326)
From DATOS_GEOGRAFICOS.dbo.Natural as l
where l.Name != ''

/*-------------INSERT NATURAL_MAS_DETALLE----------------*/
insert into DATOS_GEOGRAFICOS_LIMPIOS.dbo.Natural(Codigo, Clase, Nombre, Ubicacion)
select n.Osm_id, n.Fclass, n.Name, geography::STGeomFromText(n.Geometria.STAsText(), 4326)
From DATOS_GEOGRAFICOS.dbo.Natural_mas_Detalle as n
where n.Name != ''


/*-------------INSERT INTERES----------------*/
insert into DATOS_GEOGRAFICOS_LIMPIOS.dbo.Interes(Codigo, Clase, Nombre, Ubicacion)
select i.Osm_id, i.Fclass, i.Name, geography::STGeomFromText(i.Geometria.STAsText(), 4326)
From DATOS_GEOGRAFICOS.dbo.Interes as i
where i.Name != ''


/*-------------INSERT TRAFICO----------------*/
insert into DATOS_GEOGRAFICOS_LIMPIOS.dbo.Trafico(Codigo, Clase, Nombre, Ubicacion)
select t.Osm_id, t.Fclass, t.Name, geography::STGeomFromText(t.Geometria.STAsText(), 4326)
From DATOS_GEOGRAFICOS.dbo.Trafico as t



/*-------------INSERT TRAFICO_MAS_DETALLE----------------*/
insert into DATOS_GEOGRAFICOS_LIMPIOS.dbo.Trafico(Codigo, Clase, Nombre, Ubicacion)
select t.Osm_id, t.Fclass, t.Name, geography::STGeomFromText(t.Geometria.STAsText(), 4326)
From DATOS_GEOGRAFICOS.dbo.Trafico_mas_Detalle as t


/*-------------INSERT LUGARES----------------*/
insert into DATOS_GEOGRAFICOS_LIMPIOS.dbo.Lugares(Codigo, Clase, Poblacion, Nombre, Ubicacion)
select l.Osm_id, l.Fclass, l.Population, l.Name, geography::STGeomFromText(l.Geometria.STAsText(), 4326)
From DATOS_GEOGRAFICOS.dbo.Lugares as l
where l.Name != ''


/*-------------INSERT LUGARES_MAS_DETALLE----------------*/
insert into DATOS_GEOGRAFICOS_LIMPIOS.dbo.Lugares(Codigo, Clase, Poblacion, Nombre, Ubicacion)
select l.Osm_id, l.Fclass, l.Population, l.Name, geography::STGeomFromText(l.Geometria.STAsText(), 4326)
From DATOS_GEOGRAFICOS.dbo.Lugares_mas_Detalle as l
where l.Name != ''


/*-------------INSERT TRANSPORTE----------------*/
insert into DATOS_GEOGRAFICOS_LIMPIOS.dbo.Transporte(Codigo, Clase, Nombre, Ubicacion)
select t.Osm_id, t.Fclass, t.Name, geography::STGeomFromText(t.Geometria.STAsText(), 4326)
From DATOS_GEOGRAFICOS.dbo.Transporte as t
where t.Name != ''


/*-------------INSERT TRANSPORTE_MAS_DETALLE----------------*/
insert into DATOS_GEOGRAFICOS_LIMPIOS.dbo.Transporte(Codigo, Clase, Nombre, Ubicacion)
select t.Osm_id, t.Fclass, t.Name, geography::STGeomFromText(t.Geometria.STAsText(), 4326)
From DATOS_GEOGRAFICOS.dbo.Transporte_mas_Detalle as t
where t.Name != ''



/*==================AGREGANDO ÍNDICES=================================================*/

CREATE SPATIAL INDEX IX_Interes_Ubicacion
ON Interes(Ubicacion);

CREATE SPATIAL INDEX IX_GPS_Viajes_Taxi_Ubicacion_Inicio
ON GPS_Viajes_Taxi(Ubicacion_Inicio);

CREATE SPATIAL INDEX IX_GPS_Viajes_Taxi_Ubicacion_Fin
ON GPS_Viajes_Taxi(Ubicacion_Fin);

CREATE SPATIAL INDEX IDX_CARRETERAS_CALLES_Ubicacion
ON Carreteras_Calles(Ubicacion);

CREATE SPATIAL INDEX IDX_LUGARES_Ubicacion
ON Lugares(Ubicacion);

CREATE SPATIAL INDEX IDX_NATURAL_Ubicacion
ON Natural(Ubicacion);

CREATE SPATIAL INDEX IDX_TRAFICO_Ubicacion
ON Trafico(Ubicacion);

CREATE SPATIAL INDEX IDX_Transporte_Ubicacion
ON Transporte(Ubicacion);