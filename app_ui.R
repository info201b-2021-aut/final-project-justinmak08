library(shiny)
library(tidyverse)
library(plotly)

# data <- read.csv(".csv")

# Intro page UI

intro <- tabPanel(
  "Introduction",
  # includeCSS("style.css"),
  tags$body(
    titlePanel(tags$h1("Data Overview")),
    tags$h2("Reflection Question"),
    tags$p(
      "Reflection question:", em("Question 1")," or", em("Question 2?"),
      ". Those are questions we trying to answer for this project."
    ),
    
    # HTML('<center><img src="PNW.jpg", width = 800, height = 400></center>'),
    
    tags$h2("Project's Nature"),
    tags$p(
      "Yada yada yada..."
    ),
    # HTML('<center><img src="climate.jpg", width = 800, height = 400></center>')
  )
)



# Create UI for interactive page 1


# Create UI for interactive page 2



# Create UI for interactive page 3



# Create UI for conclusion page
conclusion <- tabPanel(
  "Conclusion",
  tags$body(
    titlePanel((tags$h1("Conclusion"))),
    tags$h2("3 major takeways"),
    tags$p(
      "yada yada..",
      tags$ul(
        tags$li("The ...."),
        tags$li("The...."),
        tags$li("The .... ")
      )
    )
  )
)

# Create navbar for combining all

# ui <- navbarPage(
# 
# )
# Define UI -----
ui <- navbarPage(
  intro,
  conclusion
  
)