# Project: GEOGRAPHIC DATA INTEGRATION AND ANALYSIS PROJECT USING SSIS

## 📌 Description
This project aims to perform an analysis of geographic data related to urban transportation in Mexico City, using Shapefiles and GPS data from taxi trips. A complete ETL flow was developed with SSIS and SQL Server, integrating, transforming and analyzing the data to obtain key insights on routes, points of interest and urban mobility.

## 🛠 Technologies used
- SQL Server
- SSIS (SQL Server Integration Services)
- QGIS (for spatial data exploration)
- C# (.NET Framework) for inserting Shapefiles
- Shapefile files (.shp)
- GPS data (.CSV)
- Microsoft Excel / CSV files to export results

## 🗃 Database Structure
Two databases were created:

- **GEOGRAPHIC_DATA**: Contains the raw data from the Shapefiles and the GPS CSV file.
- **CLEAN_GEOGRAPHIC_DATA**: Stores only filtered and transformed data, ready for analysis.

Both databases contain tables related to:
- Routes and roads
- Points of interest
- Public transport
- Natural areas and bodies of water
- Detailed taxi trip data

## 🔁 Project workflow
1. Exploring the Shapefiles in QGIS.
2. Inserting the Shapefiles into SQL Server using C# and SSIS.
3. Loading and cleaning the GPS data into SSIS.
4. Filtering and transforming the data to a clean database.
5. Running SQL queries for analysis.
6. Exporting results to CSV files.

## ▶ Project execution

### Prerequisites:
- SQL Server and SSIS installed
- QGIS (optional for exploration)
- Visual Studio with .NET Framework (to run the C# codes to load Shapefiles)
- Source files (.shp and .csv)

### Steps to execute:
1. Create the databases: `DATOS_GEOGRAFICOS` and `DATOS_GEOGRAFICOS_LIMPIOS` in SQL Server.
2. Run the C# projects to load the shapefiles.
3. Run the SSIS packages for data loading and transformation.
4. Run SQL queries for analysis.
5. Verify exported CSV files with the results.

## 📍 Conclusion
This project demonstrates how spatial data, combined with ETL processes and analysis in SQL Server, can provide valuable information to improve urban transport, territorial planning and citizen mobility.

## 📝 Notes
The complete project, including SQL scripts, SSIS files and executables, is located in the folder of this repository. And the complete documentation is in the pdf: SSIS - Geographic Data Analysis.pdf
