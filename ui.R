#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2
        )
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Temperature by Day in New York, May 1973"),
  
  sidebarLayout(
    sidebarPanel(
      h3("Selected Day and Temperature"),
      verbatimTextOutput("brush_info"),
      h6("Please drag to select a point")
    ),
    
    mainPanel(
       plotOutput("plot", brush = brushOpts(id = "brush"))
    )
  )
))
