library(shiny)
library(shinydashboard)
library(RCurl) #package for the get URL function 
library(plotly)
library(RColorBrewer) #colors for plot_ly
require(ggplot2)
library(dplyr)
library(grid) #adding text to ggplots 
library(DT) #datatables
library(ggvis)


##### TOTAL RESEARCH STUDIES
Fig1<-read.csv (text=getURL("https://raw.githubusercontent.com/AhmadMobin/SSRL201617_AnnualReport/master/Fig1.csv"),header = TRUE, stringsAsFactors = FALSE, fileEncoding = "UTF-8")


test<- ggplot(Fig1, aes(x= Year, y=Count, fill= Status)) +
  geom_bar(stat= "identity", position="stack", width= 0.5)+
  scale_fill_manual(values=c('green', 'yellowgreen'))+
  #labs(caption= "Figure 1- Total Research Studies")+
  #ggtitle("Total Research Studies") + #MAIN TITLE
  #theme(plot.title = element_text(family = "Trebuchet MS", color="black", face="bold", size=20, hjust=1.0, vjust=-0.5))+
  xlab(NULL)+ #X-axis label 
  theme (axis.title.x=element_text (angle=0, size=18, face="bold", color="black"))+  #Formating title of x-axis
  theme (axis.text.x=element_text(angle=0, size=12, vjust=90))+ 
  theme (axis.text.y=element_text(angle=0, size=10))+
  ylab (NULL) + #no title for y-axis
  #geom_text(aes(Year, total, label = total, fill = NULL, vjust=-0.5,  size=20), data = totals)+
  annotate("text", label= "39", fontface="bold", x=1, y=39)+
  annotate("text", label= "92", x=2, y=92)+
  annotate("text", label= "156", x=3, y=156)+
  annotate("text", label= "208", x=4, y=208)+
  annotate("text", label= "299", x=5, y=299)+
  theme (panel.grid.minor=element_blank(), #Hiding the minor gridlines
         panel.grid.major=element_blank()) + #Hiding the major gridlines
  theme (plot.background=element_rect(fill='white'))+ #changes the plot background (not the panel) colour
  theme (panel.background=element_rect (fill='white'))+
  theme (axis.line.x=element_line(color="black", size=1))+ #black line on x-axis
  theme (axis.line.y=element_line(color="black", size=1))+
  scale_y_continuous (breaks=seq(0,350, by=50), expand=c(0,0))+ #setting custom y-axis breaks & also expand=c removes space btwn bars and x-axis
  scale_x_discrete(expand = c(0, 0)) +
  coord_cartesian(ylim=c(0,350))+ #zooms into the y-axis at 0 to 600 
  theme(legend.title=element_blank(), legend.position="bottom") #removes title from legend
#####

##### STUDENT ENGAGEMENT

Fig2<- read.csv (text=getURL("https://raw.githubusercontent.com/AhmadMobin/SSRL201617_AnnualReport/master/Fig2.csv"),header = TRUE, stringsAsFactors = FALSE, fileEncoding = "UTF-8")


test1<- ggplot(Fig2, aes(x= Year, y=Count, fill= Student)) +
  geom_bar(stat= "identity", position="stack", width= 0.5)+
  scale_fill_manual(values=c("green", "lightgreen", "yellowgreen"))+
  #labs(caption= "Figure 1- Total Research Studies")+
  #ggtitle("Total Research Studies") + #MAIN TITLE
  #theme(plot.title = element_text(family = "Trebuchet MS", color="black", face="bold", size=20, hjust=1.0, vjust=-0.5))+
  xlab(NULL)+ #X-axis label 
  theme (axis.title.x=element_text (angle=0, size=18, face="bold", color="black"))+  #Formating title of x-axis
  theme (axis.text.x=element_text(angle=0, size=12, vjust=90))+ 
  theme (axis.text.y=element_text(angle=0, size=10))+
  ylab (NULL) + #no title for y-axis
  #geom_text(aes(Year, total, label = total, fill = NULL, vjust=-0.5,  size=20), data = totals)+
  annotate("text", label= "328", x=1, y=328, size=3)+
  annotate("text", label= "372", x=2, y=372, size=3)+
  annotate("text", label= "274", x=3, y=274, size=3)+
  annotate("text", label= "638", x=4, y=638, size=3)+
  annotate("text", label= "753", x=5, y=753, size=3)+
  theme (panel.grid.minor=element_blank(), #Hiding the minor gridlines
         panel.grid.major=element_blank()) + #Hiding the major gridlines
  theme (plot.background=element_rect(fill='white'))+ #changes the plot background (not the panel) colour
  theme (panel.background=element_rect (fill='white'))+
  theme (axis.line.x=element_line(color="black", size=1))+ #black line on x-axis
  theme (axis.line.y=element_line(color="black", size=1))+
  scale_y_continuous (breaks=seq(0,800, by=50), expand=c(0,0))+ #setting custom y-axis breaks & also expand=c removes space btwn bars and x-axis
  scale_x_discrete(expand = c(0, 0)) +
  coord_cartesian(ylim=c(0,800))+ #zooms into the y-axis at 0 to 800 
  theme(legend.title=element_blank(), legend.position="bottom")

##### 

#Table 1- Number of Research Studies By Lab
#Table1<- read.csv(file="C:\\Users\\amobin\\Dropbox\\SSRL\\AnnualReport_2016_17\\Table1_ResearchStudiesByLab.csv",
#                  header=TRUE, sep=",")
Table1<-read.csv (text=getURL("https://raw.githubusercontent.com/AhmadMobin/SSRL201617_AnnualReport/master/Table1_ResearchStudiesByLab.csv"),header = TRUE, stringsAsFactors = FALSE, fileEncoding = "UTF-8")

