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
    p("Our domain of interest with this project is related to the environment field around the area of Pacific Northwest. We chose to observe the carbon footprint of human activities that has led towards greenhouse impacts in our local area. The questions we focused on with our research were based around specifically how vehicles are impact our local environment, and how the transition to the use of electric vehicles is moving along, and how it affects the local environment. How much of total US greenhouse gasses are released by cars with internal combustion engines? Could the change towards electric vehicles reduce the impact of carbon emission? Are more electric cars being produced? And finally, Is the range that comes with electric vehicles comparable for a feasible base MSRP so people are more open to switching to electric? To answer these questions, we analyzed data from", a(href="https://cfpub.epa.gov/ghgdata/inventoryexplorer/index.html#transportation/entiresector/allgas/category/all", "Greenhouse Gas Inventory Data Explorer"), "and from", a(href="https://data.wa.gov/Transportation/Electric-Vehicle-Population-Data/f6w7-q2d2", "Electric Vehicle Population Data"),
      img(src = "https://www.sharedmobility.news/wp-content/uploads/2017/06/CO2-emissions.jpg")
    )
  ),)

# Create UI for interactive page 1


emissions_choices <- checkboxGroupInput(
  inputId = "choices",
  label = "Choose one of these type of gas release",
  choices = list(
    "Fossil fuel combustion: C02",
    "Flourinated Gas",
    "Other Greenhouse Gas",
    "Other transportation categories",
    "Total Greenhouse Gas release"
  ),
  selected = "Total Greenhouse Gas release"
)

first_graph <- plotlyOutput(
  outputId = "plot_1",
  width = "100%"
)

interactive_page_1 <- tabPanel(
  "Carbon Dioxide released by Year",
  titlePanel("Emission of Greeenhouse Gasses by type of gasses by Year"),
  sidebarLayout(
    sidebarPanel(
      div(style = "display: inline-block;
          vertical-align:top", emissions_choices),
      div(style = "display: inline-block;
          vertical-align:top; width: 200px;", HTML("<br>")),
      width = 12
    ),
    mainPanel(
      first_graph
    )
  ),
  tags$p(
    "For this graph, we can see the usage of different carbon dioxide in each
    jurisdiction. The data is presetned in a way where it's easier for users
    to read and find out important information without having a hard time
    trying to inteptret the visual data.
    I've also included other types of emission
    to see which one ranks the highest among the emitters."
  )
)


# Create UI for interactive page 2
year_range <- range(Electric_Vehicle_Population_Data_filtered$Model.Year)

interactive_page_2 <- tabPanel(
  "Comparing Electric Vehicle MSRP to Electric Range",
  sidebarLayout(
    sidebarPanel(
      max_msrp
    ),
    mainPanel(
      plotOutput("year_range")
    )
  )
)

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
  ),
  p("In this scatterplot, one can see the points fo different vehicle’s electric range and base MSRP. The data is presented in a way for users to slide to see different ranges of the price point, as the range of base MSRP’s is very large, so being able to customize which data are seen is very useful and makes it easier to interpret the data.")
)

# Create UI for conclusion page
conclusion_page <- tabPanel(
  "Summary Takeaways",
  fluidPage(
    p("On the first page, the graph shows the carbon dioxide that is being released each year in different jurisdictions of the transportation sector. Here the major takeaway is first, the sheer quantity of greenhouse gasses which are released in the transportation sector. Furthermore, as seen in the graph, most of the greenhouse gasses being released are carbon dioxide by fossil fuel combustion. This is important information to take away from the data because it leads to the conclusion that it is crucial that we need to decrease these numbers in the coming years, one possibility of that being switching to electric vehicles over gas-powered vehicles."), 

p("On the second page,"),

p("On the third page, the scatterplot demonstrates the relationship between electric vehicle range and the electric vehicle’s base MSRP. The major takeaway from this plot is that there is a positive correlation between the two variables, where a higher base MSRP is likely to be accompanied with a higher range. However, as the base MSRP gets higher, there are diminishing returns with the range. This is important to note because the goal is to decrease CO2 Emissions. If we want people to do this in the transportation sector, it needs to be feasible, so this demonstrates that yes, a higher range can come with a higher base MSRP, but not to unrealistic lengths.")
))

# Define UI -----
ui <- navbarPage(
  "CO2 Emissions",
  intro_page,
  interactive_page_1,
  interactive_page_2,
  interactive_page_3,
  conclusion_page
)

