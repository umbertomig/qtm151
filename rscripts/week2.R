## Lab 2 - QTM 151

# Load tidyverse
library(tidyverse)

# Load the datasets
PErisk <- read.csv('https://raw.githubusercontent.com/umbertomig/qtm151/main/datasets/PErisk.csv')

tips <- read.csv('https://raw.githubusercontent.com/umbertomig/qtm151/main/datasets/tips.csv')

# Histogram for tips
v1 <- 
  qplot(tip, geom = 'histogram', data = tips,
        main = 'My Histogram', bins = 10,
        xlab = 'Tips', color = I('blue'),
        fill = I('red'), alpha = 0.5)
v1

# Density-plot of totbill
qplot(totbill, geom = "density", data = tips,
      fill = I('gray70'))

# Box-plot
qplot(totbill, geom = "boxplot", data = tips)

qplot(totbill, geom = "boxplot", data = tips) +
  coord_flip()

qplot(y = totbill, geom = "boxplot", data = tips)

# Barplot for smoker
qplot(smoker, geom = 'bar', data = tips)

# Scatter-plot
qplot(totbill, tip, geom = 'point', data = tips)

# Scatter-plot
qplot(totbill, tip, geom = "point", data = tips) +
  geom_rug() + geom_smooth()

# Scatter plot segmented
qplot(totbill, tip, geom = 'point', color = smoker,
      data = tips)

# Faceted scatterplot
qplot(totbill, tip, 
      geom = "point", 
      facets = smoker ~ sex, 
      data = tips)

# Multiple boxplots
qplot(x = tip, y = smoker, data = tips, 
      geom = "boxplot")
