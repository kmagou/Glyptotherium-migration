#Calculate the consensus of the median maxSSS thresholds

library(raster)

#get files
setwd("C:/Users/Kat/Desktop/ENM_Fourth_Try/kuenm/112_median_E_maxsss_thresh")
raster_files<-list.files("C:/Users/Kat/Desktop/ENM_Fourth_Try/kuenm/112_median_E_maxsss_thresh", 
                         full.names = T, pattern = "\\.asc$")
r_brick <-stack(raster_files)
plot(r_brick)

#calculate the mean
mean <- calc(r_brick, fun = mean)
plot(mean)

#remove any mean less than 1
mean[mean < 1] <- 0
plot(mean)

raster::writeRaster(mean, "median_consensus_maxsssthresh", format='ascii')

###check if threshold predicts independent points
setwd("C:/Users/Kat/Desktop/ENM_Fourth_Try/kuenm")
points_test = read.csv("pts_brazil.csv")
pts <- points_test[c("LONG", "LAT")]

plot(mean)
points(pts)

rasValue=extract(mean, pts)

####projections (repeat for each projection)
#get files
setwd("C:/Users/Kat/Desktop/ENM_Fourth_Try/kuenm/tfgSe_median_E_maxsss_thresh")
raster_files<-list.files("C:/Users/Kat/Desktop/ENM_Fourth_Try/kuenm/tfgSe_median_E_maxsss_thresh", 
                         full.names = T, pattern = "\\.asc$")
r_brick <-stack(raster_files)
plot(r_brick)

#calculate the mean
mean <- calc(r_brick, fun = mean)
plot(mean)

#remove any mean less than 1
mean[mean < 1] <- 0
plot(mean)

raster::writeRaster(mean, "median_consensus_maxsssthresh", format='ascii')

###check if threshold predicts independent points
setwd("C:/Users/Kat/Desktop/ENM_Fourth_Try/kuenm")
points_test = read.csv("pts_tfgSe.csv")
pts <- points_test[c("LONG", "LAT")]

plot(mean)
points(pts)

rasValue=extract(mean, pts)
