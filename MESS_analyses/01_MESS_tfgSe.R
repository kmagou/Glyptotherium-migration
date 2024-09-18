library(raster)

# Get MESS_tfgSe 0
setwd("C:/Users/Kat/Desktop/ENM_Fourth_Try/kuenm_MESS/final_models/M_0.8_F_t_Set_7_E")

suit = raster("Glyptotherium_0_Set_7_tfgSe.asc")
MESS_tfgSe = raster("Glyptotherium_0_Set_7_tfgSe_novel.asc")

plot(suit)

# Reclassify MESS_tfgSe 
noextrapolation <- MESS_tfgSe > 0

# Plot No Extrapolation
plot(noextrapolation, main = "Areas of no extrapolation according to MESS_tfgSe")

# clip your raster to the desired limits
noextrapolation[noextrapolation <= 0 ] <- NA
plot(noextrapolation)
clip <- mask(suit, noextrapolation)

# check the result with a plot
plot(clip)

#save
setwd("C:/Users/Kat/Desktop/ENM_Fourth_Try/kuenm_MESS/final_models/M_0.8_F_t_Set_7_E/MESS_tfgSe")
raster::writeRaster(clip, "Glyptotherium_0_Set_7_tfgSe", format='ascii')


### Repeat for other replicates ####

# Get MESS_tfgSe 1
setwd("C:/Users/Kat/Desktop/ENM_Fourth_Try/kuenm_MESS/final_models/M_0.8_F_t_Set_7_E")

suit = raster("Glyptotherium_1_Set_7_tfgSe.asc")
MESS_tfgSe = raster("Glyptotherium_1_Set_7_tfgSe_novel.asc")

plot(suit)

# Reclassify MESS_tfgSe 
noextrapolation <- MESS_tfgSe > 0

# Plot No Extrapolation
plot(noextrapolation, main = "Areas of no extrapolation according to MESS_tfgSe")

# clip your raster to the desired limits
noextrapolation[noextrapolation <= 0 ] <- NA
plot(noextrapolation)
clip <- mask(suit, noextrapolation)

# check the result with a plot
plot(clip)

#save
setwd("C:/Users/Kat/Desktop/ENM_Fourth_Try/kuenm_MESS/final_models/M_0.8_F_t_Set_7_E/MESS_tfgSe")
raster::writeRaster(clip, "Glyptotherium_1_Set_7_tfgSe", format='ascii')

# Get MESS_tfgSe 2
setwd("C:/Users/Kat/Desktop/ENM_Fourth_Try/kuenm_MESS/final_models/M_0.8_F_t_Set_7_E")

suit = raster("Glyptotherium_2_Set_7_tfgSe.asc")
MESS_tfgSe = raster("Glyptotherium_2_Set_7_tfgSe_novel.asc")

plot(suit)

# Reclassify MESS_tfgSe 
noextrapolation <- MESS_tfgSe > 0

# Plot No Extrapolation
plot(noextrapolation, main = "Areas of no extrapolation according to MESS_tfgSe")

# clip your raster to the desired limits
noextrapolation[noextrapolation <= 0 ] <- NA
plot(noextrapolation)
clip <- mask(suit, noextrapolation)

# check the result with a plot
plot(clip)

#save
setwd("C:/Users/Kat/Desktop/ENM_Fourth_Try/kuenm_MESS/final_models/M_0.8_F_t_Set_7_E/MESS_tfgSe")
raster::writeRaster(clip, "Glyptotherium_2_Set_7_tfgSe", format='ascii')


# Get MESS_tfgSe 3
setwd("C:/Users/Kat/Desktop/ENM_Fourth_Try/kuenm_MESS/final_models/M_0.8_F_t_Set_7_E")

suit = raster("Glyptotherium_3_Set_7_tfgSe.asc")
MESS_tfgSe = raster("Glyptotherium_3_Set_7_tfgSe_novel.asc")

plot(suit)

# Reclassify MESS_tfgSe 
noextrapolation <- MESS_tfgSe > 0

# Plot No Extrapolation
plot(noextrapolation, main = "Areas of no extrapolation according to MESS_tfgSe")

# clip your raster to the desired limits
noextrapolation[noextrapolation <= 0 ] <- NA
plot(noextrapolation)
clip <- mask(suit, noextrapolation)

# check the result with a plot
plot(clip)

#save
setwd("C:/Users/Kat/Desktop/ENM_Fourth_Try/kuenm_MESS/final_models/M_0.8_F_t_Set_7_E/MESS_tfgSe")
raster::writeRaster(clip, "Glyptotherium_3_Set_7_tfgSe", format='ascii')


# Get MESS_tfgSe 4
setwd("C:/Users/Kat/Desktop/ENM_Fourth_Try/kuenm_MESS/final_models/M_0.8_F_t_Set_7_E")

suit = raster("Glyptotherium_4_Set_7_tfgSe.asc")
MESS_tfgSe = raster("Glyptotherium_4_Set_7_tfgSe_novel.asc")

plot(suit)

# Reclassify MESS_tfgSe 
noextrapolation <- MESS_tfgSe > 0

# Plot No Extrapolation
plot(noextrapolation, main = "Areas of no extrapolation according to MESS_tfgSe")

# clip your raster to the desired limits
noextrapolation[noextrapolation <= 0 ] <- NA
plot(noextrapolation)
clip <- mask(suit, noextrapolation)

# check the result with a plot
plot(clip)

#save
setwd("C:/Users/Kat/Desktop/ENM_Fourth_Try/kuenm_MESS/final_models/M_0.8_F_t_Set_7_E/MESS_tfgSe")
raster::writeRaster(clip, "Glyptotherium_4_Set_7_tfgSe", format='ascii')

