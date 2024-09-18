#Code to combine models from Erin Saupe

library(raster)

setwd("C:/Users/Kat/Desktop/ENM_Fourth_Try/kuenm/final_combo_tfgSc_median_E_5") #repeat for each final model

#to make a raster stack automatically if all of your best models are geotiff files in the same folder (and only those models)
raster_files<-list.files("C:/Users/Kat/Desktop/ENM_Fourth_Try/kuenm/final_combo_tfgSc_median_E_5", 
                 full.names = T)

r_brick <-stack(raster_files)

plot(r_brick)

#or, you can also add them individually:

#Mod1 <- raster(“nameofit1.tif”)
#Mod2 <- raster(“nameofit2.tif”)
#Mod3 <- raster(“nameofit3.tif”)

#r_brick <-stack(Mod1, Mod2, Mod3)

# Calculate mean
r_mean <- calc(r_brick, mean)

plot(r_mean)

raster::writeRaster(r_mean, "median_mean", format='ascii')

# Calculate median
r_median <- calc(r_brick, median)

plot(r_median)

raster::writeRaster(r_median, "median_median", format='ascii')

# Calculate sd
r_sd <- calc(r_brick, sd)

plot(r_sd)

raster::writeRaster(r_sd, "median_sd", format='ascii')
