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

greenhouse_gas_emissions <- read.csv('US_Greenhouse_Gas_Emissions_Transportation.csv') # Load CSV file
greenhouse_gas_emissions <- select(greenhouse_gas_emissions, c(Year, Total)) # Select only year, total emissions
greenhouse_gas_emissions <- greenhouse_gas_emissions  %>% tail(5) # Select most recent 5 years