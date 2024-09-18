#code from Erin

library(raster);

#Get 95% threshholds
##Get data
setwd("C:/Users/Kat/Desktop/ENM_Fourth_Try/kuenm")
points <- read.csv("pts_joint.csv");
setwd("C:/Users/Kat/Desktop/ENM_Fourth_Try/kuenm_MESS/final_models/M_0.8_F_lpt_Set_7_E/MESS_112")
suitabilitySurface <- raster("Glyptotherium_median.asc")


##Get suitability values (Maximum training sensitivity plus specificity Cloglog threshold)
threshValueM <- 0.6959


##Reclassify suitability surface
reclassifiedRasterM <- reclassify(suitabilitySurface,c(-Inf,threshValueM,0,threshValueM,Inf,1));
writeRaster(reclassifiedRasterM,"Glyptotherium_median_maxSSS_thresh_M_0.8_F_lpt_Set_7_E.asc", overwrite = T);

#get brazil points and plot
#setwd("C:/Users/Kat/Desktop/ENM_Fourth_Try/kuenm")
#points_test = read.csv("pts_brazil.csv")
#pts <- points_test[c("LONG", "LAT")]


plot(reclassifiedRasterM)
#points(pts)

#rasValue=extract(reclassifiedRasterM, pts)
