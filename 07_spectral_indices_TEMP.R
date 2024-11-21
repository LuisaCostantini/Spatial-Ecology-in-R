#Vegetation indices
#21/11

library(imageRy)
library(terra)


#Listing the data 
im.list()

#Importing data 
m2006 <- im.import("matogrosso_ast_2006209_lrg.jpg")
# bands : 1 = NIR, 2 = RED , 3= GREEN 
#ast (ASTER DATA) it's a satellite 

im.plotRGB(m2006, r=1, g=2, b=3)
im.plotRGB(m2006, 3, 2, 1)
im.plotRGB(m2006, r=3, g=1, b=2) #vege became green 
im.plotRGB(m2006, r=2, g=3, b=1)
dev.off()

#Import the another image from 1992 
m1992 <- im.import("matogrosso_l5_1992219_lrg.jpg")
#Landsat is the most commercial satellite 

im.plotRGB(m1992, r=1, g=2, b=3)

# build a multiframe with 1992 and 2006 images
par(mfrow=c(1,2))
im.plotRGB(m1992, r=1, g=2, b=3)
im.plotRGB(m2006, r=1, g=2, b=3)

# Exercise: make a multiframe with 6 images in pairs with nir on the same component 
par(mfrow=c(3,2))
im.plotRGB(m1992, r=1, g=2, b=3)
im.plotRGB(m2006, r=1, g=2, b=3)

im.plotRGB(m1992, r=3, g=1, b=2)
im.plotRGB(m2006, r=3, g=1, b=2)

im.plotRGB(m1992, r=2, g=3, b=1)
im.plotRGB(m2006, r=2, g=3, b=1)

dev.off()

#Vegetation indices 
#DVI (Difference vegetation indicies) = NIR - RED 
#DVI in 1992 
dvi1992 = m1992[[1]] - m1992[[2]]
plot(dvi1992)

cl <- colorRampPalette(c("dark blue", "yellow", "red", "black"))(100)
plot(dvi1992, col=cl)

#Multiframe with DVI 
par(mfrow=c(1,2))
plot(dvi1992, col=cl)
plot(dvi2006, col=cl)
#see the difference with 2 images 

#NDVI (Normalidez different vegetation idices) 
#1992
ndvi1992 = (m1992[[1]] - m1992[[2]]) / (m1992[[1]] + m1992[[2]])
ndvi1992

ndvi1992 = dvi1992 / (m1992[[1]] + m1992[[2]])
plot(ndvi1992, col=cl)

#2006
ndvi2006 = (m2006[[1]] - m2006[[2]]) / (m2006[[1]] + m2006[[2]])
ndvi2006

ndvi2006 = dvi2006 / (m2006[[1]] + m2006[[2]])
plot(ndvi2006, col=cl)

#u can use Viridis per far vedere alle persone daltoniche o magma 

