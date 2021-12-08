library(shiny)
library(tidyverse)
library(plotly)

# data <- read.csv(".csv")

# Create UI for Intro page

intro_page <- tabPanel(
  "Introduction",
  fluidPage(
    p("write introduction here"),
    img(src = "https://www.sharedmobility.news/wp-content/uploads/2017/06/CO2-emissions.jpg")
    ))


# Create UI for interactive page 1

interactive_page_1 <- tabPanel(
  "Page Title",
  fluidPage(
    p("interactive graph and info here")))

# Create UI for interactive page 2

interactive_page_2 <- tabPanel(
  "Page Title",
  fluidPage(
    p("interactive graph and info here")))

# Create UI for interactive page 3

interactive_page_3 <- tabPanel(
  "Page Title",
  fluidPage(
    p("interactive graph and info here")))

# Create UI for conclusion page

conclusion_page <- tabPanel(
  "Summary",
  fluidPage(
    p("write conclusion here")))

# Create navbar for combining all

combine_pages <- navbarPage("CO2 Emissions", intro_page, interactive_page_1, interactive_page_2, interactive_page_3, conclusion_page)
 

# Define UI -----
ui <- fluidPage(navbarPage("CO2 Emissions", intro_page, interactive_page_1, interactive_page_2, interactive_page_3, conclusion_page))
                
  