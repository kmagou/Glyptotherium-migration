#bilinear interpolation and trimming raster

library(raster)
library(rgdal)
library(terra)
library(readr)

#political boundaries for Rancholabrean
political <- readOGR("C:/Users/katma/My Drive/Dissertation_research/ENM/Bias file/PBDB_Rotated/PALEOMAP_PoliticalBoundaries/reconstructed_0.11Ma/reconstructed_0.11Ma_polyline.shp")

#Get environmental layers ascii files
path = "C:/Users/katma/Desktop/ENM_Fourth_Try/ascii_112"
file.names <- dir(path, patter=".asc")

setwd("C:/Users/katma/Desktop/ENM_Fourth_Try/ascii_112")
for(i in 1:length(file.names)) {
  r <- raster(file.names[i])
  projection(r) <- "+proj=longlat +datum=WGS84 +no_defs"
  raster::area(r)
}

#generate a raster stack
s <- stack(file.names)
plot(s)
raster::area(s)

#bilinear interpolation to 1 degree grid cells
s_fine = raster(xmn=-180, xmx=180, ymn=-90, ymx=90, ncol=360, nrow=180)
s_resamp <- raster::resample(x=s, y=s_fine, method="bilinear")

#check if it worked
raster::area(s_resamp)

#get occurrence points
setwd("C:/Users/katma/Desktop/ENM_Fourth_Try")
occurrences <- read_csv(file="pts_all.csv", col_names=TRUE)
occurrence_points <- vect(occurrences, geom = c("Long", "Lat"), crs = "+proj=longlat +datum=WGS84")

#create a buffer around the points ~1500 km
pres_buff <- aggregate(buffer(occurrence_points, width = 1500000))
plot(pres_buff, lwd = 2)
plot(political, lwd = 0.5, add = TRUE)
plot(occurrence_points, col = "darkgreen", add = TRUE)

#crop raster to buffer
e <- as(pres_buff, 'Spatial')
raster::crs(e) <- "+proj=longlat +datum=WGS84 +no_defs"
r <- raster::mask(raster::crop(s_resamp, e), e)

plot(r)
raster::area(r)

#save it
setwd("C:/Users/katma/Desktop/ENM_Fourth_Try/ascii_112_buffer/1500km")
raster::writeRaster(stack(r), names(r), bylayer=TRUE, format='ascii')
