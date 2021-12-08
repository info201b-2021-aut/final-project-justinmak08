library(shiny)
library(tidyverse)
library(plotly)

# data <- read.csv(".csv")

# Create UI for Intro page

intro_page <- tabPanel(
  "Introduction",
  fluidPage(
    h1("Introduction"),
    p("write introduction here"),
    img(src = "https://www.sharedmobility.news/wp-content/uploads/2017/06/CO2-emissions.jpg")
    ))


# Create UI for interactive page 1

# Create UI for interactive page 2



# Create UI for interactive page 3


# Create UI for conclusion page


# Create navbar for combining all

combine_pages <- navbarPage("CO2 Emissions", intro_page)
 

# Define UI -----
ui <- fluidPage(navbarPage("CO2 Emissions", intro_page))
                
  