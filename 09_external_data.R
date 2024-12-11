#11/12 

# Code to import external data

library(terra)

# Set the working directory in Windows
setwd("C:/lab/") 

# Data import and visualize them
scotland <- rast("scotland_outerhebrides_oli_20240918_lrg.jpg")  
plot(scotland)

plotRGB(scotland, r=1, g=2, b=3) # im-plotRGB


# Exercise: download a set of the Earth Observatory and upload it in R
# Any ecological process is ok
algae <- rast("lakevillarrica_oli_2023123_lrg.jpg")
plot(algae)

par(mfrow=c(2,1))
plotRGB(naja, r=1, g=2, b=3) # im-plotRGB
plotRGB(najaaug, r=1, g=2, b=3)

# multitemporal change detection
najadif = naja[[1]] - najaaug[[1]] 
cl <- colorRampPalette(c("brown", "grey", "orange")) (100)
plot(najadif, col=cl)

# Download your own preferred image:
typhoon <- rast("mawar_vir2_2023144_lrg.jpg")

plotRGB(typhoon, r=1, g=2, b=3)
plotRGB(typhoon, r=2, g=1, b=3)
plotRGB(typhoon, r=3, g=2, b=1)


# The Mato Grosso image can be downloaded directly from EO-NASA:

mato <- rast("matogrosso_l5_1992219_lrg.jpg")
plotRGB(mato, r=1, g=2, b=3) 
plotRGB(mato, r=2, g=1, b=3) 
