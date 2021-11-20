library("ggplot2")
library(dplyr)
Electric_Vehicle_Population_Data <- read.csv('Electric_Vehicle_Population_Data.csv')

#Create Histogram
qplot(Electric_Vehicle_Population_Data$`Model Year`, geom = "histogram", xlab = "Model Year", ylab = "Number of Electric Vehicles", main = "Number of Electric Vehicles by Model Year in Washington State")
