### making a graph to analyze the date distribution for the Glyptotherium data and 
### creating separate csv files

library(readr)
library(ggplot2)
library(tidyverse)
library(deeptime)
library(janitor)

setwd("C:/Users/Kat/Desktop/ENM_Fourth_Try")

#get occurrence data
occurrences = read_csv(file="glyptotherium_compiled_dates_age.csv", col_names=TRUE)
#clean column names
occurrences <- clean_names(occurrences)

#plot of temporal duration by locality
p <- ggplot(occurrences, aes(x = number, y = max_age_ma)) +
  geom_segment(aes(
    xend = number,
    y = min_age_ma,
    yend = max_age_ma
  ),
  color = "#3b3b3b") +

  geom_point(aes(x = number, y = min_age_ma), color = "Purple", size = 1) +
  geom_point(aes(x = number, y = max_age_ma), color = "Dark Green", size = 1) +
  
  coord_flip() +
  theme(
    panel.grid.minor.y = element_blank(),
    panel.grid.major.y = element_blank(),
    legend.position = "none"
  ) +
  labs(x = "Location #", y = "Age (Ma)",)
p

#add geologic time scale
gggeo_scale(p, dat = "North American Land Mammal Ages", pos = "bottom", height = unit(4, "lines"),
            size = 2.5, abbrv = FALSE)

### make a new dataframe for only occurrences between 1.80 and 2.588 Ma (Gelasian)
Gelasian = occurrences[occurrences$average_age_ma > 1.80 & occurrences$average_age_ma < 2.588, ]

### make a new dataframe for only occurrences between 2.588 and 3.60 Ma (Piacenzian)
Piacenzian = occurrences[occurrences$average_age_ma > 2.588 & occurrences$average_age_ma < 3.60, ]

### make a new dataframe for only occurrences between 3.60 Ma and 5.33 (Zanclean)
Zanclean = occurrences[occurrences$average_age_ma > 3.60 & occurrences$average_age_ma < 5.33, ]

### make a new dataframe for only occurrences in Rancholabrean
Rancholabrean = occurrences[occurrences$average_age_ma > 0.014 & occurrences$average_age_ma < 0.240, ]

# make a histogram of this data
p5<-ggplot(Rancholabrean, aes(x=average_age_Ma)) + 
  geom_histogram(color="black", fill="white")
p5
# Add mean line
p5+ geom_vline(aes(xintercept=mean(average_age_Ma)),
              color="blue", linetype="dashed", size=1)
print(mean(Rancholabrean$average_age_Ma))
print(median(Rancholabrean$average_age_Ma))

# save as csv
setwd("C:/Users/Kat/Desktop/ENM_Fourth_Try")
write_csv(x = Rancholabrean, "glyp_rancholabrean.csv")
write_csv(x = Gelasian, "glyp_gelasian.csv")
write_csv(x = Piacenzian, "glyp_piacenzian.csv")
