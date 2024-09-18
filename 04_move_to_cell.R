### Moving points to nearest grid cell
### code from Erin Saupe

library(readr)
library(sp)
library(raster)
library(rSDM)

#get your occurrences
setwd("C:/Users/Kat/Desktop/ENM_Fourth_Try")
occurrences <- read_csv(file="glyp_rancholabrean_rotated_spatial_filter.csv", col_names=TRUE)
xy <- data.frame(cbind(occurrences$Longitude, occurrences$Latitude))
colnames(xy) <- c('LONG', 'LAT')

#Label as coordinates - change your names if lat and long are different in your table
coordinates(xy) <- ~ LONG + LAT

#Convert to SpatialPoints Data
shp <- SpatialPoints(xy, proj4string = CRS("+proj=longlat +datum=WGS84"))

#get climate data
path = "C:/Users/Kat/Desktop/ENM_Fourth_Try/ascii_112_buffer/1500km_noantilles_to_use"
file.names <- dir(path, patter=".asc")

setwd("C:/Users/Kat/Desktop/ENM_Fourth_Try/ascii_112_buffer/1500km_noantilles_to_use")
for(i in 1:length(file.names)) {
  r <- raster(file.names[i])
  projection(r) <- "+proj=longlat +datum=WGS84 +no_defs"
  raster::area(r)
}

#generate a raster stack
s <- stack(file.names)
plot(s)
crs(s) <- "+proj=longlat +datum=WGS84" 

#move points to nearest cell
moved <- points2nearestcell(
  locs = shp,
  ras = s,
  move = TRUE,
  showchanges = TRUE,
  showmap = TRUE,
  leaflet = FALSE
)

#save as csv
setwd("C:/Users/Kat/Desktop/ENM_Fourth_Try")
write.csv(moved, "glyp_rancholabrean_rotated_spatial_filter_moved.csv")

###after this step I manually moved the localities from Brazil into their own csv
