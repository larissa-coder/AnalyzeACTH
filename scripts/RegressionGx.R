## BTEC395 S2020 Project2 
## By Larissa Fosso


setwd("./")

## Install necessary packages
install.packages("ggplot2")
library(ggplot2)

## Read data
#IBS <- read.csv("data/RobinsonEtAl_Sup1.csv", header = TRUE)
IBS <- read.csv("../data/GSE124549_20200330.csv", header = TRUE)


## Recursive analysis for regression  - RNA Expression
## https://stackoverflow.com/questions/42464767/how-to-run-lm-regression-for-every-column-in-r
## https://stackoverflow.com/questions/44170937/performing-lm-and-segmented-on-multiple-columns-in-r
## http://www.learnbymarketing.com/tutorials/explaining-the-lm-summary-in-r/
## https://tutorials.iq.harvard.edu/R/Rstatistics/Rstatistics.html

## Access only the columns with RNA Expression
names(IBS)[37:286]

##  Make a data frame of list type
storage <- list()

## linear regression for each expressed gene
for(i in names(IBS)[37:286]){
  storage[[i]]  <- lm(get(i) ~ Plasma.Corticotrophin..ACTH...pg.mL., IBS)
}

summary(storage$AGO2)
summary(storage$AGO2)$r.squared
summary(storage$AGO2)$coefficients[,4]

## output the results of the 250 genes in data_output folder
sink('../data_output/ACTH_storage.txt', append = TRUE)
print(storage)
sink()


