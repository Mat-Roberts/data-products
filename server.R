library(shiny)
library(plyr)
library(knitr)
library(markdown)
library(ggplot2)
data <- read.csv("./diamonds.csv")
options(scipen=999)
stCount <- count(data$cut)

shinyServer(
  function(input, output) {
    
    data <- data[,c("carat","cut","color","clarity","depth","table","price","x","y","z")]
    names(data) <- c("Carat","Cut","Color","Clarity","Depth","Table","Price","X","Y","Z")
    
    output$table <- renderDataTable(data, options = list(
      lengthMenu = list(c(10, 50, -1), c('10', '50', 'All')),
      pageLength = 10,
      pageWidth = 15)
    )
    output$plot <- renderPlot({barplot(stCount$freq, names.arg = stCount$x, 
                                       main = "Total Diamonds by Cut",ylab = "Total Diamonds", 
                                       cex.names = .8, cex.axis = .9, las = 2,
                                       col = c("pink","light blue"))
    })
    output$plot2 <- renderPlot({       
             
                                ggplot(data=data, aes(x=data$carat, colour=data$color)) + geom_freqpoly() + 
                                  scale_x_log10() + scale_y_log10()
                                
    })
  })
