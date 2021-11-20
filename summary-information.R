library(dplyr)

wa_electric_vehicle_population <- read.csv('Electric_Vehicle_Population_Data.csv') # Load CSV file


num_vehicle <- nrow(wa_electric_vehicle_population) # Number of vehicles registered
num_attributes_vehicle <- ncol(wa_electric_vehicle_population) # Number of attributes per vehicle registered
most_expensive <- wa_electric_vehicle_population[wa_electric_vehicle_population$Base.MSRP == max(wa_electric_vehicle_population$Base.MSRP), 8] # Most expensive electrified vehicle registered in Washington State
latest_model <- max(wa_electric_vehicle_population$Model.Year) # Latest model year recorded in data set
earliest_model <- min(wa_electric_vehicle_population$Model.Year) # Earliest model year recorded in data set

summary_info_electric_vehicles <- list(
  "Number of vehicles registered" = num_vehicle,
  "Number of attributes per vehicle registered" = num_attributes_vehicle,
  "Most expensive electrified vehicle registered in Washington State" =
    most_expensive,
  "Latest model year recorded in data set" =
    latest_model,
  "Earliest model year recorded in data set" =
    earliest_model
)

greenhouse_gas_emissions <- read.csv('US_Greenhouse_Gas_Emissions_Transportation.csv') # Load CSV file
earliest_year <-  min(greenhouse_gas_emissions$Year)
latest_year <- max(greenhouse_gas_emissions$Year)
num_observations <- nrow(greenhouse_gas_emissions) # Number of observations
num_attributes <- ncol(greenhouse_gas_emissions) # Number of attributes per observation

summary_info_greenhouse_gas_emissions <- list(
  "Earliest year" = earliest_year,
  "Latest year" = latest_year,
  "Number of observations" = num_observations,
  "Number of attributes" = num_attributes
)
