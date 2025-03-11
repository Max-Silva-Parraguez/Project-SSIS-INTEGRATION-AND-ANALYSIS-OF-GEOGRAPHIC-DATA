
USE master
GO

CREATE DATABASE DATOS_GEOGRAFICOS;
USE DATOS_GEOGRAFICOS;

/*-----------1. Tabla Natural------------*/
CREATE TABLE Natural (
    Osm_id BIGINT PRIMARY KEY NOT NULL,
    Code INT,
    Fclass NVARCHAR(100),
    Name NVARCHAR(100),
    Geometria GEOMETRY
);


/*-----------2. Tabla Edificio------------*/
CREATE TABLE Edificio (
    Osm_id BIGINT PRIMARY KEY NOT NULL,
    Code INT,
    Fclass NVARCHAR(100),
    Name NVARCHAR(100),
	Type NVARCHAR(100),
    Geometria GEOMETRY
);


/*-----------3. Tabla Suelo------------*/
CREATE TABLE Suelo (
    Osm_id BIGINT,
    Code INT,
    Fclass NVARCHAR(100),
    Name NVARCHAR(100),
    Geometria GEOMETRY
);

/*----4. Tabla Natural mas Detalles----*/
CREATE TABLE Natural_mas_Detalle (
    Osm_id BIGINT PRIMARY KEY NOT NULL,
    Code INT,
    Fclass NVARCHAR(100),
    Name NVARCHAR(100),
    Geometria GEOMETRY
);

/*-----------5. Trafico------------*/
CREATE TABLE Trafico (
    Osm_id BIGINT PRIMARY KEY NOT NULL,
    Code INT,
    Fclass NVARCHAR(100),
    Name NVARCHAR(100),
    Geometria GEOMETRY
);

/*-----------6. Trafico mas Detalle------------*/
CREATE TABLE Trafico_mas_Detalle (
    Osm_id BIGINT PRIMARY KEY NOT NULL,
    Code INT,
    Fclass NVARCHAR(100),
    Name NVARCHAR(100),
    Geometria GEOMETRY
);

/*-----------7. Vias_Ferreas------------*/
CREATE TABLE Vias_Ferreas (
    Osm_id BIGINT PRIMARY KEY NOT NULL,
    Code INT,
    Fclass NVARCHAR(100),
    Name NVARCHAR(100),
	Layer INT,
	Bridge NVARCHAR(5),
	Tunnel NVARCHAR(5),
	Geometria GEOMETRY
);

/*-----------8. Carreteras_Calles------------*/
CREATE TABLE Carreteras_Calles (
    Osm_id BIGINT PRIMARY KEY NOT NULL,
    Code INT,
    Fclass NVARCHAR(100),
    Name NVARCHAR(100),
	Ref NVARCHAR(100),
	Oneway NVARCHAR(5),
	MaxSpeed INT,
	Layer INT,
	Bridge NVARCHAR(5),
	Tunnel NVARCHAR(5),
	Geometria GEOMETRY
);


/*-----------9. Vias_Fluviales------------*/
CREATE TABLE Vias_Fluviales (
    Osm_id BIGINT PRIMARY KEY NOT NULL,
    Code INT,
    Fclass NVARCHAR(100),
	Width INT,
    Name NVARCHAR(100),
	Geometria GEOMETRY
);

/*-----------10. Lugares------------*/
CREATE TABLE Lugares (
    Osm_id BIGINT PRIMARY KEY NOT NULL,
    Code INT,
    Fclass NVARCHAR(100),
    Population INT,
	Name NVARCHAR(100),
	Geometria GEOMETRY
);

/*-----------11. Lugares_mas_Detalle------------*/
CREATE TABLE Lugares_mas_Detalle (
    Osm_id BIGINT PRIMARY KEY NOT NULL,
    Code INT,
    Fclass NVARCHAR(100),
    Population INT,
	Name NVARCHAR(100),
	Geometria GEOMETRY
);

/*-----------12. Interes------------*/
CREATE TABLE Interes (
    Osm_id BIGINT NOT NULL,
    Code INT,
    Fclass NVARCHAR(100),
    Name NVARCHAR(100),
    Geometria GEOMETRY
);

/*-----------13. Interes_mas_Detalle------------*/
CREATE TABLE Interes_mas_Detalle (
    Osm_id BIGINT NOT NULL,
    Code INT,
    Fclass NVARCHAR(100),
    Name NVARCHAR(100),
    Geometria GEOMETRY
);

/*-----------14. Culto------------*/
CREATE TABLE Culto (
    Osm_id BIGINT PRIMARY KEY NOT NULL,
    Code INT,
    Fclass NVARCHAR(100),
    Name NVARCHAR(100),
    Geometria GEOMETRY
);


/*-----------15. Culto_mas_Detalle------------*/
CREATE TABLE Culto_mas_Detalle (
    Osm_id BIGINT PRIMARY KEY NOT NULL,
    Code INT,
    Fclass NVARCHAR(100),
    Name NVARCHAR(100),
    Geometria GEOMETRY
);


/*-----------16. Transporte------------*/
CREATE TABLE Transporte (
    Osm_id BIGINT NOT NULL,
    Code INT,
    Fclass NVARCHAR(100),
    Name NVARCHAR(100),
    Geometria GEOMETRY
);


/*-----------17. Transporte_mas_Detalle------------*/
CREATE TABLE Transporte_mas_Detalle (
    Osm_id BIGINT NOT NULL,
    Code INT,
    Fclass NVARCHAR(100),
    Name NVARCHAR(100),
    Geometria GEOMETRY
);


/*-----------18. Agua------------*/
CREATE TABLE Agua (
    Osm_id BIGINT NOT NULL,
    Code INT,
    Fclass NVARCHAR(100),
    Name NVARCHAR(100),
    Geometria GEOMETRY
);

/*--------------------------------------------------------------------------------*/
/*-------------DATOS GPS-----------------------*/
CREATE TABLE TaxiViajes_GPS (
    ID INT PRIMARY KEY,
    Proveedor NVARCHAR(50),
    FechaHora_Recogida DATETIME,
    FechaHora_Entrega DATETIME,
    Longitud_Recogida FLOAT,
    Latitud_Recogida FLOAT,
    Longitud_Entrega FLOAT,
    Latitud_Entrega FLOAT,
    Indicador_Almacenamiento_Reenvio NVARCHAR(10),
    DuracionViaje_Segundos INT,
    Distancia_Metros INT,
    TiempoEspera_Segundos BIGINT,
	UbicacionWKT_Recogida NVARCHAR(200),
	UbicacionWKT_Entrega NVARCHAR(200)
);

/*==============================================*/


select * from Agua
select * from Carreteras_Calles
select * from Culto
select * from Culto_mas_Detalle
select * from Edificio
select * from Interes
select * from Interes_mas_Detalle
select * from Lugares
select * from Lugares_mas_Detalle
select * from Natural
select * from Natural_mas_Detalle
select * from Suelo
select * from Trafico
select * from Trafico_mas_Detalle
select * from Transporte
select * from Transporte_mas_Detalle
select * from Vias_Ferreas
select * from Vias_Fluviales





