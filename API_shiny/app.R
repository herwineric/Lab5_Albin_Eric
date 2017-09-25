#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel("Old Faithful Geyser Data"),
   
   # Sidebar with a slider input for number of bins 
   sidebarLayout(
      sidebarPanel(
        textInput("search", "Search: "),
         sliderInput("zoom",
                     "Zoom lv:",
                     min = 3,
                     max = 21,
                     value = 1)
      ),
      
      # Show a plot of the generated distribution
      mainPanel(
         plotOutput("distPlot")
      )
   
)
)

# Define server logic required to draw a histogram
server <- function(input, output) {
   
   output$distPlot <- renderPlot({
     
      
      map_generator(input$search, zoom = input$zoom)
     
     
      # generate bins based on input$bins from ui.R

     
   })
}

# Run the application 
shinyApp(ui = ui, server = server)

