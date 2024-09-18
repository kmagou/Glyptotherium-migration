#code from Erin

library(raster)
library(readr)

#Get 98% threshholds
##Get data
setwd("C:/Users/Kat/Desktop/ENM_Fourth_Try/kuenm")
points <- read.csv("pts_joint.csv");
setwd("C:/Users/Kat/Desktop/ENM_Fourth_Try/kuenm_MESS/final_models/M_0.8_F_lpt_Set_7_E/MESS_112") #repeat the code in this file for each model
suitabilitySurface <- raster("Glyptotherium_median.asc")

##Get suitability values
pointSuitabilityM <- cbind(points[,2:3],extract(suitabilitySurface, points[,2:3]));
colnames(pointSuitabilityM) <- c("Longitude", "Latitude", "SuitabilityValue");
pointSuitabilityM <- pointSuitabilityM[order(pointSuitabilityM$SuitabilityValue, na.last=NA, decreasing = T),];

#This is for top 98%. Change to preferred threshold. So for MPT, change to 1.
pointSuitabilityM <- pointSuitabilityM[1:as.integer(length(pointSuitabilityM$Longitude)*0.98),];
threshValueM <- min(pointSuitabilityM$SuitabilityValue);

##Reclassify suitability surface
setwd("C:/Users/Kat/Desktop/ENM_Fourth_Try/kuenm_MESS/LTP_112")
reclassifiedRasterM <- reclassify(suitabilitySurface,c(-Inf,threshValueM,0,threshValueM,Inf,1));
writeRaster(reclassifiedRasterM,"Glyptotherium_median_LTP_thresh_M_0.8_F_lpt_Set_7_E.asc", overwrite = T)

###check if threshold predicts independent points
setwd("C:/Users/Kat/Desktop/ENM_Fourth_Try/kuenm")
points_test = read.csv("pts_brazil.csv")
pts <- points_test[c("LONG", "LAT")]

plot(reclassifiedRasterM)
points(pts)

rasValue=extract(reclassifiedRasterM, pts)

#save LTP threshold value for projections
setwd("C:/Users/Kat/Desktop/ENM_Fourth_Try/kuenm_MESS/LTP_112")

all = data.frame()
all = rbind(all, threshValueM)
colnames(all)[1] = "LTP thresh value"

write_csv(all, "threshLTP_M_0.8_F_lpt_Set_7_E.csv")
