#Calculate binomial probability of the median models

library(raster)

#Rancholabrean median median LTP
setwd("C:/Users/Kat/Desktop/ENM_Fourth_Try/kuenm/final_combo_112_median_E_5")
suitabilitySurface <- raster("Glyptotherium_projection_median_median_LTPthresh.asc")

plot(suitabilitySurface)

#get number of cells (total and suitable)
cellStats(suitabilitySurface, sum)
cells = freq(suitabilitySurface)

total = cells[1,2] + cells[2,2]
pres = cells[2,2]

#calculate percent area
percent_area = (pres/total)*100

#binomial probability
dbinom(3, size = 3, prob = (pres/total))  

#Rancholabrean median median maxSSS
setwd("C:/Users/Kat/Desktop/ENM_Fourth_Try/kuenm/final_combo_112_median_E_5")
suitabilitySurface <- raster("Glyptotherium_projection_median_median_maxsssthresh.asc")

plot(suitabilitySurface)

#get number of cells (total and suitable)
cellStats(suitabilitySurface, sum)
cells = freq(suitabilitySurface)

total = cells[1,2] + cells[2,2]
pres = cells[2,2]

#calculate percent area
percent_area = (pres/total)*100

#binomial probability
dbinom(1, size = 3, prob = (pres/total))  

#Late Blancan median median LTP
setwd("C:/Users/Kat/Desktop/ENM_Fourth_Try/kuenm/tfgSe_median_E_LTP_thresh/median_median")
suitabilitySurface <- raster("Glyptotherium_projection_median_median_thresh.asc")

plot(suitabilitySurface)

#get number of cells (total and suitable)
cellStats(suitabilitySurface, sum)
cells = freq(suitabilitySurface)

total = cells[1,2] + cells[2,2]
pres = cells[2,2]

#calculate percent area
percent_area = (pres/total)*100

#binomial probability
dbinom(4, size = 6, prob = (pres/total)) 

#Late Blancan median median maxSSS
setwd("C:/Users/Kat/Desktop/ENM_Fourth_Try/kuenm/tfgSe_median_E_maxsss_thresh/median_median")
suitabilitySurface <- raster("Glyptotherium_projection_median_median_maxsssthresh.asc")

plot(suitabilitySurface)

#get number of cells (total and suitable)
cellStats(suitabilitySurface, sum)
cells = freq(suitabilitySurface)

total = cells[1,2] + cells[2,2]
pres = cells[2,2]

#calculate percent area
percent_area = (pres/total)*100

#binomial probability
dbinom(1, size = 6, prob = (pres/total))  

#Middle Blancan median median LTP
setwd("C:/Users/Kat/Desktop/ENM_Fourth_Try/kuenm/tfgSd_median_E_LTP_thresh/median_median")
suitabilitySurface <- raster("Glyptotherium_projection_median_median_thresh.asc")

plot(suitabilitySurface)

#get number of cells (total and suitable)
cellStats(suitabilitySurface, sum)
cells = freq(suitabilitySurface)

total = cells[1,2] + cells[2,2]
pres = cells[2,2]

#calculate percent area
percent_area = (pres/total)*100

#binomial probability
dbinom(8, size = 10, prob = (pres/total)) 

#Middle Blancan median median maxSSS
setwd("C:/Users/Kat/Desktop/ENM_Fourth_Try/kuenm/tfgSd_median_E_maxsss_thresh/median_median")
suitabilitySurface <- raster("Glyptotherium_projection_median_median_maxsssthresh.asc")

plot(suitabilitySurface)

#get number of cells (total and suitable)
cellStats(suitabilitySurface, sum)
cells = freq(suitabilitySurface)

total = cells[1,2] + cells[2,2]
pres = cells[2,2]

#calculate percent area
percent_area = (pres/total)*100

#binomial probability
dbinom(4, size = 10, prob = (pres/total)) 

