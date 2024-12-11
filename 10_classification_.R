#11/12
# Classifying satellite images and estimate the amount of change
#Unspervised calssification

library(terra)
library(imageRy)
library(ggplot2)
library(patchwork)

im.list()

# https://www.esa.int/ESA_Multimedia/Images/2020/07/Solar_Orbiter_s_first_views_of_the_Sun6
# additional images: https://webbtelescope.org/contents/media/videos/1102-Video?Tag=Nebulas&page=1

sun <- im.import("Solar_Orbiter_s_first_views_of_the_Sun_pillars.jpg") #energy of the sun 

sunc <- im.classify(sun, num_clusters=3) #classifichiamola con 3 classi
sunc

# classify satellite data
#---- Matogrosso exemple

im.list()

m1992 <- im.import("matogrosso_l5_1992219_lrg.jpg")
m2006 <- im.import("matogrosso_ast_2006209_lrg.jpg")

m1992c <- im.classify(m1992, num_clusters=2)                    
plot(m1992c)
# classes: 
#human= 2 related areas and water ; 
#forest= 1 

m2006c <- im.classify(m2006, num_clusters=2)
plot(m2006c)
# classes: 
#forest= 2; 
#human= 1 related areas and water

par(mfrow=c(1,2))
plot(m1992c[[1]])
plot(m2006c[[1]])

#Ora calcoliamo la percentuale )frequencies dei pixel per ogni classe
f1992 <- freq(m1992c)
f1992
tot1992 <- ncell(m1992c)
tot1992

# Percentage
p1992 <- f1992 * 100 / tot1992 
p1992
# Class 1 forest: 83%; Class 2 human: 17%

# Percentage of 2006
f2006 <- freq(m2006c)
f2006
tot2006 <- ncell(m2006c)
tot2006

# Percentage
p2006 <- f2006 * 100 / tot2006 
p2006
# Class 2 forest: 45%; Class 1 human: 55%

# Building a dataframe
class <- c("forest", "human")
y1992 <- c(83, 17)
y2006 <- c(45, 55) 

tabout <- data.frame(class, y1992, y2006)
tabout

dev.off()

# Final graph
p1 <- ggplot(tabout, aes(x=class, y=y1992, color=class)) + geom_bar(stat="identity", fill="white")

p2 <- ggplot(tabout, aes(x=class, y=y2006, color=class)) + geom_bar(stat="identity", fill="white")
p1+p2

#We Use patchwork per comporre più grafici in un unico grafico 

# final output, rescaled
p1 <- ggplot(tabout, aes(x=class, y=y1992, color=class)) + geom_bar(stat="identity", fill="white") + ylim(c(0,100))
p2 <- ggplot(tabout, aes(x=class, y=y2006, color=class)) + geom_bar(stat="identity", fill="white") + ylim(c(0,100))
p1 + p2
p1 / p2
