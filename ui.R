dashboardPage(skin = "yellow",       
              dashboardHeader(title= "2016-2017 Report"), #Insert the Main Title
              # titleWidth = 350), #Longer Title Width
              
              dashboardSidebar(  
                sidebarMenu(
                  menuItem("# of Studies", tabName= "first", icon= icon("info-circle")),
                  menuItem("Collaborations", tabName="second", icon=icon("group")),
                  menuItem("Researcher Involvement", tabName="third", icon=icon("institution")),
                  menuItem("Student Engagement", tabName="fourth", icon=icon("graduation-cap")),
                  menuItem("Research Outputs", tabName="fifth", icon=icon("globe")),
                  menuItem("Network Analysis", tabName="sixth", icon=icon("sitemap"))
                )),
              dashboardBody(  
                tabItems(
                  tabItem(tabName= "first",
                          h3("Figure 1- Total Research Studies"),
                          plotlyOutput("Fig1",width = "100%", height = "100%"),
                          HTML ('</br>'),
                          h5("* The SSRL supported 299 research studies in 2016-2017- a substantial increase from the 208 research studies supported by the unit in 2015-2016")),
                  tabItem(tabName="second",
                          tabsetPanel(
                            tabPanel("2012-2017",
                          #HTML ('</br>'),           
                          h3("Table 1- Number of Research Studies by Lab"),
                          HTML ('</br>'),
                          #Inserting Radio Buttons
                          radioButtons("radio_TABLE1", label= h5 ("Show Hyperlinks:"),
                                       choices= c ("Yes", "No"), selected="No", inline=TRUE),
                          dataTableOutput('table1'),
                          h6("* Blank cells indicates the lab was not fully operable at any time during the fiscal year"),
                          HTML ('</br>'),
                          HTML ('</br>'),
                          HTML ('</br>'),
                          #HTML ('</br>'),
                          #HTML ('</br>'),
                          #SUMMATION TABLE
                          dataTableOutput("Table1a")
                          ),
                          tabPanel("2016-2017",
                                   h3("Figure 2- 2016-17: Engagement in Collaborative Research Studies by SSRL Laboratory"),
                                   plotlyOutput("Fig1a",width = "100%", height = "100%"),
                                   HTML ('</br>'),
                                   h5("* The SGAL & the QRL were most often engaged in the 17 multiple laboratory collaborative research studies supported by the SSRL in 2016-2017"),
                                   HTML ('</br>'),
                                   #HTML ('</br>'),
                                   #HTML ('</br>'),
                                   h4(("FUN FACT!"), style="color:darkorange"),
                                   h5(("The QRL became the first SSRL laboratory since our inception to surpass 100 research studies supported in a fiscal year. Way to go QRL!!!"), style="color:darkorange")
                                   )
                          )),
                tabItem(tabName="fourth",
                          h3("Figure 3- Number of Students Trained or Employed"),
                          plotlyOutput("Fig2",width = "100%", height = "100%"),
                          HTML ('</br>'),
                          h5("* The SSRL engaged 753 students in the 299 research studies supported by the unit in 2016-2017 - an increase of about 18% from the 638 students engaged by the SSRL in 2015-2016")),
                  tabItem(tabName="fifth"),
                  tabItem(tabName="sixth")
                  
                  
                )) 
) 