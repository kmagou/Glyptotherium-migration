library(raster)

# Get MESS_tfgSc 0
setwd("C:/Users/Kat/Desktop/ENM_Fourth_Try/kuenm_MESS/final_models/M_0.8_F_t_Set_7_E")

suit = raster("Glyptotherium_0_Set_7_tfgSc.asc")
MESS_tfgSc = raster("Glyptotherium_0_Set_7_tfgSc_novel.asc")

plot(suit)

# Reclassify MESS_tfgSc 
noextrapolation <- MESS_tfgSc > 0

# Plot No Extrapolation
plot(noextrapolation, main = "Areas of no extrapolation according to MESS_tfgSc")

# clip your raster to the desired limits
noextrapolation[noextrapolation <= 0 ] <- NA
plot(noextrapolation)
clip <- mask(suit, noextrapolation)

# check the result with a plot
plot(clip)

#save
setwd("C:/Users/Kat/Desktop/ENM_Fourth_Try/kuenm_MESS/final_models/M_0.8_F_t_Set_7_E/MESS_tfgSc")
raster::writeRaster(clip, "Glyptotherium_0_Set_7_tfgSc", format='ascii')


### Repeat for other replicates ####

# Get MESS_tfgSc 1
setwd("C:/Users/Kat/Desktop/ENM_Fourth_Try/kuenm_MESS/final_models/M_0.8_F_t_Set_7_E")

suit = raster("Glyptotherium_1_Set_7_tfgSc.asc")
MESS_tfgSc = raster("Glyptotherium_1_Set_7_tfgSc_novel.asc")

plot(suit)

# Reclassify MESS_tfgSc 
noextrapolation <- MESS_tfgSc > 0

# Plot No Extrapolation
plot(noextrapolation, main = "Areas of no extrapolation according to MESS_tfgSc")

# clip your raster to the desired limits
noextrapolation[noextrapolation <= 0 ] <- NA
plot(noextrapolation)
clip <- mask(suit, noextrapolation)

# check the result with a plot
plot(clip)

#save
setwd("C:/Users/Kat/Desktop/ENM_Fourth_Try/kuenm_MESS/final_models/M_0.8_F_t_Set_7_E/MESS_tfgSc")
raster::writeRaster(clip, "Glyptotherium_1_Set_7_tfgSc", format='ascii')

# Get MESS_tfgSc 2
setwd("C:/Users/Kat/Desktop/ENM_Fourth_Try/kuenm_MESS/final_models/M_0.8_F_t_Set_7_E")

suit = raster("Glyptotherium_2_Set_7_tfgSc.asc")
MESS_tfgSc = raster("Glyptotherium_2_Set_7_tfgSc_novel.asc")

plot(suit)

# Reclassify MESS_tfgSc 
noextrapolation <- MESS_tfgSc > 0

# Plot No Extrapolation
plot(noextrapolation, main = "Areas of no extrapolation according to MESS_tfgSc")

# clip your raster to the desired limits
noextrapolation[noextrapolation <= 0 ] <- NA
plot(noextrapolation)
clip <- mask(suit, noextrapolation)

# check the result with a plot
plot(clip)

#save
setwd("C:/Users/Kat/Desktop/ENM_Fourth_Try/kuenm_MESS/final_models/M_0.8_F_t_Set_7_E/MESS_tfgSc")
raster::writeRaster(clip, "Glyptotherium_2_Set_7_tfgSc", format='ascii')


# Get MESS_tfgSc 3
setwd("C:/Users/Kat/Desktop/ENM_Fourth_Try/kuenm_MESS/final_models/M_0.8_F_t_Set_7_E")

suit = raster("Glyptotherium_3_Set_7_tfgSc.asc")
MESS_tfgSc = raster("Glyptotherium_3_Set_7_tfgSc_novel.asc")

plot(suit)

# Reclassify MESS_tfgSc 
noextrapolation <- MESS_tfgSc > 0

# Plot No Extrapolation
plot(noextrapolation, main = "Areas of no extrapolation according to MESS_tfgSc")

# clip your raster to the desired limits
noextrapolation[noextrapolation <= 0 ] <- NA
plot(noextrapolation)
clip <- mask(suit, noextrapolation)

# check the result with a plot
plot(clip)

#save
setwd("C:/Users/Kat/Desktop/ENM_Fourth_Try/kuenm_MESS/final_models/M_0.8_F_t_Set_7_E/MESS_tfgSc")
raster::writeRaster(clip, "Glyptotherium_3_Set_7_tfgSc", format='ascii')


# Get MESS_tfgSc 4
setwd("C:/Users/Kat/Desktop/ENM_Fourth_Try/kuenm_MESS/final_models/M_0.8_F_t_Set_7_E")

suit = raster("Glyptotherium_4_Set_7_tfgSc.asc")
MESS_tfgSc = raster("Glyptotherium_4_Set_7_tfgSc_novel.asc")

plot(suit)

# Reclassify MESS_tfgSc 
noextrapolation <- MESS_tfgSc > 0

# Plot No Extrapolation
plot(noextrapolation, main = "Areas of no extrapolation according to MESS_tfgSc")

# clip your raster to the desired limits
noextrapolation[noextrapolation <= 0 ] <- NA
plot(noextrapolation)
clip <- mask(suit, noextrapolation)

# check the result with a plot
plot(clip)

#save
setwd("C:/Users/Kat/Desktop/ENM_Fourth_Try/kuenm_MESS/final_models/M_0.8_F_t_Set_7_E/MESS_tfgSc")
raster::writeRaster(clip, "Glyptotherium_4_Set_7_tfgSc", format='ascii')

