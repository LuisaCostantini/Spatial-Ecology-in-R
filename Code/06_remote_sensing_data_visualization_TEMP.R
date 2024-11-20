#20/11 
# 06 Temp 
# Code for remote sensing data handling and analysis 
# # RS data

library(devtools) # packages in R are also called libraries

# install the imageRy package from GitHub
#install_github("ducciorocchini/imageRy")  # from devtools

library(imageRy)
library(terra)
# in case you have not terra
# install.packages("terra")

# Listing data inside imageRy 
im.list() #list of the data inside imagery 

#Bands sentinels 
#import the blue band from Sentinel-2 (band 2)

#Importing the data (riflettanza di diversi oggetti o assorbenza il sensore capta gli ggetti che riflettono il blue linght )
b2 <- im.import("sentinel.dolomites.b2.tif") # for sentinell data 

cl <- colorRampPalette(c("black", "grey", "light grey")) (100) 
plot(b2, col=cl) 

dev.off()

# Exercise: import the green band from Sentinel-2 (band 3) and plot it with the previous palette
b3 <- im.import("sentinel.dolomites.b3.tif") 
plot(b3, col=cl) 

# import the red band from Sentinel-2 (band 4) 
#non usiamo le bande 5,6 e 7 per la risoluzione 
b4 <- im.import("sentinel.dolomites.b4.tif") 
plot(b4, col=cl)

# import the NIR band from Sentinel-2 (band 8)
#3 regioni :near infrared (NIR) is visible parte, thermal infrared and middle part 
# different colors of vegetagion 
b8 <- im.import("sentinel.dolomites.b8.tif") 
plot(b8, col=cl)

# Multiframe 
par(mfrow=c(2,2))
plot(b2, col=cl) 
plot(b3, col=cl)
plot(b4, col=cl)
plot(b8, col=cl) #ci da info in più perchè ...

# stack images
stacksent <- c(b2, b3, b4, b8)
dev.off() # it closes devices
plot(stacksent, col=cl)

plot(stacksent[[4]], col=cl)
