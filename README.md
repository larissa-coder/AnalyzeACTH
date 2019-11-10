## AnalyzeBMI
![doi](../master/Images/zenodo.3373938.svg?sanitize=true)
### Single and multiple regressions, and scatterplots for clinical bloodwork and gene expression data.
([AnalyzeBloodwork.R](../master/AnalyzeBloodwork.R)) will allow you to load a comma-delimited .csv with various datapoints, perform single and multiple regressions of Body Mass Index (BMI) vs. variables from the Complete Blood Count with Differential (CBC-D) results, and produce 2-D and 3-D scatterplots for the results. 

Data (RobinsonEtAl_Sup1.csv) was downloaded from: 

Robinson, JM. et al. 2019. Complete blood count with differential: An effective diagnostic for IBS subtype in the context of BMI? BioRxiv. doi: https://doi.org/10.1101/608208.

##
### Results of single regression, BMI x ACTH scatterplot
```
> ggplot(IBS1, aes(x=BMI, y=ACTH)) + geom_point() + geom_smooth(method=lm)
> png("fig_output/ACTH_single.regression scatterplot.png")
> ACTH_single.regression <- ggplot(IBS1, aes(x = BMI, y = ACTH)) + geom_point() + geom_smooth(method = lm) 
> print(ACTH_single.regression)

Call:
lm(formula = BMI ~ ACTH, data = IBS1)

Coefficients:
(Intercept)         ACTH  
    25.5406       0.0661  

```
![](fig_output/ACTH_scatterplot.png)

##
## Results of single regression, BMI x ACTH boxplot
  
  ```
> ggplot(IBS1, aes(x=BMI, y=ACTH)) + geom_point() + geom_smooth(method=lm)
> png("fig_output/ACTH_single.regression boxplot.png")
> ACTH_single.regression <- ggplot(IBS1, aes(x = BMI, y = ACTH)) + geom_point() + geom_smooth(method = lm) 
> print(ACTH_single.regression)

Call:
lm(formula = BMI ~ ACTH, data = IBS1)

Coefficients:
(Intercept)         ACTH  
    25.5406       0.0661 
    
```    
![] (fig_output/ACTH_boxplot.png)


