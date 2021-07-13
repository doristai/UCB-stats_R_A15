library(dplyr)

# Linear Regression to Predict MPG 
mechacar_mpg_df <- read.csv(file = '/Users/doristai/Documents/GitHub/UCB-stats_R_A15/Data/MechaCar_mpg.csv',
                          check.names = F, 
                          stringsAsFactors = F)
head(mechacar_mpg_df)

# Multiple linear Regression
mlr <- lm(mpg~vehicle_length+vehicle_weight+spoiler_angle+ground_clearance+AWD, data = mechacar_mpg_df)

# Find the p-value and r-squared
summary(mlr)


#Suspension Coil Lot Analysis 

# Read csv to to dataframe 
suspension_coil_df <- read.csv(file = '/Users/doristai/Documents/GitHub/UCB-stats_R_A15/Data/Suspension_Coil.csv', 
                               check.names = F, 
                               stringsAsFactors = F)
head(suspension_coil_df)

# Create a summary dataframe 
total_summary <- suspension_coil_df %>% summarize(Mean = mean(PSI), 
                                                  Median = median(PSI), 
                                                  Variance = var(PSI), 
                                                  SD = sd(PSI))

# Create summaries for each lot 
lot_summary <- suspension_coil_df %>% group_by(Manufacturing_Lot) %>% summarize(Mean = mean(PSI), Median = median(PSI), Variance = var(PSI), SD = sd(PSI), .groups = 'keep') 


# T-test on Suspension coils 
t.test(suspension_coil_df$PSI, mu=1500)

t.test(subset(suspension_coil_df,Manufacturing_Lot=="Lot1")$PSI, mu = 1500)
t.test(subset(suspension_coil_df,Manufacturing_Lot=="Lot2")$PSI, mu = 1500)
t.test(subset(suspension_coil_df,Manufacturing_Lot=="Lot3")$PSI, mu = 1500)

