library(car)
library(tidyverse)
library(shiny)

set.seed(123)

ui <- fluidPage(
  titlePanel("My Shiny App"),
  sliderInput('my_slide', 
              'Choose a number of cases: ',
              value = 300, max = 1000, min = 10),
  plotOutput('my_hist')
)

server <- function(input, output) {
  output$my_hist <- renderPlot({
    my_data <- 
      data.frame(x = rnorm(input$my_slide))
    ggplot(my_data, aes(x = x)) + 
      geom_histogram()
  })
}

shinyApp(ui, server)
