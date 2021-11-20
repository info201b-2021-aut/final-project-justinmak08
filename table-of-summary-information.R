library(dplyr)
library(tidyverse)

# Electric vehicles in Washington State: table for third chart
wa_electric_vehicle_population <- read.csv('Electric_Vehicle_Population_Data.csv') # Load CSV file
full_electric_vehicle_population <- # Remove hybrid-electric and 0 MSRP cars
  filter(wa_electric_vehicle_population, wa_electric_vehicle_population$Electric.Vehicle.Type == 'Battery Electric Vehicle (BEV)' & wa_electric_vehicle_population$Base.MSRP > 0)
full_electric_vehicle_population <- select(full_electric_vehicle_population, c('Base.MSRP', 'Electric.Range'))
full_electric_vehicle_population <- full_electric_vehicle_population  %>% head(20)
full_electric_vehicle_population <- distinct(full_electric_vehicle_population)
full_electric_vehicle_population <- rename(full_electric_vehicle_population, 'Base MSRP' = Base.MSRP)
full_electric_vehicle_population <- rename(full_electric_vehicle_population, 'Electric Range' = Electric.Range)

gas_emission_data <- read.csv("US_Greenhouse_Gas_Emissions_Transportation.csv")

aggregated <- gas_emission_data %>% mutate(
  co2 = sum(Fossil.fuel.combustion..carbon.dioxide),
  fluorinated_gas = sum(Use.of.fluorinated.gases),
  other_gas = sum(Fossil.fuel.combustion..other.greenhouse.gases),
  other_transport_categories = sum(Other.transportation.categories)) %>%
  select(co2, fluorinated_gas, other_gas, other_transport_categories)

summary_info <- list(
  "Total Carbon Dioxide" = aggregated[1 ,1],
  "Total flourinated gas" = aggregated[1 ,2],
  "Toatl other greenhouse gas" =
    aggregated[1 ,3],
  "Total other transport categories" =
    aggregated[1 ,4]
)
