library(tidyverse)
library(lintr)
library(styler)
library(dplyr)

# Importing dataset from the file
gas_emission_data <- read.csv("/Users/anas/Desktop/Info_201/final-project-justinmak08/US_Greenhouse_Gas_Emissions_Transportation.csv")

co2_year <- gas_emission_data %>% select(Year, Fossil.fuel.combustion..carbon.dioxide)
names(co2_year)[2] <- "Carbon Dioxide (million metric tons of CO2)"
# %>%
#   summarise(rename(
#     "Carbon Dioxide" = Fossil.fuel.combustion..carbon.dioxide
#   ))

co2_over_year <- ggplot(co2_year, aes(x=Year, y=`Carbon Dioxide (million metric tons of CO2)`)) +
  scale_x_continuous(breaks = seq(1990, 2020, by = 5)) + ggtitle("Carbon Dioxide released by Year") +
  theme(plot.title = element_text(hjust = 0.5)) + geom_line() 
# + geom_point(aes(x=Year, y=`Carbon Dioxide (million metric tons of CO2)`))

