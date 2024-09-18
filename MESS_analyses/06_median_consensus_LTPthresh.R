library(raster)

setwd("C:/Users/Kat/Desktop/ENM_Fourth_Try/kuenm_MESS/LTP_112")

raster_files<-list.files("C:/Users/Kat/Desktop/ENM_Fourth_Try/kuenm_MESS/LTP_112", 
                         full.names = T, pattern = "\\.asc$")

r_brick <-stack(raster_files)

plot(r_brick)

mean <- calc(r_brick, fun = mean)

plot(mean)

mean[mean < 1] <- 0

plot(mean)

raster::writeRaster(mean, "median_consensus_LTPthresh_112", format='ascii')

setwd("C:/Users/Kat/Desktop/ENM_Fourth_Try/kuenm")
points_test = read.csv("pts_brazil.csv")
pts <- points_test[c("LONG", "LAT")]

plot(mean)
points(pts)

rasValue=extract(mean, pts)

####projections (repeat for each projection)
setwd("C:/Users/Kat/Desktop/ENM_Fourth_Try/kuenm_MESS/LTP_tfgSe")

raster_files<-list.files("C:/Users/Kat/Desktop/ENM_Fourth_Try/kuenm_MESS/LTP_tfgSe", 
                         full.names = T, pattern = "\\.asc$")

r_brick <-stack(raster_files)

plot(r_brick)

mean <- calc(r_brick, fun = mean)

plot(mean)

mean[mean < 1] <- 0

plot(mean)

raster::writeRaster(mean, "median_consensus_LTPthresh_tfgSe", format='ascii')

setwd("C:/Users/Kat/Desktop/ENM_Fourth_Try/kuenm")
points_test = read.csv("pts_tfgSe.csv")
pts <- points_test[c("LONG", "LAT")]

plot(mean)
points(pts)

rasValue=extract(mean, pts)