#Renaming Columns
colnames(Table1)[2]<- "2012-2013"
colnames(Table1)[3]<- "2013-2014"
colnames(Table1)[4]<- "2014-2015"
colnames(Table1)[5]<- "2015-2016"
colnames(Table1)[6]<- "2016-2017"

#Creating Hyperlinks
Links<- c("ssrl.usask.ca/laboratories/col.php", "ssrl.usask.ca/laboratories/edl.php",
          "ssrl.usask.ca/laboratories/ehl.php", "ssrl.usask.ca/laboratories/qrl.php",
          "ssrl.usask.ca/laboratories/safihr.php", "ssrl.usask.ca/laboratories/sgal.php",
          "ssrl.usask.ca/laboratories/snl.php", "ssrl.usask.ca/laboratories/vital.php", NA)
Table1$Links<-Links
#making hyperlinks in data table
Table1$Links <- sapply(Table1$Links, function(x) 
  toString(tags$a(href=paste0("http://", x), x)))

#TABLE 1 A- Total number of research studies
Year_1<-39
Year_2<-92
Year_3<-156
Year_4<-208
Year_5<-299
Lab<-"TOTAL RESEARCH STUDIES"

Table1a<-cbind(Lab, Year_1, Year_2, Year_3, Year_4, Year_5)
Table1a<- as.data.frame(Table1a)
#Renaming columns
colnames(Table1a)[1]<- "Summary"
colnames(Table1a)[2]<- "2012-2013"
colnames(Table1a)[3]<- "2013-2014"
colnames(Table1a)[4]<- "2014-2015"
colnames(Table1a)[5]<- "2015-2016"
colnames(Table1a)[6]<- "2016-2017"
#####
#Figure 2016-2017: Collaborative Studies
#CollabStudies20162017<-read.csv(file="C:\\Users\\amobin\\Dropbox\\SSRL\\AnnualReport_2016_17\\CollabStudies20162017.csv",
#                      header=TRUE, sep=",")
CollabStudies20162017<-read.csv (text=getURL("https://raw.githubusercontent.com/AhmadMobin/SSRL201617_AnnualReport/master/CollabStudies20162017.csv"),header = TRUE, stringsAsFactors = FALSE, fileEncoding = "UTF-8")


#Renaming Columns
colnames(CollabStudies20162017)[2]<- "Count"
#FOR PLOT_LY GRAPH
f <- list(
  family = "Courier New, monospace",
  size = 18,
  color = "#070707"
)
x <- list(
  title = "Number of Studies",
  titlefont = f
)
y <- list(
  title = "",
  titlefont = f
)
#####
#Table 3- Number of Research By Origin
#Table3<- read.csv(file="C:\\Users\\amobin\\Dropbox\\SSRL\\AnnualReport_2016_17\\Table3_ResearchersByOrigin.csv",
#                  header=TRUE, sep=",")
Table3<-read.csv (text=getURL("https://raw.githubusercontent.com/AhmadMobin/SSRL201617_AnnualReport/master/Table3_ResearchersByOrigin.csv"),header = TRUE, stringsAsFactors = FALSE, fileEncoding = "UTF-8")

#Renaming Columns
colnames(Table3)[1]<-"Affiliated University of Saskatchewan Colleges, Schools and Supporting Units"
colnames(Table3)[2]<- "2012-2013"
colnames(Table3)[3]<- "2013-2014"
colnames(Table3)[4]<- "2014-2015"
colnames(Table3)[5]<- "2015-2016"
colnames(Table3)[6]<- "2016-2017"

#Replacing "--" to blanks
Table3[Table3=="--"]<-NA

#SUMMARY TABLE OF TABLE 3
#Table3a<- read.csv(file="C:\\Users\\amobin\\Dropbox\\SSRL\\AnnualReport_2016_17\\Table3a_Summary.csv",
#                  header=TRUE, sep=",")
Table3a<-read.csv (text=getURL("https://raw.githubusercontent.com/AhmadMobin/SSRL201617_AnnualReport/master/Table3a_Summary.csv"),header = TRUE, stringsAsFactors = FALSE, fileEncoding = "UTF-8")

colnames(Table3a)[2]<- "2012-2013"
colnames(Table3a)[3]<- "2013-2014"
colnames(Table3a)[4]<- "2014-2015"
colnames(Table3a)[5]<- "2015-2016"
colnames(Table3a)[6]<- "2016-2017"
#####

#Research Outputs
#Fig3<- read.csv(file="C:\\Users\\amobin\\Dropbox\\SSRL\\AnnualReport_2016_17\\ResearchOutputs.csv",
#                  header=TRUE, sep=",")
Fig3<-read.csv (text=getURL("https://raw.githubusercontent.com/AhmadMobin/SSRL201617_AnnualReport/master/ResearchOutputs.csv"),header = TRUE, stringsAsFactors = FALSE, fileEncoding = "UTF-8")

colnames(Fig3)[1]<- "Year"
colnames(Fig3)[2]<- "Review Articles"
colnames(Fig3)[3]<- "Non-Refereed Journal Articles"
colnames(Fig3)[4]<- "Books"
colnames(Fig3)[5]<- "Book Chapters"
colnames(Fig3)[6]<- "Theses"
colnames(Fig3)[7]<- "Websites"
colnames(Fig3)[8]<- "Technical Reports"
colnames(Fig3)[9]<- "Media Articles"
colnames(Fig3)[10]<- "Peer-Reviewed Journal Articles"
colnames(Fig3)[11]<- "Conference Papers and Presentations"


