#Calculate the median of the median maxSSS thresholds

library(raster)

setwd("C:/Users/Kat/Desktop/ENM_Fourth_Try/kuenm/final_combo_112_median_E_5")
suitabilitySurface <- raster("median_median.asc")

##Get suitability values (Maximum training sensitivity plus specificity Cloglog threshold)
threshValueM <- 0.6959 #median median Maximum training sensitivity plus specificity Cloglog threshold

setwd("C:/Users/Kat/Desktop/ENM_Fourth_Try/kuenm/112_median_E_maxsss_thresh/median_median")

##Reclassify suitability surface
reclassifiedRasterM <- reclassify(suitabilitySurface,c(-Inf,threshValueM,0,threshValueM,Inf,1));
writeRaster(reclassifiedRasterM,"Glyptotherium_projection_median_median_maxsssthresh.asc", overwrite = T);

setwd("C:/Users/Kat/Desktop/ENM_Fourth_Try/kuenm")
points_test = read.csv("pts_brazil.csv")
pts <- points_test[c("LONG", "LAT")]

plot(reclassifiedRasterM)
points(pts)

rasValue=extract(reclassifiedRasterM, pts)

####projections (repeat for each projection)

setwd("C:/Users/Kat/Desktop/ENM_Fourth_Try/kuenm/final_combo_tfgSe_median_E_5")
suitabilitySurface <- raster("median_median.asc")

##Get suitability values (Maximum training sensitivity plus specificity Cloglog threshold)
threshValueM <- 0.6959 #median average Maximum training sensitivity plus specificity Cloglog threshold

setwd("C:/Users/Kat/Desktop/ENM_Fourth_Try/kuenm/tfgSe_median_E_maxsss_thresh/median_median")

##Reclassify suitability surface
reclassifiedRasterM <- reclassify(suitabilitySurface,c(-Inf,threshValueM,0,threshValueM,Inf,1));
writeRaster(reclassifiedRasterM,"Glyptotherium_projection_median_median_maxsssthresh.asc", overwrite = T);

###check if threshold predicts independent points
setwd("C:/Users/Kat/Desktop/ENM_Fourth_Try/kuenm")
points_test = read.csv("pts_tfgse.csv")
pts <- points_test[c("LONG", "LAT")]

plot(reclassifiedRasterM)
points(pts)

rasValue=extract(reclassifiedRasterM, pts)

