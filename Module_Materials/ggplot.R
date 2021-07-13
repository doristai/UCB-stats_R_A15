# read.csv() function
demo_table <- read.csv(file='/Users/doristai/Documents/GitHub/UCB-stats_R_A15/Module_Materials/demo.csv',check.names=F,stringsAsFactors = F)

# fromJSON() function
demo_table2 <- fromJSON(txt='/Users/doristai/Documents/GitHub/UCB-stats_R_A15/Module_Materials/demo.json')

# Select the third row of the year column 
demo_tale[3, "Year"]

# Select the thrid row, third column 
demo_table[3, 3]

# Select the vector of vehicle classes from the table
demo_table$"Vehicle_Class"

# Use [] to select sepcific vector
demo_table$"Vehicle_Class"[2]

# nrow() function counts the number of rows in a dataframe
num_rows <- 1:nrow(demo_table)
sample_rows <- sample(num_rows, 3)

#Finally, retrieve the requested data within the demo_table:
demo_table[sample_rows, ]

# Combine all three steps in one R code
demo_table[sample(1:nrow(demo_table), 3),]

#add columns to original data frame
demo_table <- demo_table %>% mutate(Mileage_per_Year=Total_Miles/(2020-Year),IsActive=TRUE) 

# summarize() function == group_by() in Pandas
summarize_demo <- demo_table2 %>% group_by(condition) %>% summarize(Mean_Mileage=mean(odometer), .groups = 'keep') #create summary table

demo_table3 <- read.csv('/Users/doristai/Documents/GitHub/UCB-stats_R_A15/Module_Materials/demo2.csv',check.names = F,stringsAsFactors = F)

#import dataset into ggplot2
plt <- ggplot(mpg,aes(x=class)) 

#plot a bar plot
plt + geom_bar()

#create summary table
mpg_summary <- mpg %>% group_by(manufacturer) %>% summarize(Vehicle_Count=n(), .groups = 'keep')

#import dataset into ggplot2
plt <- ggplot(mpg_summary,aes(x=manufacturer,y=Vehicle_Count))

#plot a bar plot
plt + geom_col()

# both geom_bar() and geom_col() create bar plots

#plot bar plot with labels
plt + geom_col() + xlab("Manufacturing Company") + ylab("Number of Vehicles in Dataset") + #plot a boxplot with labels
  theme(axis.text.x=element_text(angle=45,hjust=1)) #rotate the x-axis label 45 degrees

mpg_summary <- subset(mpg,manufacturer=="toyota") %>% group_by(cyl) %>% summarize(Mean_Hwy=mean(hwy), .groups = 'keep') #create summary table
plt <- ggplot(mpg_summary,aes(x=cyl,y=Mean_Hwy)) #import dataset into ggplot2


plt + geom_line()
#add line plot with labels
plt + geom_line() + scale_x_discrete(limits=c(4,6,8)) + scale_y_continuous(breaks = c(15:30)) 

#import dataset into ggplot2
plt <- ggplot(mpg,aes(x=displ,y=cty))

#add scatter plot with labels
plt + geom_point() + xlab("Engine Size (L)") + ylab("City Fuel-Efficiency (MPG)")

#import dataset into ggplot2
plt <- ggplot(mpg,aes(x=displ,y=cty,color=class)) 

#add scatter plot with labels
plt + geom_point() + labs(x="Engine Size (L)", y="City Fuel-Efficiency (MPG)", color="Vehicle Class")

#import dataset into ggplot2
plt <- ggplot(mpg,aes(x=displ,y=cty,color=class,shape=drv)) 

#add scatter plot with multiple aesthetics
plt + geom_point() + labs(x="Engine Size (L)", y="City Fuel-Efficiency (MPG)", color="Vehicle Class",shape="Type of Drive")

#import dataset into ggplot2
plt <- ggplot(mpg,aes(y=hwy))

#add boxplot
plt + geom_boxplot()

#import dataset into ggplot2
plt <- ggplot(mpg,aes(x=manufacturer,y=hwy))

#add boxplot and rotate x-axis labels 45 degrees
plt + geom_boxplot() + theme(axis.text.x=element_text(angle=45,hjust=1))

# create summary table 
mpg_summary <- mpg %>% group_by(class,year) %>% summarize(Mean_Hwy=mean(hwy), .groups = 'keep')

plt <- ggplot(mpg_summary, aes(x=class,y=factor(year),fill=Mean_Hwy))

plt + geom_tile() + labs(x="Vehicle Class",y="Vehicle Year",fill="Mean Highway (MPG)") #create heatmap with labels

mpg_summary <- mpg %>% group_by(model,year) %>% summarize(Mean_Hwy=mean(hwy), .groups = 'keep') #create summary table
plt <- ggplot(mpg_summary, aes(x=model,y=factor(year),fill=Mean_Hwy)) #import dataset into ggplot2
plt + geom_tile() + labs(x="Model",y="Vehicle Year",fill="Mean Highway (MPG)") + theme(axis.text.x = element_text(angle=90,hjust=1,vjust=.5)) #rotate x-axis labels 90 degrees

plt <- ggplot(mpg,aes(x=manufacturer,y=hwy)) #import dataset into ggplot2
plt + geom_boxplot() + theme(axis.text.x=element_text(angle=45,hjust=1)) + geom_point() #overlay scatter plot on top

mpg_summary <- mpg %>% group_by(class) %>% summarize(Mean_Engine=mean(displ), .groups = 'keep') #create summary table
plt <- ggplot(mpg_summary,aes(x=class,y=Mean_Engine)) #import dataset into ggplot2
plt + geom_point(size=4) + labs(x="Vehicle Class",y="Mean Engine Size") #add scatter plot

mpg_summary <- mpg %>% group_by(class) %>% summarize(Mean_Engine=mean(displ),SD_Engine=sd(displ), .groups = 'keep')
plt <- ggplot(mpg_summary,aes(x=class,y=Mean_Engine)) #import dataset into ggplot2
plt + geom_point(size=4) + labs(x="Vehicle Class",y="Mean Engine Size") + #add scatter plot with labels
geom_errorbar(aes(ymin=Mean_Engine-SD_Engine,ymax=Mean_Engine+SD_Engine)) #overlay with error bars

mpg_long <- mpg %>% gather(key="MPG_Type",value="Rating",c(cty,hwy)) #convert to long format
head(mpg_long)

plt <- ggplot(mpg_long,aes(x=manufacturer,y=Rating,color=MPG_Type)) #import dataset into ggplot2
plt + geom_boxplot() + theme(axis.text.x=element_text(angle=45,hjust=1)) #add boxplot with labels rotated 45 degrees

plt <- ggplot(mpg_long,aes(x=manufacturer,y=Rating,color=MPG_Type)) #import dataset into ggplot2
plt + geom_boxplot() + facet_wrap(vars(MPG_Type)) + #create multiple boxplots, one for each MPG type
theme(axis.text.x=element_text(angle=45,hjust=1),legend.position = "none") + xlab("Manufacturer") #rotate x-axis labels
