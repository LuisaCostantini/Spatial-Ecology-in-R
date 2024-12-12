#12/12 

# Measurement of RS based variability

library(imageRy)
library(terra)
library(viridis)

im.list()

sent <- im.import("sentinel.png")

im.plotRGB(sent, r=1, g=2, b=3)
# band 1 = NIR (on top of the red component) the vegetation became red 
# band 2 = red 
# band 3 = green #rock

im.plotRGB(sent, r=2, g=1, b=3) 
im.plotRGB(sent, r=2, g=3, b=1) #il giallo ci aiuta a cercaRE INFO 
dev.off()

#Measuring standard deviation 
# we use focal to measure the variability 
#moving window
nir <- sent[[1]]
plot(nir)

sd3 <- focal(nir, matrix(1/9, 3, 3), fun=sd)
plot(sd3)

plot(sd3)
plot(sd3, col=magma(100))

# Exercise: calculate variability in a 7x7 pixels moving window
sd7 <- focal(nir, matrix(1/49, 7, 7), fun=sd)
plot(sd7, col=inferno(100))

# Exercise 2: plot via par(mfrow()) the 3x3 and the 7x7 standard deviation
par(mfrow=c(1,2)) #one beside the other 
plot(sd3)
plot(sd7)

# original image plus the 7x7 sd
im.plotRGB(sent, r=2, g=1, b=3)
plot(sd7)
