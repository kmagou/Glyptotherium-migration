#Code to combine models from Erin
library(raster)

setwd("C:/Users/Kat/Desktop/ENM_Fourth_Try/kuenm_MESS/final_models/M_0.8_F_t_Set_7_E/MESS_tfgSd") #repeat for all five models

#to make a raster stack automatically if all of your best models are geotiff files in the same folder (and only those models)

raster_files<-list.files("C:/Users/Kat/Desktop/ENM_Fourth_Try/kuenm_MESS/final_models/M_0.8_F_t_Set_7_E/MESS_tfgSd", 
                 full.names = T)

r_brick <-stack(raster_files)

plot(r_brick)


# Calculate median
r_median <- calc(r_brick, median)

plot(r_median)

raster::writeRaster(r_median, "Glyptotherium_median", format='ascii')


