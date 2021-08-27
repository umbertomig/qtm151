library(shiny)
ui <- fluidPage(
  sliderInput(inputId = 'slide1',
              label = 'Choose a number of cases: ',
              value = 50, max = 1000, min = 0, step = 50),
  sliderInput(inputId = 'slide2',
              label = 'Choose number of breaks: ',
              value = 5, max = 25, min = 5, step = 5),
  plotOutput('hist')
)

server <- function(input, output) {
  output$hist <- renderPlot({
    x <- input$slide1
    y <- input$slide2
    hist(rnorm(x+1), breaks = y)
  })
  
}

shinyApp(ui = ui, server = server)