library(tidyverse)
library(shiny)
library(plotly)

# Read in dataset
# data_wa <- read.csv("")
gas_emission_data <- read.csv("US_Greenhouse_Gas_Emissions_Transportation.csv")

wa_electric_vehicle_population <- read.csv("Electric_Vehicle_Population_Data.csv")

Electric_Vehicle_Population_Data <- read.csv('Electric_Vehicle_Population_Data.csv')
Electric_Vehicle_Population_Data_filtered <- Electric_Vehicle_Population_Data %>% filter(Model.Year != 2022)

# Define server logic ----
server <- function(input, output){
  
  # Define for first interactive page
  output$plot_1 <- renderPlotly({
    # data_plot1 <- gas_emission_data %>%
    #   rename(
    #     co2 = "Fossil fuel combustion: carbon dioxide",
    #     florinated = "Use of fluorinated gases",
    #     othergreenhouse = "Fossil fuel combustion: other greenhouse gases",
    #     othertransportation = "Other transportation categories",
    #     total = "Total"
    #   )# %>% select(Year, input$choices)
    # first_chart <- ggplot(data = data_plot1, aes(x=Year, y=input$choices)) + 
    #   scale_x_continuous(breaks = seq(1990, 2020, by = 5)) + ggtitle("Carbon Dioxide released by Year") +
    #   theme(plot.title = element_text(hjust = 0.5)) + geom_line() 
    # first_chart
    co2_year <- gas_emission_data %>% select(Year, Fossil.fuel.combustion..carbon.dioxide)
    names(co2_year)[2] <- "Carbon Dioxide (million metric tons of CO2)"
    # %>%
    #   summarise(rename(
    #     "Carbon Dioxide" = Fossil.fuel.combustion..carbon.dioxide
    #   ))
    
    co2_over_year <- ggplot(co2_year, aes(x=Year, y=`Carbon Dioxide (million metric tons of CO2)`)) +
      scale_x_continuous(breaks = seq(1990, 2020, by = 5)) + ggtitle("Carbon Dioxide released by Year") +
      theme(plot.title = element_text(hjust = 0.5)) + geom_line()
    return(co2_over_year)
  })

  # Data
  wa_electric_vehicle_population <- read.csv('Electric_Vehicle_Population_Data.csv') # Load CSV file
  full_electric_vehicle_population <- filter(wa_electric_vehicle_population, wa_electric_vehicle_population$Electric.Vehicle.Type == 'Battery Electric Vehicle (BEV)' & wa_electric_vehicle_population$Base.MSRP > 0)
    
  #define for second interactive page
  output$year_range <- renderPlot({
    highest_msrp <- input$max_msrp
    data_scatterplot_msrp_range <- filter(full_electric_vehicle_population, full_electric_vehicle_population$Base.MSRP <= highest_msrp)
    year_range <- ggplot(data_scatterplot_msrp_range, aes(x=Model.Year, y=Electric.Range)) + # Create scatterplot
      labs(x = "Vehicle Model Year", y = "Electric Range", title = "Vehicle Model Year vs Range") +
      theme(plot.title = element_text(hjust = 0.5)) +
      geom_point()
    year_range
  })
  
  
  # Scatterplot
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
