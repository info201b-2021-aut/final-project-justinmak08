library(dplyr)

# Electric vehicles in Washington State: table for third chart
wa_electric_vehicle_population <- read.csv('Electric_Vehicle_Population_Data.csv') # Load CSV file
full_electric_vehicle_population <- # Remove hybrid-electric and 0 MSRP cars
  filter(wa_electric_vehicle_population, wa_electric_vehicle_population$Electric.Vehicle.Type == 'Battery Electric Vehicle (BEV)' & wa_electric_vehicle_population$Base.MSRP > 0)
full_electric_vehicle_population <- select(full_electric_vehicle_population, c('Base.MSRP', 'Electric.Range'))
full_electric_vehicle_population <- full_electric_vehicle_population  %>% head(20)
full_electric_vehicle_population <- distinct(full_electric_vehicle_population)
full_electric_vehicle_population <- rename(full_electric_vehicle_population, 'Base MSRP' = Base.MSRP)
full_electric_vehicle_population <- rename(full_electric_vehicle_population, 'Electric Range' = Electric.Range)
