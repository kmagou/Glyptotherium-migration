library(raster)

setwd("C:/Users/Kat/Desktop/ENM_Fourth_Try/kuenm_MESS/final_combo_112_median_E_5_MESS")
suitabilitySurface <- raster("median_median.asc")

##Get suitability values (Maximum training sensitivity plus specificity Cloglog threshold)
threshValueM <- 0.6959 #median median Maximum training sensitivity plus specificity Cloglog threshold

setwd("C:/Users/Kat/Desktop/ENM_Fourth_Try/kuenm_MESS/maxSSS_112")

##Reclassify suitability surface
reclassifiedRasterM <- reclassify(suitabilitySurface,c(-Inf,threshValueM,0,threshValueM,Inf,1));
writeRaster(reclassifiedRasterM,"Glyptotherium_projection_median_median_maxsssthresh.asc", overwrite = T);

setwd("C:/Users/Kat/Desktop/ENM_Fourth_Try/kuenm")
points_test = read.csv("pts_brazil.csv")
pts <- points_test[c("LONG", "LAT")]

plot(reclassifiedRasterM)
points(pts)

rasValue=extract(reclassifiedRasterM, pts)


#projection
setwd("C:/Users/Kat/Desktop/ENM_Fourth_Try/kuenm_MESS/final_combo_tfgSe_median_E_5_MESS")
suitabilitySurface <- raster("median_median.asc")

##Get suitability values (Maximum training sensitivity plus specificity Cloglog threshold)
threshValueM <- 0.6959 #median average Maximum training sensitivity plus specificity Cloglog threshold

setwd("C:/Users/Kat/Desktop/ENM_Fourth_Try/kuenm_MESS/maxSSS_tfgSe")

##Reclassify suitability surface
reclassifiedRasterM <- reclassify(suitabilitySurface,c(-Inf,threshValueM,0,threshValueM,Inf,1));
writeRaster(reclassifiedRasterM,"Glyptotherium_projection_median_median_maxsssthresh.asc", overwrite = T);

setwd("C:/Users/Kat/Desktop/ENM_Fourth_Try/kuenm")
points_test = read.csv("pts_tfgSe.csv")
pts <- points_test[c("LONG", "LAT")]

plot(reclassifiedRasterM)
points(pts)

rasValue=extract(reclassifiedRasterM, pts)

