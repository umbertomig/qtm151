#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(car)
library(tidyverse)
library(shiny)

ui <- fluidPage(
  
  titlePanel("My Shiny App"),
  sliderInput('slide', 
              'Choose a number of cases: ',
              value = 50, max = 100, min = 1),
  sliderInput('nbins', 
              'Choose a number of bins: ',
              value = 5, max = 10, min = 5),
  plotOutput(outputId = "histogram")
  
)

server <- function(input, output) {
  output$histogram <- renderPlot(
    {
      dat <- data.frame(x = rnorm(1000))
      ggplot(dat, aes(x = x)) + 
        geom_histogram(bins = input$nbins) +
        labs(title = paste0('Number of bins = ', input$nbins))
    }
  )
}

shinyApp(ui, server)