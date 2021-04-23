#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

#######################################
############ Shiny Template ##########
#####################################



library(shiny)

ui<-fluidPage()   ## user interface(HTML),  define inputs and laid out outputs

server <- function (input, output) { }  # server instructions (R working), calculates results and create plots needed in outputs  

shinyApp(ui = ui, server = server)    # run the application by putting ui and server together


#################################

library(shiny)

ui<-fluidPage(    # fluidpage design rows and columns lay out automatically
  
  titlePanel(),  # give a title of your webpage
  
  sidebarLayout(   # sidebar layout with a sidebar and a main panel
  
  sidebarPanel(     
    
    ***Input   
    
    ),                    #comma between arguments
  mainPanel( 
    
    ***Output
    
    )
)

)

server <- function (input, output) {
  output$outputId <-render***({        # if a plot needed, then *renderplot*
    })
}

# Run the application 
shinyApp(ui = ui, server = server)



#######################################
############# shiny default example####
#######################################


library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel("Old Faithful Geyser Data"),
   
   # Sidebar with a slider input for number of bins 
   sidebarLayout(
     
      sidebarPanel(
         sliderInput(inputId = "bins",                                # inputId=" ", input name is for internal use
                     label = "Number of bins:",                       # label=" ", label to display
                     min = 1,                                         # the rest of specific arguments depend on what ***input function you use
                     max = 50,                                        # want to know the specific arguments, use ?***input
                     value = 30)
      ),
      
      # Show a plot of the generated distribution                     # define and display output by ***output function in ui
      mainPanel(                                                      # ***output function is matched with render*** function in server 
         plotOutput(outputId = "Histogram")                           # outputId=" ", give a name to the output object
      )
   )
)

# Define server logic required to draw a histogram
server <- function(input, output) {                                     # assemble inputs to outputs in server 
   
   output$Histogram <- renderPlot({                                     # save objects to display to output$outputId
      # define the variable to plot                                     # create outputs by render*** function together with ***output function in ui
      x    <- faithful[, 2]                                             # arguments in the render*** function is the whole block of codes to create objects
      
      # draw the histogram with the specified number of bins
      hist(x, breaks = input$bins, col = 'darkgray', border = 'white')  # use input values with input$inputId
   })
}

# Run the application 
shinyApp(ui = ui, server = server)



## build each shiny app with template and shiny cheat sheet ( http://shiny.rstudio.com/images/shiny-cheatsheet.pdf )

