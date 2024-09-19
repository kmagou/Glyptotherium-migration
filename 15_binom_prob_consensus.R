#Calculate binomial probability of the consensus models

library(raster)

#Rancholabrean median consensus LTP
setwd("C:/Users/Kat/Desktop/ENM_Fourth_Try/kuenm/112_median_E_LTP_thresh")
suitabilitySurface <- raster("median_consensus_LTPthresh.asc")

plot(suitabilitySurface)

#get number of cells (total and suitable)
cellStats(suitabilitySurface, sum)
cells = freq(suitabilitySurface)

total = cells[1,2] + cells[2,2]
pres = cells[2,2]

#calculate percent area
percent_area = (pres/total)*100

#binomial probability
dbinom(2, size = 3, prob = (pres/total)) 

#Rancholabrean median consensus maxSSS
setwd("C:/Users/Kat/Desktop/ENM_Fourth_Try/kuenm/112_median_E_maxsss_thresh")
suitabilitySurface <- raster("median_consensus_maxsssthresh.asc")

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

#Late Blancan median consensus LTP
setwd("C:/Users/Kat/Desktop/ENM_Fourth_Try/kuenm/tfgSe_median_E_LTP_thresh")
suitabilitySurface <- raster("median_consensus_LTPthresh.asc")

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

#Late Blancan median consensus maxSSS
setwd("C:/Users/Kat/Desktop/ENM_Fourth_Try/kuenm/tfgSe_median_E_maxsss_thresh")
suitabilitySurface <- raster("median_consensus_maxsssthresh.asc")

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

#Middle Blancan median consensus LTP
setwd("C:/Users/Kat/Desktop/ENM_Fourth_Try/kuenm/tfgSd_median_E_LTP_thresh")
suitabilitySurface <- raster("median_consensus_LTPthresh.asc")

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

#Middle Blancan median consensus maxSSS
setwd("C:/Users/Kat/Desktop/ENM_Fourth_Try/kuenm/tfgSd_median_E_maxsss_thresh")
suitabilitySurface <- raster("median_consensus_maxsssthresh.asc")

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
