#03 population distribution on R 
#03 population distribution on R 
#17/10
# Why populations disperse over the landscape in a certain manner?

library(sdm)
library(terra)


file <- system.file("external/species.shp", package="sdm")

#Spatvector is a function by which we transform a shapefile(shp) into a file that R can read 
rana <- vect(file)
rana #features

rana$Occurrence

plot(rana)

#for view species absence (0) or species presence (1)
#In Sequel: select * , from frog and where Occurrence = 1 
#in R = is indicated by == 
#in R ; is used to separate instructions


#Distribution of frogs in space and each single point is a pair of points
#each point is a vector  

# Selecting presences
#for presences put 1 
pres <- rana[rana$Occurrence==1,]
plot(pres)
pres #for the info about this dataset 
pres$Occurrence

# Exercise: select absences and call them abse
#for absences put 0 
abse <- rana[rana$Occurrence==0,]
plot(abse)
abse #for the info about this dataset 
abse$Occurrence

# Exercise: plot presences and absences, one beside the other
par(mfrow=c(1,2))
plot(pres)
plot(abse)

# Exercise: plot in a multiframe presences on top of absences
par(mfrow=c(2,1))
plot(pres)
plot(abse)

dev.off()

# Exercise: plot pres and abse all together with two different colours
plot(pres, col="blue")
points(abse, col="palegreen")

#plot the presences in blue together with absences in red
plot(pres, col="blue", pch=19, cex=2) #for the largest points
points(abse, col="red",pch=19, cex=2)
dev.off()

# predictors: environmental variables
# file <- system.file("external/species.shp", package="sdm")
# rana <- vect(file)

# elevation predictor
#Covariates
#for asc we use the file raster 
elev <- system.file("external/elevation.asc", package="sdm") #this is a raster file
elevmap <- rast(elev) # from terra package
plot(elevmap)
elevmap #for the info
points(pres, cex=.5)

#Exercise change the colors of the elevamap by the colorRampPalette function
cl <- colorRampPalette(c("palegreen", "purple1", "hotpink"))(100)
plot(elevmap, col=cl)
dev.off()

#Exercise: plot the presences on top with elevation map 
cl <- colorRampPalette(c("palegreen", "purple1", "hotpink"))(100)
plot(elevmap, col=cl)
points(pres, pch=19)


