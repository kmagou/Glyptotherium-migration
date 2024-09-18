#### referenced https://rstudio-pubs-static.s3.amazonaws.com/576095_b15fa0a11e75437dbaa15ffdea992bab.html

library(raster)
library(rgdal)
library(ggplot2)
library(viridis)

#political boundaries
political2 <- readOGR("C:/Users/Kat/Desktop/ENM_Fourth_Try/kuenm/Countries data/world_countries.shp")
plot(political2)

#crop map to north and south america
e <- as(extent(-169, -33, -62, 80), 'SpatialPolygons')
raster::crs(e) <- "+proj=longlat +datum=WGS84 +no_defs"
r <- crop(political2, e)

plot(r)

world_df <- fortify(r)

#get maxent data
setwd("C:/Users/Kat/Desktop/ENM_Fourth_Try/kuenm/final_combo_tfgsc_median_E_5")
glypout <- raster("median_median.asc")
proj4string(glypout) <- CRS("+proj=longlat")
glypout_pts <- rasterToPoints(glypout)
glypout_df <- data.frame(glypout_pts)

#crop map to raster
e2 <- as(extent(glypout), 'SpatialPolygons')
r2 <- crop(political2, e2)
world_df <- fortify(r2)

#get points
setwd("C:/Users/Kat/Desktop/ENM_Fourth_Try/kuenm")
points <- read.csv("pts_tfgsc.csv")

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

#plot
ggplot(data = glypout_df, aes(y = y, x = x)) +
  geom_raster(aes(fill = median_median)) +
  scale_fill_viridis(option = "D", limits = c(0,1)) +
  geom_path(
    data = world_df,
    aes(long, lat, group = group),
    color = "black",
    size = 0.1
  ) +
  theme_opts

#save
setwd("C:/Users/Kat/Desktop/plots")
ggsave("med_med_tfgsc.eps", width = 17, height = 10, units = "cm")

##ZOOM IN
ggplot(data = glypout_df, aes(y = y, x = x)) +
  geom_raster(aes(fill = median_median)) +
  scale_fill_viridis(option = "D", limits = c(0,1)) +
  geom_path(
    data = world_df,
    aes(long, lat, group = group),
    color = "black",
    size = 0.1
  ) +
  coord_cartesian(ylim=c(-5, 30), 
                  xlim=c(-130,-50),
                  expand = FALSE) +
  theme_opts +
  theme(legend.position="none")

#save
setwd("C:/Users/Kat/Desktop/plots")
ggsave("med_med_tfgsc_zoom.eps", width = 15, height = 7, units = "cm")
