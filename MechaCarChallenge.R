# loading dplyr library
library(dplyr)
library(tidyverse)

#Deliverable 1:  Linear Regression to Predict MPG

#Import dataset and store as dataframe
MechaCarDf <- data.frame(read.csv("MechaCar_mpg.csv"), check.names=F,stringsAsFactors = F)

#perform linear regression
colnames(MechaCarDf)

#Regression model
LmModel <- lm(mpg~vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=MechaCarDf)

# Summary of regression model
summary(LmModel)

#Deliverable 2: Create Visualizations for the Trip Analysis
#Import dataset and store as dataframe
SuspensionCoil <- data.frame(read.csv("Suspension_Coil.csv"), check.names=F,stringsAsFactors = F)

#create dataset total summary
total_summary <- SuspensionCoil %>% summarize(Mean =mean(PSI),
                                             Median =median(PSI),
                                             Variance=var(PSI),
                                             SD=sd(PSI),
                                             .groups = 'keep')  

#create dataset lot summary
lot_summary <- SuspensionCoil %>% group_by (Manufacturing_Lot) %>% summarize(Mean =mean(PSI),
                                                                            Median =median(PSI),
                                                                            Variance=var(PSI),
                                                                            SD=sd(PSI),
                                                                            .groups = 'keep')

#Deliverable 3: T-Tests on Suspension Coils 
t.test(SuspensionCoil$PSI,mu=1500)

#subset Lot1
Lot1 <- subset(SuspensionCoil, Manufacturing_Lot == "Lot1")

#t-test lot1
t.test(Lot1$PSI,mu=1500)

#subset Lot2
Lot2 <- subset(SuspensionCoil, Manufacturing_Lot == "Lot2")

#t-test lot2
t.test(Lot2$PSI,mu=1500)

#subset Lot3
Lot3 <- subset(SuspensionCoil, Manufacturing_Lot == "Lot3")

#t-test lot3
t.test(Lot3$PSI,mu=1500)





