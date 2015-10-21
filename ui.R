library(shiny)
library(shinyjs)

shinyUI(
  navbarPage("Developing Data Products",
    
    tabPanel("Shiny App",
            fluidPage(
                shinyjs::useShinyjs(),
                
                sidebarLayout(
                    sidebarPanel(
                        sliderInput('year','Select Year',value=c(1929,2014),min = 1929,max = 2014, step = 1),
                        selectInput('month','Select month',choices = c("JAN","FEB","MAR","APR","MAY","JUN","JUL","SEP","OCT","NOV","DEC")),
                        checkboxInput('minmax','Stats for all months')
                    ),
                    
                    mainPanel(                 
                        plotOutput('newHist'),
                        plotOutput('total')                 
                    )  
                )
            )             
    ),
    
    tabPanel("Help",
            fluidPage(
              wellPanel(
                p("This shiny application uses time-series of monthly, seasonal and annual regional sunshine values published by the UK's National Weather Service to show plots of total hours of sunshine by month or by years range."),
                p("It downloads raw data, cleans it out and transforms to allow furher manipulation using inputs on the page")
              ),
                hr(),
                p("The shiny application contains 3 types of input - a slider, a dropdown box and a check box."),
                p("The slider allows to set years range. This slider is disabled by default and could be enabled with the checkbox."),
                p("The dropdown box allows to set a month we'd like to see a statistical data for."),
                p("The checkbox allows to enable/disable the slider input and to shows the summary plot.",strong(" Please expect some delay in showing the summary plot."))
            )
    )
    )
)

