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

data(Prestige)
Prestige <- Prestige %>% na.omit()

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
    data<-Prestige[Prestige$type==input$type,]
    ggplot(data, aes(x=education,y=prestige))+geom_point()
  })
 
}

shinyApp(ui, server)