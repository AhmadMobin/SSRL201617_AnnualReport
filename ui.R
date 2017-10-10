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
                            tabPanel("2012-2013 to 2016-2017",
                                     #HTML ('</br>'),           
                                     h3("Table 1- Number of Research Studies by Lab"),
                                     HTML ('</br>'),
                                     #Inserting Radio Buttons
                                     radioButtons("radio_TABLE1", label= h5 ("Show Hyperlinks:"),
                                                  choices= c ("Yes", "No"), selected="No", inline=TRUE),
                                     dataTableOutput('table1'),
                                     h6("* Blank cells indicates the lab was not fully operable at any time during the fiscal year"),
                                     #HTML ('</br>'),
                                     #HTML ('</br>'),
                                     #HTML ('</br>'),
                                     #HTML ('</br>'),
                                     #HTML ('</br>'),
                                     #SUMMATION TABLE
                                     dataTableOutput("Table1a")
                            ),
                            tabPanel("2016-2017",
                                     h3("Figure 2- 2016-17: Engagement in Collaborative Research Studies by SSRL Laboratory"),
                                     plotlyOutput("Fig1a",width = "100%", height = "100%"),
                                     HTML ('</br>'),
                                     h5("* The SGAL & the QRL were most often engaged in the 17 multiple laboratory collaborative research studies supported by the SSRL in 2016-2017")
                            )
                          )),
                  tabItem(tabName="third",
                          tabsetPanel(
                            tabPanel("Overview",
                          h3("Table 2- Number of Researchers by Origin"),
                          dataTableOutput("Table3a")
                          ),
                          tabPanel("2012-2013 to 2016-2017",
                          dataTableOutput('table3'),
                          h6("*Blank cells indicates college, school or supporting unit was not affiliated with the SSRL at any time during the fiscal year. Previous years' data for these colleges, schools or supporting units are reported in the row 'Other University of Saskatchewan' in the 'Overview' tab")
                          )
                          )),
                  tabItem(tabName="fourth",
                          h3("Figure 3- Number of Students Trained or Employed"),
                          plotlyOutput("Fig2",width = "100%", height = "100%"),
                          HTML ('</br>'),
                          h5("* The SSRL engaged 753 students in the 299 research studies supported by the unit in 2016-2017 - an increase of about 18% from the 638 students engaged by the SSRL in 2015-2016")),
                  tabItem(tabName="fifth",
                          tabsetPanel(
                            tabPanel("Graph",
                          h3("Figure 4- Number of Research Outputs per Year"),
                          HTML ('</br>'),
                          #Inserting Drop-Down Menu
                          selectInput("yvar", "Choose a Research Output:", choices= c ("Review Articles", "Non-Refereed Journal Articles","Books", "Book Chapters", "Theses" , "Websites", "Technical Reports", "Media Articles", "Peer-Reviewed Journal Articles", "Conference Papers and Presentations"), selected = "Review Articles"),
                          plotlyOutput("Fig3a",width = "100%", height = "100%")
                          ),
                          tabPanel("Summary Table",
                          dataTableOutput('table4')
                          )
                          )),
                  tabItem(tabName="sixth")
                  
                  
                )) 
) 