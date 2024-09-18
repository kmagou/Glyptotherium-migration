###Calculating VIF to identify collinear variables

library(raster)
library(usdm)

#get the environmental ascii files
path = "C:/Users/Kat/Desktop/ENM_Fourth_Try/ascii_112_buffer/1500km_noantilles"
file.names <- dir(path, patter=".asc")

setwd("C:/Users/Kat/Desktop/ENM_Fourth_Try/ascii_112_buffer/1500km_noantilles")
for(i in 1:length(file.names)) {
  r <- raster(file.names[i])
  projection(r) <- "+proj=longlat +datum=WGS84 +no_defs"
  raster::area(r)
}

#generate a raster stack
s <- stack(file.names)
plot(s)


#calculate VIF with 'usdm'
v1 <- vifcor(s, th=0.9) # identify collinear variables that should be excluded
v1
v2 <- vifstep(s, th=10) # identify collinear variables that should be excluded
v2