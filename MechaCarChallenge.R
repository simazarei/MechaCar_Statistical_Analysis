# Deliverable 1: Linear Regression to Predict MPG
# --------------------------------------------------------------------

library(dplyr)

# Import & Read CSV file 

mechacar_df <- read.csv(file='MechaCar_mpg.csv',check.names=F,stringsAsFactors = F)

#generate multiple linear regression model

lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=mechacar_df) 

#generate summary statistics
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle  + ground_clearance + AWD,data=mechacar_df)) 



# Deliverable 2: Create Visualizations for the Trip Analysis
#----------------------------------------------------------------------

# Import & Read CSV file 

Suspension_df <- read.csv(file='Suspension_coil.csv',check.names=F,stringsAsFactors = F)

# Create a total summary dataframe

total_summary <- summarize(Suspension_df["PSI"], Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI), .groups = 'drop') 

# Create Lot summary 
lot_summary <- Suspension_df %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI))


# Deliverable 3: T-Tests on Suspension Coils
#----------------------------------------------------------------------

# Perform t-test across all manufacturing lots
t.test(Suspension_df$PSI, mu = 1500)


# Perform t-test for lot 1

t.test(subset(Suspension_df, Manufacturing_Lot=="Lot1")$PSI,  mu = 1500)


# Perform t-test for lot 2

t.test(subset(Suspension_df, Manufacturing_Lot=="Lot2")$PSI,  mu = 1500)


# Perform t-test for lot 3

t.test(subset(Suspension_df, Manufacturing_Lot=="Lot3")$PSI,  mu = 1500)

