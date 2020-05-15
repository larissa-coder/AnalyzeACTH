## BTEC395 S2020 Larissa Fosso

## install.packages("ggplot2")
library(ggplot2)

## set working directory

## Read data
IBS1 <- read.table("../data/IBSGXData.txt", sep = "\t", header = TRUE)

## Single Regression Test of ACTH VS DROSHA gene
ACTH.regression <- lm(DROSHA ~ Plasma.Corticotrophin..ACTH...pg.mL. , data=IBS1)
summary(ACTH.regression)

## Scatterplot of ACTH VS DROSHA gene
ggplot(IBS1, aes(x=DROSHA, y=Plasma.Corticotrophin..ACTH...pg.mL.)) +
  geom_point() +    
  geom_smooth(method=lm)


## Recursive analysis for regression  - RNA Expression
## Access only the columns with RNA Expression
names(IBS1)[37:286]

##  Make a data frame of list type
storage <- list()

## linear regression for each expressed gene
for(i in names(IBS1)[37:286]){
  storage[[i]]  <- lm(get(i) ~ Plasma.Corticotrophin..ACTH...pg.mL., IBS1)
}

summary(storage$AGO2)
summary(storage$AGO2)$r.squared
summary(storage$AGO2)$coefficients[,4]

## output the results of the 250 genes Vs ACTH in data_output folder
sink('../data_output/ACTH_storage.txt', append = TRUE)
print(storage)
sink()


## Read in the table of fold changes
FCdata <- read.csv("../data/FC.csv", row.names = 1, header = FALSE)

## Read in the table of fold changes
FCdata <- read.csv("../data/FC.csv", row.names = 1, header = FALSE)

## Read in the table of expression data
IBS <- read.csv("../data/GXdata (1).csv", header = TRUE)

## Access only the columns with RNA Expression (subsetting)
names(IBS)[28:277]

## Make a list of anova(lm()) results for bloodwork parameter
storage <- list()
for(i in names(IBS)[28:277]){
  storage[[i]]  <- anova(lm(get(i) ~ ACTH, IBS))
}

## Extract the p-values into a new list
pVals <- list()
for(i in names(storage)){
  pVals[[i]] <- -(log10(storage[[i]]$'Pr(>F)'))
}

## Convert the pValues list into a data frame. 
DFpvalues <- data.frame(matrix(unlist(pVals), nrow=length(pVals), byrow=T))

## Combine the results dataframes and write column labels
VolcanoPlotData <- cbind(FCdata,DFpvalues)
names(VolcanoPlotData)[1] <- paste("log2(SlopeDiff)")
names(VolcanoPlotData)[2] <- paste("-log10(Pval)")


## Add a column to evaluate significance
VolcanoPlotData$Sig <- ifelse(VolcanoPlotData$`-log10(Pval)` > 1.3, "Sig", "Insig");

## Make a volcano-style scatterplot for these results

library(ggplot2)
# library(ggrepel)

png("../fig_output/ACTHplot.png")
ACTHplot <- ggplot(VolcanoPlotData, aes(x = `log2(SlopeDiff)`, y = `-log10(Pval)`, label=rownames(VolcanoPlotData), color=Sig)) +
  geom_point(aes(color = Sig)) +
  scale_color_manual(values = c("grey", "red")) +
  theme_bw(base_size = 12) + theme(legend.position = "bottom") +
  geom_text(aes(x = `log2(SlopeDiff)`,y = `-log10(Pval)`, fontface = 1, size=3,  label=row.names(VolcanoPlotData)))

print(ACTHplot + ggtitle("Gene Expression vs. ACTH Level"))
dev.off()




