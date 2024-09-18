#calculate LTP thresholds for time period projections
#code from Erin Saupe

library(raster)

##Get data
setwd("C:/Users/Kat/Desktop/ENM_Fourth_Try/kuenm/final_combo_tfgSe_median_E_5")
suitabilitySurface <- raster("Glyptotherium_Set_7_tfgSe_median_M_0.8_F_t_Set_7_E.asc") #repeat the code in this file for each model in each of the 3 projections 

##Get suitability value (from threshLTP.csv)
threshValueM <- 0.347777009010314

setwd("C:/Users/Kat/Desktop/ENM_Fourth_Try/kuenm/tfgSe_median_E_LTP_thresh")

##Reclassify suitability surface
reclassifiedRasterM <- reclassify(suitabilitySurface,c(-Inf,threshValueM,0,threshValueM,Inf,1));
writeRaster(reclassifiedRasterM,"Glyptotherium_projection_median_M_0.8_F_t_Set_7_E_thresh.asc", overwrite = T)

###check if threshold predicts independent points
setwd("C:/Users/Kat/Desktop/ENM_Fourth_Try/kuenm")
points_test = read.csv("pts_tfgSe.csv")
pts <- points_test[c("LONG", "LAT")]

plot(reclassifiedRasterM)
points(pts)

rasValue=extract(reclassifiedRasterM, pts)
