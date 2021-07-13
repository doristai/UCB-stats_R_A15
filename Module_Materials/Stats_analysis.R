'''
- Dichotomous data is collected from either one of two categories. 
- Categorical data represents data characteristics or qualitative descriptions.
- Ordinal data has a ranked order.
- Nominal data is data used as labels or names for other measures.
- Numerical data is obtained by taking a measurement from an instrument (such as a ruler, measuring scale, sensor, etc.) or by counting.
- Continuous data can be subdivided infinitely.
- Interval data is spaced out evenly on a scale.
'''

# Qualitative Test for Normality
  # Use geom_density() function
  # visualize distribution using density plot
ggplot(mtcars,aes(x=wt)) + geom_density() 

# Quantitative Test for Normality
  # shapiro.test()
shapiro.test(mtcars$wt)

'''
Hypothesis 
- Null Hypothesis: There is no statistical difference between the two observed sample means.
- Althernative Hypothesis: There is a statistical difference between the two observed sample means.
- H0 : PH = 0.5
- HA : PH =/= 0.5
- PH represents the probability of flipping heads

- One-tailed hypotheses use descriptions such as "x is greater than y" or "x is less than or equal to y."
  - If our hypotheses and statistical test are both two-tailed, use the statistical test p-value as is.
- Two-tailed hypotheses describe both sides of the distribution and use descriptions such as "equal to" or "not equal to."
  - If our hypotheses are one-tailed, but our statistical test is two-tailed, divide the statistical test p-value by 2.
  
Errors
  - Type I error (false positive error) — an error in which we reject the null hypothesis when it is actually true.
    - Can be limited by making your significance level smaller
  - Type II error (false negative error) — an error in which we fail to reject the null hypothesis when it is actually false.
    - Can be limited by increasing the power of the analysis.
'''

#import used car dataset
population_table <- read.csv('used_car_data.csv',check.names = F,stringsAsFactors = F)

#import dataset into ggplot2
plt <- ggplot(population_table,aes(x=log10(Miles_Driven))) 

#visualize distribution using density plot
plt + geom_density() 

'''
sample_n() only need two arguement:
- tbl: name of the table of input/ name of a dataframe
- size: number of rows to return
'''

# compare sample versus population means
t.test(log10(sample_table$Miles_Driven),mu=mean(log10(population_table$Miles_Driven))) 

'''
Analysis of Variance (ANOVA) Test

One-way ANOVA: Tedst the mean of a single dependent variable across a 
  single independent variable with multiple groups 
  
Two-way ANOVA: Does the same thing but for two different independent variables 

H0: The means of all groups are equal or u1 = u2 = ... = un
Ha: At least one of the means is different from all other groups 
?aov() # function 
'''

#filter columns from mtcars dataset
mtcars_filt <- mtcars[,c("hp","cyl")] 

#convert numeric column to factor
mtcars_filt$cyl <- factor(mtcars_filt$cyl) 

#compare means across multiple levels
aov(hp ~ cyl,data=mtcars_filt) 

# wrap up aov() function with summary
summary(aov(hp ~ cyl,data=mtcars_filt))

'''
Pearson Correlation Coefficient (r)
- r < 0.3: None or very weak
- 0.3 <= r < 0.5: Weak 
- 0.5 <= r < 0.7: Moderate 
- r >= 0.7: Strong 


cor() function 
- x is the first variable, which would be plotted on the x-axis.
- y is the second variable, which would be plotted on the y-axis.
'''
#import dataset into ggplot2
plt <- ggplot(mtcars,aes(x=hp,y=qsec)) 

#create scatter plot
plt + geom_point()

#calculate correlation coefficient
cor(mtcars$hp,mtcars$qsec)

#read in dataset
used_cars <- read.csv('used_car_data.csv',stringsAsFactors = F)

#import dataset into ggplot2
plt <- ggplot(used_cars,aes(x=Miles_Driven,y=Selling_Price))
#create a scatter plot
plt + geom_point()

#calculate correlation coefficient
cor(used_cars$Miles_Driven,used_cars$Selling_Price)

'''
Correlation Matrix: A lookup table where the variable names of a data frame are stored as rows and columns
  intersection of each variable is the corresponding Pearson correlation coefficient. 
'''

#convert data frame into numeric matrix
used_matrix <- as.matrix(used_cars[,c("Selling_Price","Present_Price","Miles_Driven")]) 
cor(used_matrix)

'''
Linear Regresion 
- Simple Linear Regression: Builds a linear regression model with one independent variable
- Multiple Linear Regression: Buils a linear regression model with two or more independent variables
    - y = m1x1 + m2x2 + … + mnxn + b, for all independent x variables and their m coefficients
    - 
- lm() function: used to fit linear model 


1. Input data is numerical and continous 
2. Input data should follow a linear pattern 
3. There is variability in the independent x variable. Means that there must be more than one 
  in the x-axis and they must be different values 
4. The residual error (the distance from each data point to the line) should be normally distributed
'''

# create linear model
lm(qsec ~ hp,mtcars) 
    # qsec: quarter-mile race time 
    # hp: horsepower

# Summarise linear model 
summary(lm(qsec~hp, mtcars))


# Single Linear Regression
# 1. Calculate the data points to use for our line plot using our lm(qsec ~ hp,mtcars) coefficients as follows:

# create linear model
model <- lm(qsec ~ hp,mtcars)
#determine y-axis values from linear model
yvals <- model$coefficients['hp']*mtcars$hp +
  model$coefficients['(Intercept)'] 

# 2. Plot the linear model over our scatter plot 

# import dataset into ggplot2
plt <- ggplot(mtcars,aes(x=hp,y=qsec))
#plot scatter and linear model
plt + geom_point() + geom_line(aes(y=yvals), color = "red")

# Multiple Linear Regression 

# generate multiple linear regression model
lm(qsec ~ mpg + disp + drat + wt + hp,data=mtcars)
# generate summary statistics
summary(lm(qsec ~ mpg + disp + drat + wt + hp,data=mtcars))

# Chi-square
chisq.test()

#generate contingency table
tbl <- table(mpg$class,mpg$year)
#compare categorical distributions
chisq.test(tbl)

'''
A/B Test

SM = Success Metric

- Numeric SM & Small Sample size --> z-score summary stats enough to compare the mean and variability of both groups 
- Numeric SM & Large Sample size --> two-sample t-test used to compare the distribution of both group
- Categorical SM --> chi-sq test to compare the distribution of categorical values between both groups 

'''



