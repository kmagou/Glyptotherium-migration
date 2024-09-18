#code from Erin Saupe

library(raster)

setwd("C:/Users/Kat/Desktop/ENM_Fourth_Try/kuenm_MESS/final_models/M_0.8_F_t_Set_7_E/MESS_tfgSe") #repeat the code in this file for each model and projection
suitabilitySurface <- raster("Glyptotherium_median.asc")

##Get suitability value (from threshLTP_.csv)
threshValueM <- 0.347777009010314

##Reclassify suitability surface
setwd("C:/Users/Kat/Desktop/ENM_Fourth_Try/kuenm_MESS/LTP_tfgSe")
reclassifiedRasterM <- reclassify(suitabilitySurface,c(-Inf,threshValueM,0,threshValueM,Inf,1));
writeRaster(reclassifiedRasterM,"Glyptotherium_projection_median_M_0.8_F_t_Set_7_E_thresh.asc", overwrite = T)

###check if threshold predicts independent points
setwd("C:/Users/Kat/Desktop/ENM_Fourth_Try/kuenm")
points_test = read.csv("pts_tfgSe.csv")
pts <- points_test[c("LONG", "LAT")]

plot(reclassifiedRasterM)
points(pts)

rasValue=extract(reclassifiedRasterM, pts)
