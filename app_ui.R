# Load the libraries
library(shiny)
library(tidyverse)
library(plotly)

# Read dataset
source("app_server.R")

# Create buttons
max_msrp <- sliderInput(
  inputId = "max_msrp",
  h3("Select Max Vehicle MSRP to Plot"),
  min = 0,
  max = 100000,
  value = 100000
)

# Create UI for Intro page
intro_page <- tabPanel(
  "Introduction",
  fluidPage(
    h1("A Study on Carbon Emissions in the Pacific Northwest"),
    p("write introduction here"),
    img(src = "https://www.sharedmobility.news/wp-content/uploads/2017/06/CO2-emissions.jpg")
  )
)

# Create UI for interactive page 1
interactive_page_1 <- tabPanel(
  "Page Title",
  fluidPage(
    p("interactive graph and info here")))

# Create UI for interactive page 2
year_range <- range(Electric_Vehicle_Population_Data_filtered$Model.Year)

interactive_page_2 <- tabPanel(
  "Vehicles by Model Year",
  fluidPage(
    h1("Number of Electric Vehicles by Model Year")),
sidebarLayout(sidebarPanel(sliderInput("model.year", "Model Year", min = year_range[1], max = year_range[2],
                  value = year_range,
                  sep = "",
                  step = 1)
    ), mainPanel((
      plotOutput("plot_2")
    )
  ), p("This chart helps to answer the question, “What are the trends in the number of electric and hybrid cars being produced and sold?” It displays the number of electric vehicles in Washington states, sorted by the model year of those vehicles. An upward trend can be seen through this chart, displaying that many more electric vehicles are being produced and purchased in recent years.")),)

# Create UI for interactive page 3
interactive_page_3 <- tabPanel(
  "Comparing Electric Vehicle MSRP to Electric Range",
  sidebarLayout(
    sidebarPanel(
      max_msrp
    ),
    mainPanel(
      plotOutput("scatterplot_msrp_range")
    )
  )
)

# Create UI for conclusion page
conclusion_page <- tabPanel(
  "Summary",
  fluidPage(
    p("write conclusion here")))

# Define UI -----
ui <- navbarPage(
  "CO2 Emissions",
  intro_page,
  interactive_page_1,
  interactive_page_2,
  interactive_page_3,
  conclusion_page
)
                
  