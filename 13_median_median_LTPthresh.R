#Calculate the median of the median LTP thresholds

library(raster)

setwd("C:/Users/Kat/Desktop/ENM_Fourth_Try/kuenm")
points <- read.csv("pts_joint.csv");
setwd("C:/Users/Kat/Desktop/ENM_Fourth_Try/kuenm/final_combo_112_median_E_5")
suitabilitySurface <- raster("median_median.asc")

##Get suitability values
pointSuitabilityM <- cbind(points[,2:3],extract(suitabilitySurface, points[,2:3]));
colnames(pointSuitabilityM) <- c("Longitude", "Latitude", "SuitabilityValue");
pointSuitabilityM <- pointSuitabilityM[order(pointSuitabilityM$SuitabilityValue, na.last=NA, decreasing = T),];

#This is for top 98%. Change to preferred threshold. So for MPT, change to 1.
pointSuitabilityM <- pointSuitabilityM[1:as.integer(length(pointSuitabilityM$Longitude)*0.98),];
threshValueM <- min(pointSuitabilityM$SuitabilityValue);

##Reclassify suitability surface
reclassifiedRasterM <- reclassify(suitabilitySurface,c(-Inf,threshValueM,0,threshValueM,Inf,1));
writeRaster(reclassifiedRasterM,"Glyptotherium_projection_median_median_LTPthresh.asc", overwrite = T)

###check if threshold predicts independent points
setwd("C:/Users/Kat/Desktop/ENM_Fourth_Try/kuenm")
points_test = read.csv("pts_brazil.csv")
pts <- points_test[c("LONG", "LAT")]

plot(reclassifiedRasterM)
points(pts)

rasValue=extract(reclassifiedRasterM, pts)

#projection (repeat for each)
setwd("C:/Users/Kat/Desktop/ENM_Fourth_Try/kuenm/final_combo_tfgSe_median_E_5")
suitabilitySurface <- raster("median_median.asc")

##Get suitability value (from threshLTP.csv)
threshValueM <- 0.347777009010314

setwd("C:/Users/Kat/Desktop/ENM_Fourth_Try/kuenm/tfgSe_median_E_LTP_thresh/median_median")

##Reclassify suitability surface
reclassifiedRasterM <- reclassify(suitabilitySurface,c(-Inf,threshValueM,0,threshValueM,Inf,1))
writeRaster(reclassifiedRasterM,"Glyptotherium_projection_median_median_thresh.asc", overwrite = T)

###check if threshold predicts independent points
setwd("C:/Users/Kat/Desktop/ENM_Fourth_Try/kuenm")
points_test = read.csv("pts_tfgse.csv")
pts <- points_test[c("LONG", "LAT")]

plot(reclassifiedRasterM)
points(pts)

rasValue=extract(reclassifiedRasterM, pts)
