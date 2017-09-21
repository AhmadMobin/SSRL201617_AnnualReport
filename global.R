library(shiny)
library(shinydashboard)
library(RCurl) #package for the get URL function 
library(plotly)
require(ggplot2)
library(dplyr)
library(grid) #adding text to ggplots 

##### TOTAL RESEARCH STUDIES
Fig1<-read.csv (text=getURL("https://raw.githubusercontent.com/AhmadMobin/SSRL201617_AnnualReport/master/Fig1.csv"),header = TRUE, stringsAsFactors = FALSE, fileEncoding = "UTF-8")


test<- ggplot(Fig1, aes(x= Year, y=Count, fill= Status)) +
  geom_bar(stat= "identity", position="stack", width= 0.5)+
  scale_fill_manual(values=c("red", "blue"))+
  #labs(caption= "Figure 1- Total Research Studies")+
  #ggtitle("Total Research Studies") + #MAIN TITLE
  #theme(plot.title = element_text(family = "Trebuchet MS", color="black", face="bold", size=20, hjust=1.0, vjust=-0.5))+
  xlab(NULL)+ #X-axis label 
  theme (axis.title.x=element_text (angle=0, size=18, face="bold", color="black"))+  #Formating title of x-axis
  theme (axis.text.x=element_text(angle=0, size=12, vjust=90))+ 
  theme (axis.text.y=element_text(angle=0, size=10))+
  ylab (NULL) + #no title for y-axis
  #geom_text(aes(Year, total, label = total, fill = NULL, vjust=-0.5,  size=20), data = totals)+
  annotate("text", label= "39", x=1, y=49)+
  annotate("text", label= "92", x=2, y=102)+
  annotate("text", label= "156", x=3, y=166)+
  annotate("text", label= "208", x=4, y=218)+
  annotate("text", label= "299", x=5, y=309)+
  theme (panel.grid.minor=element_blank(), #Hiding the minor gridlines
         panel.grid.major=element_blank()) + #Hiding the major gridlines
  theme (plot.background=element_rect(fill='white'))+ #changes the plot background (not the panel) colour
  theme (panel.background=element_rect (fill='grey'))+
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
  scale_fill_manual(values=c("cyan", "forestgreen", "purple4"))+
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
  theme (panel.background=element_rect (fill='grey'))+
  theme (axis.line.x=element_line(color="black", size=1))+ #black line on x-axis
  theme (axis.line.y=element_line(color="black", size=1))+
  scale_y_continuous (breaks=seq(0,800, by=50), expand=c(0,0))+ #setting custom y-axis breaks & also expand=c removes space btwn bars and x-axis
  scale_x_discrete(expand = c(0, 0)) +
  coord_cartesian(ylim=c(0,800))+ #zooms into the y-axis at 0 to 800 
  theme(legend.title=element_blank(), legend.position="bottom")

##### 
