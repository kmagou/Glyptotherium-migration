#analyze and plot the movement corridors

library(terra)
library(spatialEco)
library(gdistance)
library(scales)
library(ggplot2)
library(viridis)

#get maxent data
setwd("C:/Users/Kat/Desktop/ENM_Fourth_Try/kuenm/final_combo_tfgSc_median_E_5")
hab_suit = rast("median_median.asc")

plot(hab_suit)

#invert the raster
suit_inv = raster.invert(hab_suit)
#convert to RasterLayer
suit_inv = raster(suit_inv)
#Rescale from 1 to 1000
suit_inv[] = rescale(suit_inv[], to=c(1,1000))
plot(suit_inv)

# create a Transition object from the raster
tr <- transition(suit_inv, transitionFunction = mean, directions = 8)
#Correct for distortion
tr1 <- geoCorrection(tr, type="c", multpl=FALSE)

# Get location coordinates
sites <- SpatialPoints(cbind(c(-70.5, -77), c(-47, 7)))

#Least cost distance
cost1.dist <- costDistance(tr1, sites)

# create start and end points
A <- c(-70.5, -47)
B <- c(-77, 7)

#make a SpatialLines object for visualization
sPath1 <- shortestPath(tr1, A, B, output="SpatialLines")

# Rasterize points using the cost extent
sites2 <- rasterize(x = sites,y = suit_inv)

# Write rasters to your working directory
setwd("C:/Users/Kat/Desktop/ENM_Fourth_Try/kuenm/corridors")
writeRaster(sites2,"sites_rast.asc",overwrite=TRUE)
writeRaster(suit_inv,"cost_rast.asc",overwrite=TRUE)

# Location of the cs_run.exe path
CS_exe <- 'C:/"Program Files"/Circuitscape/cs_run.exe' 

# Make an .ini file
CS_ini <- c("[circuitscape options]",            
            "data_type = raster",
            "scenario = pairwise",
            paste(c("point_file =",
                    "habitat_file ="),
                  paste(getwd(),c("sites_rast.asc",
                                  "cost_rast.asc"),
                        sep="/")),
            "[Output options]",            
            "set_null_currents_to_nodata = False",
            "set_focal_node_currents_to_zero = False",
            "set_null_voltages_to_nodata = False",
            "compress_grids = False",
            "write_cur_maps = 1",
            "write_volt_maps = 0",
            paste(c("output_file ="),
                  paste(getwd(),c("CS.out"),
                        sep="/")),
            "write_cum_cur_map_only = True",
            "log_transform_maps = False",
            "write_max_cur_maps = False")

# Write it to your working directory
writeLines(CS_ini,"myini.ini")

# Make the CS run cmd
CS_run <- paste(CS_exe, paste(getwd(),"myini.ini",sep="/")) # Make the cmd

# Run the command
system(CS_run)

# Import the effective resistance
cum_current = rast("CS_cum_curmap.asc")
plot(cum_current)

#histogram equalize the color scale
str1 <- stretch(cum_current, histeq=TRUE)
plot(str1)

#save and import the raster
writeRaster(str1,"str_cum_current.asc",overwrite=TRUE)
cum_current2 = raster("str_cum_current.asc")

#turn ocean to NA
cum_current2 <- replace(cum_current2, cum_current2<=0.9196714, NA)
plot(cum_current2)

#mask habitat suitability data to same extent
setwd("C:/Users/Kat/Desktop/ENM_Fourth_Try/kuenm/final_combo_tfgSc_median_E_5")
hab_suit1 = raster("median_median.asc")
hab_suit_mask <- mask(hab_suit1, cum_current2)

#make solid raster
bg_rast <- replace(cum_current2, cum_current2>0.9196714, 1)
plot(bg_rast)

#plotting
#set theme
theme_opts <- list(
  theme(
    panel.grid.minor = element_blank(),
    panel.grid.major = element_blank(),
    panel.background = element_rect(fill = 'white', colour = NA),
    plot.background = element_rect(),
    axis.line = element_blank(),
    axis.text.x = element_blank(),
    axis.text.y = element_blank(),
    axis.ticks = element_blank(),
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    plot.title = element_text()
  )
)

#convert rasters to dataframe for plotting
proj4string(cum_current2) <- CRS("+proj=longlat")
cum_current_pts <- rasterToPoints(cum_current2)
cum_current_df <- data.frame(cum_current_pts)

proj4string(hab_suit_mask) <- CRS("+proj=longlat")
hab_suit_mask_pts <- rasterToPoints(hab_suit_mask)
hab_suit_mask_df <- data.frame(hab_suit_mask_pts)

proj4string(bg_rast) <- CRS("+proj=longlat")
bg_rast_pts <- rasterToPoints(bg_rast)
bg_rast_df <- data.frame(bg_rast_pts)

#convert sites to dataframe
coords = data.frame(sites) 
#convert to sf
segment <- sf::st_as_sf(sPath1)

#plot hab suitability
ggplot() +
  geom_raster(data = hab_suit_mask_df, aes(x = x, y = y, fill = median_median)) +
  scale_fill_viridis(option = "D", limits = c(0,1)) +
  theme_opts

#save
setwd("C:/Users/Kat/Desktop/plots")
ggsave("Zanclean_suit.eps", width = 10, height = 7, units = "cm")

#plot circuit data
ggplot() +
  geom_raster(data = cum_current_df, aes(x = x, y = y, fill = CS_cum_curmap)) +
  scale_fill_viridis(option = "G") +
  geom_point(data = coords, aes(coords.x1, coords.x2, group = NULL, fill = NULL), shape = 17, size = 3) +
  theme_opts

#save
setwd("C:/Users/Kat/Desktop/plots")
ggsave("corridor_plot3.eps", width = 10, height = 7, units = "cm")

#plot least cost path
ggplot(segment) +
  geom_raster(data = bg_rast_df, aes(x = x, y = y, fill = CS_cum_curmap)) +
  geom_sf(color = "Red") +
  scale_fill_gradientn(colours=c("grey","white")) +
  geom_point(data = coords, aes(coords.x1, coords.x2, group = NULL, fill = NULL), shape = 17, size = 2) +
  theme_opts

#save
setwd("C:/Users/Kat/Desktop/plots")
ggsave("corridor_plot4.eps", width = 10, height = 7, units = "cm")
