#Code to estimate the temporal overlap between species 
# relation among species in time


# relation among species in time
install.packages("overlap")
library(overlap)
?overlap

data(kerinci)

#Exercise : show the first 6 rows of kerinci 
head(kerinci)
#we considered the tiger 

#in general if u want statistics info we use "summer" for view the statisticts 
summary(kerinci)

#creare una nuova colonna nel dataset 
kerinci$timeRad <- kerinci$Time * 2 * pi
kerinci$Timecirc <- kerinci$Time * 2 * pi
summary(kerinci)
head(kerinci)


#tiger data 
names(kerinci)
tiger <- kerinci[kerinci$Sps=="tiger",]
head(tiger)

tigertime <- tiger$Timecirc
densityPlot(tigertime)

timetig <- tiger$timeRad
densityPlot(timetig, rug=TRUE)

# Exercise: select only the data for the macaque individuals and assign them to a new object 
macaque <- kerinci[kerinci$Sps=="macaque",]
head(macaque)
#Exercise : select the time for the macaque data and make a density plot 
timemacaque <- macaque$Timecirc
densityPlot(timemacaque, rug=TRUE)


overlapPlot(tigertime, timemacaque)

#----SQL
macaque <- kerinci[kerinci$Sps=="macaque",]
summary(macaque)

nomacaque <- kerinci[kerinci$Sps!="macaque",]
summary(nomacaque)
