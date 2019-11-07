## BTEC330 Fosso Project2

## Install necessary packages

install.packages("ggplot2")
library(ggplot2)

## Read data
IBS1 <- read.csv("data/RobinsonEtAl_Sup1.csv", header = TRUE)
head(IBS1)
write.csv(IBS1, "data_output/output.csv")
##  Single Regressions for BMI vs. ACTH
##  Data was obtained from Robinson, et al. 2019 (doi: https://doi.org/10.1101/608208)
##  https://statquest.org/2017/10/30/statquest-multiple-regression-in-r/
##  http://www.sthda.com/english/articles/40-regression-analysis/167-simple-linear-regression-in-r/
##  http://r-statistics.co/Linear-Regression.html


## Single Regression Test
single.regression <- lm(BMI~ACTH, data=ISB1)
print(single.regression)
summary(single.regression)
## Scatterplots
## https://www.statmethods.net/graphs/scatterplot.html

ggplot(IBS1, aes(x=BMI, y=ACTH)) +
geom_point() +    
geom_smooth(method=lm) 

#BMI, ACTH
single.regression <- lm(BMI ~ ACTH, data=IBS1)
print(single.regression)
df<-na.omit(data)
ggplot(IBS1, aes(x=BMI, y=ACTH)) +
  geom_point() +    
  geom_smooth(method=lm)
sink("data_output/ACTH_regression.txt")
print(single.regression)
sink()

png("fig_output/ACTH_scatterplot.png")
ACTH_scatterplot <- ggplot(IBS1, aes(x = BMI, y = ACTH)) +
  geom_point() +    
  geom_smooth(method = lm) 

print(ACTH_scatterplot)
dev.off()

boxplot(ACTH ~ IBS.subtype, data = IBS1, main="ACTH by IBS1 subtype", 
        xlab = "IBS1.subtype", ylab = "ACTH"
)

png("fig_output/ACTH_boxplot.png")
Basophils_boxplot <- boxplot(Basophils ~ IBS.subtype, data = IBS1, main="ACTH by IBS1 subtype", 
                             xlab = "IBS1.subtype", ylab = "ACTH"
)
print(ACTH_boxplot)
dev.off()
