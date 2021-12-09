library(tidyverse)
library(shiny)
library(plotly)

# Read in dataset
# data_wa <- read.csv("")
wa_electric_vehicle_population <- read.csv("Electric_Vehicle_Population_Data.csv")

# Define server logic ----
server <- function(input, output) {

  # Histogram
  output$histogram_vehicle_amount <- renderPlot({
    manufacturers <- wa_electric_vehicle_population[!duplicated(wa_electric_vehicle_population$Make),]
    manufacturers <- select(manufacturers, Make)
    number_vehicles <- data.frame()
    # number_vehicles = number_vehicles[-1,]
    for (val in manufacturers$Make) {
      new_row <- c(val, strtoi(nrow(subset(wa_electric_vehicle_population, wa_electric_vehicle_population$Make == val))))
      number_vehicles <- rbind(number_vehicles, new_row)
      print(val)
    }
    min_number <- input$min_number
    number_vehicles <- rename(number_vehicles, "Make" = "X.AUDI.", "Number" = "X.1678.")
    data_histogram_number_vehicles <- filter(number_vehicles, number_vehicles$Number > min_number)
    histogram_vehicle_amount <- ggplot(data_histogram_number_vehicles, aes(x = data_histogram_number_vehicles$Make, fill = data_histogram_number_vehicles$Make)) +
      labs(x = "Manufacturer", y = "Number of Vehicles", title = "Number of Vehicles By Manufacturer") +
      theme(plot.title = element_text(hjust = 0.5))
      geom_histogram(binwidth = 1, stat = "count")
    histogram_vehicle_amount
  })


  # Scatterplot
  full_electric_vehicle_population <- filter(wa_electric_vehicle_population, wa_electric_vehicle_population$Electric.Vehicle.Type == 'Battery Electric Vehicle (BEV)' & wa_electric_vehicle_population$Base.MSRP > 0)

  output$scatterplot_msrp_range <- renderPlot({
    highest_msrp <- input$max_msrp
    data_scatterplot_msrp_range <- filter(full_electric_vehicle_population, full_electric_vehicle_population$Base.MSRP <= highest_msrp)
    scatterplot_msrp_range <- ggplot(data_scatterplot_msrp_range, aes(x = Base.MSRP, y = Electric.Range)) + # Create scatterplot
      labs(x = "Vehicle MSRP", y = "Electric Range", title = "Electric Vehicle MSRP vs Range") +
      theme(plot.title = element_text(hjust = 0.5)) +
      geom_point()
    scatterplot_msrp_range
  })


  # Create break for Conclusion page (if necessary)
}

