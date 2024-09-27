### Moving points to nearest grid cell
### code from Erin Saupe

library(readr)
library(sp)
library(raster)
library(rSDM)
library(enmSdmX)

#get your occurrences
setwd("C:/Users/Kat/Desktop/ENM_Fourth_Try")
occurrences <- read_csv(file="glyp_gelasian_rotated.csv", col_names=TRUE)
xy <- data.frame(cbind(occurrences$coords.x1, occurrences$coords.x2))
colnames(xy) <- c('LONG', 'LAT')

#Label as coordinates - change your names if lat and long are different in your table
coordinates(xy) <- ~ LONG + LAT

#Convert to SpatialPoints Data
shp <- SpatialPoints(xy, proj4string = CRS("+proj=longlat +datum=WGS84"))

#get climate data
path = "C:/Users/Kat/Desktop/ENM_Fourth_Try/kuenm/projection/Set_7/Set_7_tfgSe"
file.names <- dir(path, patter=".asc")

setwd("C:/Users/Kat/Desktop/ENM_Fourth_Try/kuenm/projection/Set_7/Set_7_tfgSe")
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
write.csv(moved, "glyp_gelasian_rotated_moved.csv")

#remove duplicates and save
occs = read_csv(file="glyp_gelasian_rotated_moved.csv", col_names=TRUE)
occs['Species']='Glyptotherium'
occs2 <- occs[,-1]
occs <- occs2 %>% distinct()
occs3 <- elimCellDuplicates(occs, s, longLat=c('LONG', 'LAT'))

setwd("C:/Users/Kat/Desktop/ENM_Fourth_Try/kuenm")
write_csv(occs3, "pts_tfgse.csv")


#repeat for piacenzian
#get your occurrences
setwd("C:/Users/Kat/Desktop/ENM_Fourth_Try")
occurrences <- read_csv(file="glyp_piacenzian_rotated.csv", col_names=TRUE)
xy <- data.frame(cbind(occurrences$coords.x1, occurrences$coords.x2))
colnames(xy) <- c('LONG', 'LAT')

#Label as coordinates - change your names if lat and long are different in your table
coordinates(xy) <- ~ LONG + LAT

#Convert to SpatialPoints Data
shp <- SpatialPoints(xy, proj4string = CRS("+proj=longlat +datum=WGS84"))

#get climate data
path = "C:/Users/Kat/Desktop/ENM_Fourth_Try/kuenm/projection/Set_7/Set_7_tfgSe"
file.names <- dir(path, patter=".asc")

setwd("C:/Users/Kat/Desktop/ENM_Fourth_Try/kuenm/projection/Set_7/Set_7_tfgSe")
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
write.csv(moved, "glyp_piacenzian_rotated_moved.csv")

#remove duplicates and save
occs = read_csv(file="glyp_piacenzian_rotated_moved.csv", col_names=TRUE)
occs['Species']='Glyptotherium'
occs2 <- occs[,-1]
occs <- occs2 %>% distinct()
occs3 <- elimCellDuplicates(occs, s, longLat=c('LONG', 'LAT'))

setwd("C:/Users/Kat/Desktop/ENM_Fourth_Try/kuenm")
write_csv(occs3, "pts_tfgsd.csv")
