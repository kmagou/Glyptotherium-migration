#calculate LTP thresholds
#code from Erin Saupe

library(raster)
library(readr)

#Get 98% thresholds
##Get data
setwd("C:/Users/Kat/Desktop/ENM_Fourth_Try/kuenm")
points <- read.csv("pts_joint.csv")
setwd("C:/Users/Kat/Desktop/ENM_Fourth_Try/kuenm/final_combo_112_median_E_5")
suitabilitySurface <- raster("Glyptotherium_Set_7_112_median_M_0.8_F_t_Set_7_E.asc") #repeat the code in this file for each model

##Get suitability values
pointSuitabilityM <- cbind(points[,2:3],extract(suitabilitySurface, points[,2:3]))
colnames(pointSuitabilityM) <- c("Longitude", "Latitude", "SuitabilityValue")
pointSuitabilityM <- pointSuitabilityM[order(pointSuitabilityM$SuitabilityValue, na.last=NA, decreasing = T),]

#This is for top 98%. Change to preferred threshold. So for MPT, change to 1.
pointSuitabilityM <- pointSuitabilityM[1:as.integer(length(pointSuitabilityM$Longitude)*0.98),]
threshValueM <- min(pointSuitabilityM$SuitabilityValue)

##Reclassify suitability surface
setwd("C:/Users/Kat/Desktop/ENM_Fourth_Try/kuenm/112_median_E_LTP_thresh")
reclassifiedRasterM <- reclassify(suitabilitySurface,c(-Inf,threshValueM,0,threshValueM,Inf,1))
writeRaster(reclassifiedRasterM,"Glyptotherium_projection_median_M_0.8_F_t_Set_7_E_thresh.asc", overwrite = T)

###check if threshold predicts independent points
setwd("C:/Users/Kat/Desktop/ENM_Fourth_Try/kuenm")
points_test = read.csv("pts_brazil.csv")
pts <- points_test[c("LONG", "LAT")]

plot(reclassifiedRasterM)
points(pts)

rasValue=extract(reclassifiedRasterM, pts)

#save LTP threshold value for projections
all = data.frame()
all = rbind(all, threshValueM)
colnames(all)[1] = "LTP thresh value"

write_csv(all, "threshLTP.csv")
