dashboardPage(skin = "green",       
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
                          plotlyOutput("Fig1",width = "100%", height = 700),
                          HTML ('</br>'),
                          h4("* The SSRL supported 299 research studies in 2016-2017- a substantial increase from the 208 research studies supported by the unit in 2015-2016")),
                  tabItem(tabName="second"),
                  tabItem(tabName="third"),
                  tabItem(tabName="fourth"),
                  tabItem(tabName="fifth"),
                  tabItem(tabName="sixth")
                
                
                )) 
) 
              