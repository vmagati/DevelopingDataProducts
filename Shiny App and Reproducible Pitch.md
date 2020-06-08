Shiny App and Reproducible Pitch
========================================================
author: Vijay Magati
date: 6/7/2020
autosize: true

Project
========================================================

This peer assessed assignment has two parts. First, you will create a Shiny application and deploy it on Rstudio's servers. Second, you will use Slidify or Rstudio Presenter to prepare a reproducible pitch presentation about your application.

Application Summary
========================================================

This application will allow the user to track temperatures in New York throughout the month of May in 1973. Users will be able to drag across a point in the graph to see the date of the month and the temperature for that day. The dataset used was the "airquality" dataset built into R.

Shiny App UI
========================================================


```r
library(shiny)
library(ggplot2)
shinyUI(fluidPage(
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
```


Shiny App Server
========================================================


```r
library(shiny)
library(ggplot2)

airquality_subset <- data.frame
shinyServer(function(input, output) {
  airquality_subset <- data.frame(airquality[1:31, c("Day", "Temp")])
  output$plot <- renderPlot({
        ggplot(airquality_subset, aes(Day, Temp)) + geom_point()
  })
  output$brush_info <- renderPrint({
    brushedPoints(airquality_subset, input$brush)
  })
  
})
```

Application
========================================================

The application is available to view and interact with at https://vmagati.shinyapps.io/TempInNewYorkByDay/ 

Git repository is available at https://github.com/vmagati/DevelopingDataProducts 
