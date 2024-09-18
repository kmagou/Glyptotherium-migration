library(raster)

#repeat for all five models

# Get MESS 0
setwd("C:/Users/Kat/Desktop/ENM_Fourth_Try/kuenm_MESS/final_models/M_0.8_F_t_Set_7_E")

suit = raster("Glyptotherium_0_Set_7_112.asc")
mess = raster("Glyptotherium_0_Set_7_112_novel.asc")

plot(suit)

# Reclassify MESS 
noextrapolation <- mess > 0

# Plot No Extrapolation
plot(noextrapolation, main = "Areas of no extrapolation according to MESS")

# clip your raster to the desired limits
noextrapolation[noextrapolation <= 0 ] <- NA
plot(noextrapolation)
clip <- mask(suit, noextrapolation)

# check the result with a plot
plot(clip)

#save
setwd("C:/Users/Kat/Desktop/ENM_Fourth_Try/kuenm_MESS/final_models/M_0.8_F_t_Set_7_E/MESS_112")
raster::writeRaster(clip, "Glyptotherium_0_Set_7_112", format='ascii')


### Repeat for other replicates ####

# Get MESS 1
setwd("C:/Users/Kat/Desktop/ENM_Fourth_Try/kuenm_MESS/final_models/M_0.8_F_t_Set_7_E")

suit = raster("Glyptotherium_1_Set_7_112.asc")
mess = raster("Glyptotherium_1_Set_7_112_novel.asc")

plot(suit)

# Reclassify MESS 
noextrapolation <- mess > 0

# Plot No Extrapolation
plot(noextrapolation, main = "Areas of no extrapolation according to MESS")

# clip your raster to the desired limits
noextrapolation[noextrapolation <= 0 ] <- NA
plot(noextrapolation)
clip <- mask(suit, noextrapolation)

# check the result with a plot
plot(clip)

#save
setwd("C:/Users/Kat/Desktop/ENM_Fourth_Try/kuenm_MESS/final_models/M_0.8_F_t_Set_7_E/MESS_112")
raster::writeRaster(clip, "Glyptotherium_1_Set_7_112", format='ascii')

# Get MESS 2
setwd("C:/Users/Kat/Desktop/ENM_Fourth_Try/kuenm_MESS/final_models/M_0.8_F_t_Set_7_E")

suit = raster("Glyptotherium_2_Set_7_112.asc")
mess = raster("Glyptotherium_2_Set_7_112_novel.asc")

plot(suit)

# Reclassify MESS 
noextrapolation <- mess > 0

# Plot No Extrapolation
plot(noextrapolation, main = "Areas of no extrapolation according to MESS")

# clip your raster to the desired limits
noextrapolation[noextrapolation <= 0 ] <- NA
plot(noextrapolation)
clip <- mask(suit, noextrapolation)

# check the result with a plot
plot(clip)

#save
setwd("C:/Users/Kat/Desktop/ENM_Fourth_Try/kuenm_MESS/final_models/M_0.8_F_t_Set_7_E/MESS_112")
raster::writeRaster(clip, "Glyptotherium_2_Set_7_112", format='ascii')


# Get MESS 3
setwd("C:/Users/Kat/Desktop/ENM_Fourth_Try/kuenm_MESS/final_models/M_0.8_F_t_Set_7_E")

suit = raster("Glyptotherium_3_Set_7_112.asc")
mess = raster("Glyptotherium_3_Set_7_112_novel.asc")

plot(suit)

# Reclassify MESS 
noextrapolation <- mess > 0

# Plot No Extrapolation
plot(noextrapolation, main = "Areas of no extrapolation according to MESS")

# clip your raster to the desired limits
noextrapolation[noextrapolation <= 0 ] <- NA
plot(noextrapolation)
clip <- mask(suit, noextrapolation)

# check the result with a plot
plot(clip)

#save
setwd("C:/Users/Kat/Desktop/ENM_Fourth_Try/kuenm_MESS/final_models/M_0.8_F_t_Set_7_E/MESS_112")
raster::writeRaster(clip, "Glyptotherium_3_Set_7_112", format='ascii')


# Get MESS 4
setwd("C:/Users/Kat/Desktop/ENM_Fourth_Try/kuenm_MESS/final_models/M_0.8_F_t_Set_7_E")

suit = raster("Glyptotherium_4_Set_7_112.asc")
mess = raster("Glyptotherium_4_Set_7_112_novel.asc")

plot(suit)

# Reclassify MESS 
noextrapolation <- mess > 0

# Plot No Extrapolation
plot(noextrapolation, main = "Areas of no extrapolation according to MESS")

# clip your raster to the desired limits
noextrapolation[noextrapolation <= 0 ] <- NA
plot(noextrapolation)
clip <- mask(suit, noextrapolation)

# check the result with a plot
plot(clip)

#save
setwd("C:/Users/Kat/Desktop/ENM_Fourth_Try/kuenm_MESS/final_models/M_0.8_F_t_Set_7_E/MESS_112")
raster::writeRaster(clip, "Glyptotherium_4_Set_7_112", format='ascii')

