# MechaCar_Statistical_Analysis_R

## Overview

AutosRUs’ newest prototype, the MechaCar, is suffering from production troubles that are blocking the manufacturing team’s progress. AutosRUs’ upper management has called on Jeremy and the data analytics team to review the production data for insights that may help the manufacturing team.

### Aims
- Perform multiple linear regression analysis to identify which variables in the dataset predict the mpg of MechCar prototypes 

- Collect summary statistics on the pounds per square inch (PSI) of the suspension coils from the manufacturing lots

- Run t-tests to determine if the manufacturing lots are statistically different from the mean population

- Design a statistical study to compare vehicle performance of the MechaCar vehicles against vehicles from other manufacturers


## Results 

### Multiple Linear Regression for Predicting MPG 

Multiple_linear_regression_summary
<img width="456" alt="Multiple_linear_regression_summary" src="https://user-images.githubusercontent.com/70616488/125386942-007dcd00-e352-11eb-9c9f-88115093678b.png">

- **Vehicle Length** and **Ground Clearance** are the most significant variables and show non-random effect on the MPG of the MechaCar. 
    - p-values: 
        - Vehicle length: 2.6 x 10<sup>-12</sup>
        - Grounf Clearance: 5.21 x 10<sup>-8<sup>

    - The intersecpt is also statistically significant which have a strong impact on the MPG 

- Due to the summarised p-value (5.35 x 10<sup>-11<sup>), 
    the slope of the linear model connot be considered as zero. The p-value is lower than the extreme level of sigficance. Hence, the null hypothesis is rejected. There is a non-random relationship between our variables and miles per gallon.

- The r-squared value is 0.7149 indicates that the model is 71% accurate. (It can probably do better). This shows that the model does predict the mpg of the MechaCar prototype and its related effectiveness.

### Summary Statistics on Suspension Coils 
total_summary
    <img width="336" alt="total_summary" src="https://user-images.githubusercontent.com/70616488/125387001-1c816e80-e352-11eb-93d0-e7ab63bc5929.png">

lots_summary
    <img width="492" alt="lots_summary" src="https://user-images.githubusercontent.com/70616488/125387032-24d9a980-e352-11eb-8d18-b327b4ad6d62.png">

- The overall variance is under 100 psi and achieves specifications. But there is a problem with one of the individual lots. 

- The variance for Lot 3 is over the acceptable thresgold at 170.28.


### T-Test on Suspension Coils 


- A review of T-test result for the suspension coils for all manufacturing lots indicates that they are not statistically different from the population mean. 

- Also, the p-value is higher than the significant level which we fails to reject the null hypothesis. 


summary_for_each_lot
    <img width="564" alt="summary_for_each_lot" src="https://user-images.githubusercontent.com/70616488/125387080-328f2f00-e352-11eb-8e27-c5585a2a8aa6.png">

#### Lot 1 
- p-value = 1 --> fails to reject the null hypothesis 


#### Lot 2


- p-value > 0.05 --> fails to reject the null hypothesis 


#### Lot 3 


- p-value < 0.05 --> reject the null hypothesis 


## Study Design: MechaCar vs. Competition 

Many factors should be taken into the account during evaluation of the car for purchase. Ridesharing is becoming more ubiquitous as it is cheap and easy to get around in other's vehicles, in the real world. Hence, customers not only consider the conveyance when purchasing a car. Economical means to regularly transport the customer and their items on regular basis will also be a factor when the buyers are looking for a car. 

#### Metric to Test

- Narrow doen the test to focus on MechaCar's carrying and space capacity in 3-D space (e.g. cm<sup>3<sup>, in comparison to other competitors)

#### Null and Alternative Hypothesis 

- H<sub>0<sub>: There is no difference between the carrying capacities of MechaCar's and its competitors'.

- H<sub>a<sub>: There is a significant difference between the carrying capacities of MechCar's and its competitors'.

#### Statistical Test Method

- **Two-sample t-test**

#### Data Required

- Sizes in cm<sup>3<sup> of the carrying compartments of all vehicles 
