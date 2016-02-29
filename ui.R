library(shiny)
library(markdown)
library(knitr)

shinyUI(
  navbarPage(
    title = 'Navigation Bar',
    
    tabPanel(
      'Summary',
     
      includeMarkdown("summary.Rmd")
    ),
    tabPanel(
      'Table',
      dataTableOutput("table")
    ),
    tabPanel('Plots',
             plotOutput("plot"),
             
             plotOutput("plot2")
    )
  )
)
