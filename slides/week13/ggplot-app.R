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
  
  titlePanel("Prestige and Income data"),   
  selectInput(inputId = "type", 
              label = "Job type", 
              choices = Prestige$type),
  sliderInput('slidemin', 
              'Choose a minimum threshold for prestige: ',
              value = 0, max = 50, min = 0),
  plotOutput(outputId = "scatterplot")
  
)

server <- function(input, output) {
  
  output$scatterplot <- renderPlot({ 
    dat <- Prestige %>%
      filter(type == input$type)
    ggplot(dat, aes(x = education, y = prestige)) + 
      geom_point() + geom_smooth(method = 'lm') +
      geom_rug()
  })
 
}

shinyApp(ui, server)