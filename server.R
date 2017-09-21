# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  output$Fig1 <- renderPlotly({
    ggplotly(test) 
  }) 
  
})