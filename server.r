library(shiny)
library(shinyjs)
library(reshape)
library(ggplot2)
library(UsingR)

## Put a code, which is to be run once, outside shinyServer function to avoid recalcualtion
#Loading weather stats
sh <- read.csv("http://www.metoffice.gov.uk/pub/data/weather/uk/climate/datasets/Sunshine/date/UK.txt", skip = 7, sep = "")

#Subsetting data
sh <- sh[,1:13]
sh <- sh[1:86,]
sh <- melt(sh,id='Year', variable_name = "Month")

shinyServer(
  function(input,output) {
    output$newHist <- renderPlot({      
      #Subsetting data for a selected month only
      sh_sub <- sh[sh$Month==input$month,]
      
      #drawing a plot
      qplot(Year,value,data = sh_sub, xlab = "Year", ylab = "Sunshine (total hours)", main = input$month)                        
      })
    
    output$total <- renderPlot({
      #checking if the checkbox is set    
      if(input$minmax) {
        #enabling the slider input
        shinyjs::enable("year")
        #shinking the year range according the slider's data
        sh_range <- sh[sh$Year>=input$year[1] & sh$Year<=input$year[2],]
        #drawing a plot
        qplot(Year,value,data = sh_range, color = Month, xlab = "Year", ylab = "Sunshine (total hours)")
      }
      else {
          #disabling the slider input if the checkbox unset
          shinyjs::disable("year")
      }
    })
  }
)