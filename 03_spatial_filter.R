### Filtering spatially/geographically
### Based on code from Erin Saupe

library(spThin)
library(readr)

setwd("C:/Users/Kat/Desktop/ENM_Fourth_Try")

#get the data
occurrences = read_csv(file="glyp_rancholabrean_counts_nobrazil.csv", col_names=TRUE)

#Make a plot of the full data set
plot(occurrences$x, occurrences$y)

#add a column and give it the same value
occurrences['Name']='Glyp' 

#the thin function returns spatially thinned species occurrence data sets. 
#A randomization algorithm is used to create the data set in which all occurrence 
#locations are at least thin.par distance apart. The threshold for thing.par 
#depends in part on the biology of your species (e.g., home range size)

#records separated by 200km, 100 reps
thinned_occurrences <- thin(loc.data = occurrences, lat.col= "y", long.col= "x", spec.col = "Name", thin.par = 200, reps = 100, locs.thinned.list.return = TRUE, write.files = FALSE)

#check out which points have been thinned. Add the thinned dataset to the full occurrence plot. The thinned points are red, which means the black points you see were removed. 
points(thinned_occurrences[[1]]$Longitude, thinned_occurrences[[1]]$Latitude, col="red", pch=20)

#save to file
write.table(thinned_occurrences[[1]], file="glyp_rancholabrean_rotated_spatial_filter.csv", row.names=F, sep=",")
