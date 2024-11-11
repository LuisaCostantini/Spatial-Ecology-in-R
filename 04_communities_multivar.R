#06/11 

# Code for multivariate analysis of species x plot data in communities

#install.packages("vegan")
library(vegan)

data(dune)

# View Dataset 
dune
head(dune)
View(dune)

# Analysis
multivar <- decorana(dune)
multivar

# Axis length
dca1 = 3.7004
dca2 = 3.1166
dca3 = 1.30055
dca4 = 1.47888

total = dca1 + dca2 + dca3 + dca4
total #to see the total

# Proportions
prop1 = dca1/total
prop2 = dca2/total
prop3 = dca3/total
prop4 = dca4/total

prop1
prop2
prop3
prop4

# Percentages
perc1 = prop1*100
perc2 = prop2*100
perc3 = prop3*100
perc4 = prop4*100

perc1
perc2
perc3
perc4

# Whole amount of variability (%)
perc1 + perc2
# The first two axes explain 715 of variability

plot(multivar)
