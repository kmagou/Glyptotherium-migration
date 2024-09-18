#getting tolerance levels from LTP thresholds

library(raster)

#load data
setwd("C:/Users/Kat/Desktop/ENM_Fourth_Try/kuenm/112_median_E_LTP_thresh")
suitabilitySurface <- raster("median_consensus_LTPthresh.asc")

plot(suitabilitySurface)

setwd("C:/Users/Kat/Desktop/ENM_Fourth_Try/kuenm/projection/Set_7/Set_7_112")
wet_precip = raster("teitU_sed_formatted_regridded_bio13.asc")
dry_precip = raster("teitU_sed_formatted_regridded_bio14.asc")
cmm = raster("teitU_sed_formatted_regridded_cmm.asc")

r_brick <-stack(suitabilitySurface, wet_precip, dry_precip, cmm)

plot(r_brick)

#Get Overall Raster Stats
cellStats(suitabilitySurface, sum)
cells = freq(suitabilitySurface)

total = cells[1,2] + cells[2,2]
pres = cells[2,2]

percent_area = (pres/total)*100

percent_area

##Extract Bioclim Values to determine tolerances
ptsRasterSuit <- rasterToPoints(suitabilitySurface, fun = function(x){x > 0})

##temperature
coldest_min <- cbind(ptsRasterSuit[,1:2], extract(cmm, ptsRasterSuit[,1:2]))
colnames(coldest_min) <- c("Longitude", "Latitude", "Coldest Month Min temp");
coldestmin_Min <- min(coldest_min[,3])
coldestmin_Max <- max(coldest_min[,3])
M_cmm <- cbind(coldestmin_Min, coldestmin_Max)

#precip dry
precip_dry <- cbind(ptsRasterSuit[,1:2], extract(dry_precip, ptsRasterSuit[,1:2]))
colnames(precip_dry) <- c("Longitude", "Latitude", "Precipitation of driest month");
precipdry_Min <- min(precip_dry[,3])
precipdry_Max <- max(precip_dry[,3])
M_precipdry <- cbind(precipdry_Min, precipdry_Max)

#precip wet
precip_wet <- cbind(ptsRasterSuit[,1:2], extract(wet_precip, ptsRasterSuit[,1:2]))
colnames(precip_wet) <- c("Longitude", "Latitude", "Precipitation of wettest month");
precipwet_Min <- min(precip_wet[,3])
precipwet_Max <- max(precip_wet[,3])
M_precipwet <- cbind(precipwet_Min, precipwet_Max)

#save results
setwd("C:/Users/Kat/Desktop/ENM_Fourth_Try/kuenm")
results <- rbind(M_cmm, M_precipdry, M_precipwet)

colnames(results) <- c("Min", "Max")
rownames(results) <- c("Coldest month min", "Precip Dry", "Precip Wet")
write.csv(results, "112_consensus_tolerance_LTP.csv", row.names=T)
