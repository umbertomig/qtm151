

#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(car)
library(shiny)

ui <- fluidPage(
  
  titlePanel("Prestige and Income data"),    # using comma to separate each part
  
  selectInput(inputId = "type", 
              label = "Job type", 
              choices = Prestige$type), 

  
  mainPanel(
    plotOutput(outputId = "scatterplot"),
    plotOutput(outputId = "histogram")
  )
  
)

server <- function(input, output) {
  
  output$scatterplot <- renderPlot({ 
    data<-Prestige[Prestige$type==input$type,]
    plot(x= data$education,y= data$prestige, 
         xlab="Education", ylab="Prestige", 
         pch=16,cex=2,col="blue")
  })
  
  output$histogram <- renderPlot({ 
    data<-Prestige[Prestige$type==input$type,]
    hist(data$income, col = "grey")
  })
  
}

shinyApp(ui, server)