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
 
  sidebarPanel( 
  selectInput(inputId = "type", 
              label = "Job type", 
              choices = Prestige$type)
),
  mainPanel(
    plotOutput(outputId = "scatterplot")
  )
  
)

server <- function(input, output) {
  
  output$scatterplot <- renderPlot({ 
    dat <- Prestige %>%
      filter(type == input$type)
    ggplot(dat, aes(x=education,y=prestige)) + 
      geom_point() + geom_smooth(method = 'lm') +
      geom_rug()
  })
 
}

shinyApp(ui, server)