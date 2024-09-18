#figure for plotting sites colored by NALMA age

library(readr)
library(ggplot2)
library(terra)
library(maptools)
library(dplyr)
require(maps)

setwd("C:/Users/Kat/Desktop/ENM_Fourth_Try")

occurrences = read_csv(file="glyptotherium_compiled_dates_age.csv", col_names=TRUE)

names(occurrences)

world_map <- map_data("world")

p = ggplot() +
  geom_polygon(data = world_map, aes(x = long, y = lat, group = group), fill="lightgray", colour = "white") +
  geom_point(data = occurrences, aes(x = lng, y = lat, color = cut(occurrences$`average age Ma`, breaks = c(0.014, 0.240, 1.806, 4.75))), size = 2, show.legend = TRUE) +
  coord_fixed(xlim = c(min(occurrences$lng),max(occurrences$lng)), ylim = c(min(occurrences$lat),max(occurrences$lat))) +
  labs(title = "Glyptotherium Fossils", color = "NALMA Age", x = "", y = "")

p + scale_color_manual(name = "Age", 
                      values = c("forestgreen", "cyan3", "darkmagenta"),
                      labels = c("Rancholabrean", "Irvingtonian", "Blancan"))

#count occurences
### make a new dataframe for only occurrences in Blancan
Blancan = occurrences[occurrences$`average age Ma` > 1.806 & occurrences$`average age Ma` < 4.75, ]

### make a new dataframe for only occurrences in Irvingtonian
Irvingtonian = occurrences[occurrences$`average age Ma` > 0.240 & occurrences$`average age Ma` < 1.806, ]

### make a new dataframe for only occurrences in Rancholabrean
Rancholabrean = occurrences[occurrences$`average age Ma` > 0.014 & occurrences$`average age Ma` < 0.240, ]

### Now a map of spatially filtered data
setwd("C:/Users/Kat/Desktop/ENM_Fourth_Try/kuenm")

occurrences2 = read_csv(file="pts_joint.csv", col_names=TRUE)
occurrences3 = read_csv(file="pts_brazil.csv", col_names=TRUE)

occurrences4 <- rbind(occurrences2, occurrences3)

p = ggplot() +
    geom_polygon(data = world_map, aes(x = long, y = lat, group = group), fill="lightgray", colour = "white") +
    geom_point(data = occurrences4, aes(x = LONG, y = LAT), color="forestgreen", size = 2) +
    coord_fixed(xlim = c(min(occurrences4$LONG),max(occurrences4$LONG)), ylim = c(min(occurrences4$LAT),max(occurrences4$LAT))) +
    labs(title = "Glyptotherium Fossils", x = "", y = "")
    
p    
