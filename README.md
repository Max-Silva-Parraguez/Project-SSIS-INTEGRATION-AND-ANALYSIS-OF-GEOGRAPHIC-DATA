# Proyecto: Análisis de Datos Geográficos con SSIS

## 📌 Descripción
Este proyecto tiene como objetivo realizar un análisis de datos geográficos relacionados con el transporte urbano en la Ciudad de México, utilizando archivos Shapefiles y datos GPS de viajes en taxi. Se desarrolló un flujo ETL completo con SSIS y SQL Server, integrando, transformando y analizando los datos para obtener insights clave sobre rutas, puntos de interés y movilidad urbana.

## 🛠 Tecnologías utilizadas
- SQL Server
- SSIS (SQL Server Integration Services)
- QGIS (para exploración de datos espaciales)
- C# (.NET Framework) para inserción de Shapefiles
- Archivos Shapefile (.shp)
- Datos GPS (.CSV)
- Microsoft Excel / Archivos CSV para exportar resultados

## 🗃 Estructura de la Base de Datos
Se crearon dos bases de datos:

- **DATOS_GEOGRAFICOS**: Contiene los datos crudos provenientes de los Shapefiles y del archivo CSV GPS.
- **DATOS_GEOGRAFICOS_LIMPIOS**: Almacena solo los datos filtrados y transformados, listos para análisis.

Ambas bases contienen tablas relacionadas con:
- Rutas y carreteras
- Puntos de interés
- Transporte público
- Áreas naturales y cuerpos de agua
- Datos detallados de viajes en taxi

## 🔁 Flujo de trabajo del proyecto
1. Exploración de los archivos Shapefile en QGIS.
2. Inserción de los Shapefiles en SQL Server mediante C# y SSIS.
3. Carga y limpieza de los datos GPS en SSIS.
4. Filtrado y transformación de los datos a una base limpia.
5. Ejecución de consultas SQL para análisis.
6. Exportación de resultados a archivos CSV.

## ▶ Ejecución del proyecto

### Requisitos previos:
- SQL Server y SSIS instalados
- QGIS (opcional para exploración)
- Visual Studio con .NET Framework (para ejecutar los códigos C# de carga Shapefiles)
- Archivos fuente (.shp y .csv)

### Pasos para ejecutar:
1. Crear las bases de datos: `DATOS_GEOGRAFICOS` y `DATOS_GEOGRAFICOS_LIMPIOS` en SQL Server.
2. Ejecutar los proyectos C# para cargar los shapefiles.
3. Ejecutar los paquetes SSIS para carga y transformación de datos.
4. Ejecutar consultas SQL para análisis.
5. Verificar archivos CSV exportados con los resultados.

## 📍 Conclusión
Este proyecto demuestra cómo los datos espaciales, combinados con procesos ETL y análisis en SQL Server, pueden aportar información valiosa para mejorar el transporte urbano, la planificación territorial y la movilidad ciudadana.

## 📝 Notas
El proyecto completo, incluyendo scripts SQL, archivos SSIS y ejecutables, se encuentra en la carpeta de este repositorio.
