#03 population distribution on R 
#17/10
# Why populations disperse over the landscape in a certain manner?

library(sdm)
library(terra)


file <- system.file("external/species.shp", package="sdm")

#Spatvector è una funzione con cui trasformiamo uno shp in un file che R 
#può leggere ....
rana <- vect(file)
rana$Occurrence
rana
plot(rana)

#for view species absence (0) or species presence (1)
#In Sequel: select * , from rana and where Occurance = 1 
#in R = si indica con == 
#in R ; ....

#distribuzione delle rane nello spazio e ogni singolo punto è una coppia di punti
#ogni punto è un vettore praticamente 

# Selecting presences
#for presence put 1 
pres <- rana[rana$Occurrence==1,]
plot(pres)
pres #for the info about this dataset 
pres$Occurrence

# Exercise: select absence and call them abse
#for ansent put 0 
abse <- rana[rana$Occurrence==0,]
plot(abse)
abse #for the info about this dataset 
abse$Occurrence

# Exercise: plot presences and absences, one beside the other
par(mfrow=c(1,2))
plot(pres)
plot(abse)


par(mfrow=c(2,1))
plot(pres)
plot(abse)

dev.off()

# Exercise: plot pres and abse all together with two different colours
plot(pres, col="blue")
points(abse, col="palegreen")


plot(pres, col="blue", pch=19, cex=2) #per ingrandire i punti
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

# temperature predictor
temp <- system.file("external/temperature.asc", package="sdm") 
tempmap <- rast(temp) # from terra package
plot(tempmap)
points(pres, cex=.5)

# exrcise: do the same with vegetation cover
vege <- system.file("external/vegetation.asc", package="sdm") 
vegemap <- rast(vege) # from terra package
plot(vegemap)
points(pres, cex=.5)

# exrcise: do the same with vegetation cover
prec <- system.file("external/precipitation.asc", package="sdm") 
precmap <- rast(prec) # from terra package
plot(precmap)
points(pres, cex=.5)

# final multiframe

par(mfrow=c(2,2))

# elev
plot(elevmap)
points(pres, cex=.5)

# temp
plot(tempmap)
points(pres, cex=.5)

# vege
plot(vegemap)
points(pres, cex=.5)

# prec
plot(precmap)
points(pres, cex=.5)
