# Evaluating migration hypotheses for the extinct *Glyptotherium* using Ecological Niche Modeling

## Overview
This project uses Ecological Niche Modeling to test the extent of suitable conditions for *Glyptotherium* in Central America and surrounding regions during the intervals when the taxa is thought to have dispersed during the Great American Biotic Interchange (GABI). This repository contains the code for the corresponding Magoulick et al. (2024) publication in *Ecography*.

## Content and Workflow
The code should be run sequentially according to the number in the file name. Files in [/Figures](/Figures) are for creating the visualizations and files in [/MESS_analyses](/MESS_analyses) correspond to the data in Supplementary File 2.

## Description of the data and file structure

### Final_Data.csv: The data input into our code as "glyptotherium_compiled_dates_age.csv"

#: line number  
Database: PBDB (from the Paleobiology Database); GBIF (from the Global Biodiversity Information Facility); KM  (found from a literature search)  
database id: id number in corresponding database  
sub database: name of sub-database within the database if applicable; PBDB (from the Paleobiology Database)  
PBDB collection #: collection number in Paleobiology Database if applicable  
id: id from the Global Biodiversity Information Facility  
genus: specimen genus name  
specificEpithet: specimen species name  
full: combined genus and species name  
KM notes: additional notes on the specimen/locality  
preparations: indicates the type of specimen  
institution Code: institutional abbreviations for where specimen is located (please refer to corresponding database for list of abbreviations)  
collection Code: collection abbreviations for where specimen is located (please refer to corresponding database for list of abbreviations)  
catalog Number: specimen's catalog number  
catalog locality: specimen's location number  
lat: latitude in decimal degrees  
lng: longitude in decimal degrees  
coordinate uncertainty (meters): coordinate uncertainty in meters  
coordinatePrecision: coordinate precision  
continent: continent where specimen was found  
country: country where specimen was found; United States of America (US), Mexico (MX), Panama (PA), El Salvador (SV), Guatemala (GT), Venezuela (VZ), Costa Rica (CR), Brazil (BR)  
state/Province: state or province where specimen was found  
county: country where specimen was found  
locality: name of locality where specimen was found  
formation: name of formation where specimen was found  
Max age Ma: maximum age of the fossil in millions of years  
Min age Ma: minimum age of the fossil in millions of years  
average age Ma: average age of the fossil in millions of years  
Method: the method of dating used to obtain the ages  
Citation for age: the citation where age data was found  
earliestAgeOrLowestStage: earliest stage of the fossil in the geologic time scale  
earliestEpochOrLowestSeries: earliest epoch of the fossil in the geologic time scale  
latestAgeOrHighestStage: latest stage of the fossil in the geologic time scale  
latestEpochOrHighestSeries: latest epoch of the fossil in the geologic time scale  
lowestBiostratigraphicZone: earliest biostratigraphic zone of the fossil in the geologic time scale  
highestBiostratigraphicZone: latest biostratigraphic zone of the fossil in the geologic time scale  
citation: the citation if the specimen has been written about  

Missing data: N/A  

### Corrected_Dates.xlsx: The color-coded version of the data before we saved it as a csv. Red rows did not have enough data or were duplicates. Orange rows could only be constrained to the Rancholabrean, Green rows had specific dates.  

#: line number  
Database: PBDB (from the Paleobiology Database); GBIF (from the Global Biodiversity Information Facility); KM  (found from a literature search)  
database id: id number in corresponding database  
sub database: name of sub-database within the database if applicable; PBDB (from the Paleobiology Database)  
PBDB collection #: collection number in Paleobiology Database if applicable  
id: id from the Global Biodiversity Information Facility  
genus: specimen genus name  
specificEpithet: specimen species name  
full: combined genus and species name  
KM notes: additional notes on the specimen/locality  
preparations: indicates the type of specimen  
institution Code: institutional abbreviations for where specimen is located (please refer to corresponding database for list of abbreviations)  
collection Code: collection abbreviations for where specimen is located (please refer to corresponding database for list of abbreviations)  
catalog Number: specimen's catalog number  
catalog locality: specimen's location number  
lat: latitude in decimal degrees  
lng: longitude in decimal degrees  
coordinate uncertainty (meters): coordinate uncertainty in meters  
coordinatePrecision: coordinate precision  
continent: continent where specimen was found  
country: country where specimen was found; United States of America (US), Mexico (MX), Panama (PA), El Salvador (SV), Guatemala (GT), Venezuela (VZ), Costa Rica (CR), Brazil (BR)  
state/Province: state or province where specimen was found  
county: country where specimen was found  
locality: name of locality where specimen was found  
formation: name of formation where specimen was found  
Max age (Ma unless specified): maximum age of the fossil in millions of years (unless otherwise specified)  
Min age (Ma unless specified): minimum age of the fossil in millions of years (unless otherwise specified)  
Average age (Ma unless specified): average age of the fossil in millions of years (unless otherwise specified)  
Max age Ma: maximum age of the fossil in millions of years  
Min age Ma: minimum age of the fossil in millions of years  
average age Ma: average age of the fossil in millions of years  
Method: the method of dating used to obtain the ages  
Citation for age: the citation where age data was found  
earliestAgeOrLowestStage: earliest stage of the fossil in the geologic time scale  
earliestEpochOrLowestSeries: earliest epoch of the fossil in the geologic time scale  
latestAgeOrHighestStage: latest stage of the fossil in the geologic time scale  
latestEpochOrHighestSeries: latest epoch of the fossil in the geologic time scale  
lowestBiostratigraphicZone: earliest biostratigraphic zone of the fossil in the geologic time scale  
highestBiostratigraphicZone: latest biostratigraphic zone of the fossil in the geologic time scale  
citation: the citation if the specimen has been written about  

Missing data: N/A
