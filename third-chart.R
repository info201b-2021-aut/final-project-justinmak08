# Load ggplot2
library("ggplot2")
library(dplyr)

# wa_electric_vehicle_population <- read.csv('https://data.wa.gov/api/views/f6w7-q2d2/rows.csv?accessType=DOWNLOAD') # Load CSV file
wa_electric_vehicle_population <- read.csv('Electric_Vehicle_Population_Data.csv') # Load CSV file
full_electric_vehicle_population <- # Remove hybrid-electric and 0 MSRP cars
  filter(wa_electric_vehicle_population, wa_electric_vehicle_population$Electric.Vehicle.Type == 'Battery Electric Vehicle (BEV)' & wa_electric_vehicle_population$Base.MSRP > 0)

ggplot(full_electric_vehicle_population, aes(x=Base.MSRP, y=Electric.Range)) + geom_point() # Create scatterplot