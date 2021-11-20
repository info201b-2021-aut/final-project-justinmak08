library(dplyr)

wa_electric_vehicle_population <- read.csv('Electric_Vehicle_Population_Data.csv') # Load CSV file

summary_info <- list()
summary_info$num_observations <- nrow(wa_electric_vehicle_population) # Number of vehicles registered
summary_info$num_attributes <- ncol(wa_electric_vehicle_population) # Number of attributes per vehicle registered
summary_info$most_expensive_vehicle <- wa_electric_vehicle_population[wa_electric_vehicle_population$Base.MSRP == max(wa_electric_vehicle_population$Base.MSRP), 8] # Most expensive electrified vehicle registered in Washington State
summary_info$max_model_year <- max(wa_electric_vehicle_population$Model.Year) #Latest model year recorded in data set
summary_info$min_model_year <- min(wa_electric_vehicle_population$Model.Year) #Earliest model year recorded in data set
