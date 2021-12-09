library(tidyverse)
library(shiny)
library(plotly)

# Read in dataset
# data_wa <- read.csv("")
wa_electric_vehicle_population <- read.csv("Electric_Vehicle_Population_Data.csv")

Electric_Vehicle_Population_Data <- read.csv('Electric_Vehicle_Population_Data.csv')
Electric_Vehicle_Population_Data_filtered <- Electric_Vehicle_Population_Data %>% filter(Model.Year != 2022)

# Define server logic ----
server <- function(input, output){

#define for second interactive page
  output$plot_2 <- renderPlot({
    Model.Year <- (Electric_Vehicle_Population_Data_filtered[, 6])
    bins <- seq(min(Model.Year), max(Model.Year))
    
    # draw the histogram
    hist(Model.Year, breaks = bins, col = 'green', border = 'white')})

    
  # Scatterplot
  wa_electric_vehicle_population <- read.csv('Electric_Vehicle_Population_Data.csv') # Load CSV file
  full_electric_vehicle_population <- filter(wa_electric_vehicle_population, wa_electric_vehicle_population$Electric.Vehicle.Type == 'Battery Electric Vehicle (BEV)' & wa_electric_vehicle_population$Base.MSRP > 0)

  output$scatterplot_msrp_range <- renderPlot({
    highest_msrp <- input$max_msrp
    data_scatterplot_msrp_range <- filter(full_electric_vehicle_population, full_electric_vehicle_population$Base.MSRP <= highest_msrp)
    scatterplot_msrp_range <- ggplot(data_scatterplot_msrp_range, aes(x=Base.MSRP, y=Electric.Range)) + # Create scatterplot
      labs(x = "Vehicle MSRP", y = "Electric Range", title = "Electric Vehicle MSRP vs Range") +
      theme(plot.title = element_text(hjust = 0.5)) +
      geom_point()
    scatterplot_msrp_range
  })


  # Create break for Conclusion page (if necessary)
}

