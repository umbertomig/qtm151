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
  # using comma to separate each part
  titlePanel("Prestige and Income data"),    
  
  selectInput(inputId = "type", 
              label = "Job type",
              selected = 'bc',
              choices = Prestige$type),

  
  mainPanel(
    plotOutput(outputId = "scatterplot"),
    plotOutput(outputId = "histogram")
  )
  
)

server <- function(input, output) {
  
  output$scatterplot <- renderPlot({ 
    dat <- Prestige %>%
      filter(type == input$type)
    plot(x = dat$education, 
         y = dat$prestige, 
         xlab = "Education", ylab = "Prestige", 
         pch = 16, cex = 2, col = "blue")
  })
  
  output$histogram <- renderPlot({ 
    dat <- Prestige %>%
      filter(type == input$type)
    hist(dat$income, col = "grey")
  })
  
}

shinyApp(ui, server)
