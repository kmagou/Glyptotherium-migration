#Calculate maxSSS thresholds
#code from Erin Saupe

library(raster);

##Get data
setwd("C:/Users/Kat/Desktop/ENM_Fourth_Try/kuenm/final_combo_112_median_E_5")
suitabilitySurface <- raster("Glyptotherium_Set_7_112_median_M_0.8_F_t_Set_7_E.asc") #repeat the code in this file for each model

##Get suitability values (Maximum training sensitivity plus specificity Cloglog threshold)
threshValueM <- 0.7041

setwd("C:/Users/Kat/Desktop/ENM_Fourth_Try/kuenm/112_median_E_maxsss_thresh")

##Reclassify suitability surface
reclassifiedRasterM <- reclassify(suitabilitySurface,c(-Inf,threshValueM,0,threshValueM,Inf,1));
writeRaster(reclassifiedRasterM,"Glyptotherium_Set_7_112_median_M_0.8_F_t_Set_7_E_thresh.asc", overwrite = T);

###check if threshold predicts independent points
setwd("C:/Users/Kat/Desktop/ENM_Fourth_Try/kuenm")
points_test = read.csv("pts_brazil.csv")
pts <- points_test[c("LONG", "LAT")]

plot(reclassifiedRasterM)
points(pts)

rasValue=extract(reclassifiedRasterM, pts)
