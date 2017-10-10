# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  #GRAPH 1: TOTAL RESEARCH STUDIES  
  output$Fig1 <- renderPlotly({
    ggplotly(test) 
  }) 
  
  #TABLE 1- Research Studies By Lab
  #Displaying Hyperlinks
  TABLE1_Input<- reactive({
    switch(input$radio_TABLE1, 
           "No"= Table1[,-7],
           "Yes"= Table1)
  })  
  
  #({output$table1<-renderDataTable(expr=datatable(TABLE1_Input(), escape=FALSE, options= list(paging = FALSE, searching= FALSE))
  #                )
  #})
  output$table1<-renderDataTable({
    datatable(TABLE1_Input(), options=list(paging=FALSE), rownames=FALSE, escape=FALSE) 
    
  })
  
  #TABLE 1a- SUM of TABLE1
  output$Table1a<-renderDataTable({
    datatable(Table1a, options=list(paging=FALSE, searching=FALSE, ordering=FALSE), rownames=FALSE) %>% 
      formatStyle('Summary', color='white', backgroundColor='yellowgreen') %>% 
      formatStyle('2012-2013', color='white', backgroundColor='yellowgreen') %>%  
      formatStyle('2013-2014', color='white', backgroundColor='yellowgreen') %>% 
      formatStyle('2014-2015', color='white', backgroundColor='yellowgreen') %>% 
      formatStyle('2015-2016', color='white', backgroundColor='yellowgreen') %>% 
      formatStyle('2016-2017', color='white', backgroundColor='yellowgreen')
  })
  
  
  #STUDENT ENGAGMENT 
  output$Fig2 <- renderPlotly({
    ggplotly(test1) 
  })   
  
  #GRAPH 2: Figure 2- 2016-17: Engagement in Collaborative Research Studies by SSRL Laboratory 
  output$Fig1a <- renderPlotly({
    plot_ly(CollabStudies20162017, x=~Count, y=~Unit, type='bar', text=~Lab, orientation='h',
            marker=list(color='#ff6347')) %>% 
     layout(xaxis=x, yaxis=y)  
  })   
 
#TABLE 3- Number of Researchers by Origin
  output$table3<-renderDataTable({
    datatable(Table3, options=list(paging=FALSE, searching=TRUE, ordering=TRUE), rownames=FALSE)
  })
  #TABLE 3a- SUM of TABLE3
  output$Table3a<-renderDataTable({
    datatable(Table3a, options=list(paging=FALSE, searching=FALSE, ordering=FALSE), rownames=FALSE)%>% 
      formatStyle('Summary', color='white', backgroundColor='yellowgreen') %>% 
      formatStyle('2012-2013', color='white', backgroundColor='yellowgreen') %>%  
      formatStyle('2013-2014', color='white', backgroundColor='yellowgreen') %>% 
      formatStyle('2014-2015', color='white', backgroundColor='yellowgreen') %>% 
      formatStyle('2015-2016', color='white', backgroundColor='yellowgreen') %>% 
      formatStyle('2016-2017', color='white', backgroundColor='yellowgreen')
  })

######
#Research Outputs GRAPH

  output$Fig3a <- renderPlotly({
    plot_ly(Fig3, x=~Year, y=~get(input$yvar), type='bar', text="Total Research Outputs", 
            marker=list(color='#ff6347')) %>% 
      layout(xaxis=y, yaxis=y)  
  })    
  #TABLE 4- Number of Researchers by Origin
  output$table4<-renderDataTable({
    datatable(Fig3, options=list(paging=FALSE, searching=FALSE, ordering=TRUE), rownames=FALSE)
  })  
})