### Calculating continuous boyce index

library(ecospat)
library(raster)

setwd("C:/Users/Kat/Desktop/ENM_Fourth_Try/kuenm/final_models/M_0.8_F_lpt_Set_7_E") #repeat for each of the five models

fit = raster::raster("Glyptotherium_median.asc") #use initial calibration area
setwd("C:/Users/Kat/Desktop/ENM_Fourth_Try/kuenm")
points <- read.csv("pts_train.csv") #use training points
presence_coords <- points[c("LONG", "LAT")]


ecospat.boyce(fit, obs=presence_coords, nclass=0, window.w="default", res=100, PEplot = TRUE, 
               rm.duplicate = TRUE, method = 'spearman')

