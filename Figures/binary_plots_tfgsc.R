library(raster)
library(rgdal)
library(ggplot2)
library(viridis)

political2 <- readOGR("C:/Users/Kat/Desktop/ENM_Fourth_Try/kuenm/Countries data/world_countries.shp")
plot(political2)

#crop map to north and south america
e <- as(extent(-169, -33, -62, 80), 'SpatialPolygons')
raster::crs(e) <- "+proj=longlat +datum=WGS84 +no_defs"
r <- crop(political2, e)

plot(r)

world_df <- fortify(r)

#get maxent data LTP
setwd("C:/Users/Kat/Desktop/ENM_Fourth_Try/kuenm/tfgsc_median_E_LTP_thresh")
glypout <- raster("median_consensus_LTPthresh.asc")
proj4string(glypout) <- CRS("+proj=longlat")
glypout_pts <- rasterToPoints(glypout)
glypout_df <- data.frame(glypout_pts)

#crop map to raster
e2 <- as(extent(glypout), 'SpatialPolygons')
r2 <- crop(political2, e2)
world_df <- fortify(r2)

#get points
#setwd("C:/Users/Kat/Desktop/ENM_Fourth_Try/kuenm")
#points_test = read.csv("pts_tfgsc.csv")
#pts <- points_test[c("LONG", "LAT")]

#categorize points
#rasValue = cbind(pts[,1:2], extract(glypout, pts))
#colnames(rasValue) <- c("Longitude", "Latitude", "Suitability")

#suit = subset(rasValue, Suitability == 1)
#notsuit = subset(rasValue, Suitability == 0)


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

ggplot(data = glypout_df, aes(y = y, x = x)) +
  geom_raster(aes(fill = factor(median_consensus_LTPthresh))) +
  scale_fill_manual(values=c('grey90','plum3')) +
  geom_path(
    data = world_df,
    aes(long, lat, group = group),
    color = "black",
    size = 0.1
  ) +
  theme_opts

#save
setwd("C:/Users/Kat/Desktop/plots")
ggsave("LTP_tfgsc.eps", width = 17, height = 10, units = "cm")

##ZOOM IN
ggplot(data = glypout_df, aes(y = y, x = x)) +
  geom_raster(aes(fill = factor(median_consensus_LTPthresh))) +
  scale_fill_manual(values=c('grey90','plum3')) +
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
  theme(legend.position = "none")

#save
setwd("C:/Users/Kat/Desktop/plots")
ggsave("LTP_tfgsc_zoom.eps", width = 15, height = 7, units = "cm")

#get maxent data MaxSSS
setwd("C:/Users/Kat/Desktop/ENM_Fourth_Try/kuenm/tfgsc_median_E_maxsss_thresh")
glypout <- raster("median_consensus_maxsssthresh.asc")
proj4string(glypout) <- CRS("+proj=longlat")
glypout_pts <- rasterToPoints(glypout)
glypout_df <- data.frame(glypout_pts)

#categorize points
#rasValue = cbind(pts[,1:2], extract(glypout, pts))
#colnames(rasValue) <- c("Longitude", "Latitude", "Suitability")

#suit = subset(rasValue, Suitability == 1)
#notsuit = subset(rasValue, Suitability == 0)

ggplot(data = glypout_df, aes(y = y, x = x)) +
  geom_raster(aes(fill = factor(median_consensus_maxsssthresh))) +
  scale_fill_manual(values=c('grey90','plum3')) +
  geom_path(
    data = world_df,
    aes(long, lat, group = group),
    color = "black",
    size = 0.1
  ) +
  theme_opts

#save
setwd("C:/Users/Kat/Desktop/plots")
ggsave("MaxSSS_tfgsc.eps", width = 17, height = 10, units = "cm")

##ZOOM IN
ggplot(data = glypout_df, aes(y = y, x = x)) +
  geom_raster(aes(fill = factor(median_consensus_maxsssthresh))) +
  scale_fill_manual(values=c('grey90','plum3')) +
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
  theme(legend.position = "none")

#save
setwd("C:/Users/Kat/Desktop/plots")
ggsave("MaxSSS_tfgsc_zoom.eps", width = 15, height = 7, units = "cm")
