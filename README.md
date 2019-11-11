## AnalyzeACTH
Adrenocorticotropic Hormone is a polypeptide tropic hormone produced and secreted by the anterior pituitary gland. This hormone in turn causes the adrenal glands to make cortisol. The function of ACTH is to regulate the level of steroids hormone cortisol. ACTH test is used to determine diseases such as adrenal malfunction, lung tumor,and a pituitary tumor.  

https://www.healthline.com/health/acth#procedure
Calhoun, S. (2017). ACTH Test. Healthline, 1.

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
![](fig_output/ACTH_boxplot.png)


