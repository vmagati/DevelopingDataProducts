#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

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
