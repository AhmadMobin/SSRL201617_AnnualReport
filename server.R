# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
#TOTAL RESEARCH STUDIES  
  output$Fig1 <- renderPlotly({
    ggplotly(test) 
  }) 

  
#STUDENT ENGAGMENT 
  output$Fig2 <- renderPlotly({
    ggplotly(test1) 
  })   
  
})