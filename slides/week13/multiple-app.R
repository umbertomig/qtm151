#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

ui <- fluidPage(
  tabsetPanel(tabPanel(title = "Normal",
                       plotOutput("norm"),
                       actionButton("renorm", "Resample")),
              tabPanel(title = "Uniform",
                       plotOutput("unif"),
                       actionButton("reuni", "Resample"))
  )
)


# Define server logic required to draw a histogram
server <- function(input, output) {
  
  rv <- reactiveValues(
    norm = rnorm(100), 
    unif = runif(100))
  
  observeEvent(input$renorm, handlerExpr = {
    rv$norm <- rnorm(100)
    })
  observeEvent(input$reuni, handlerExpr = {
    rv$unif <- runif(100)
    } )

  output$norm <- renderPlot({
    hist(rv$norm, col ="blue")
  })
  
  output$unif <- renderPlot({
    hist(rv$unif, col ="green")
  })
  
  
}

# Run the application 
shinyApp(ui = ui, server = server)