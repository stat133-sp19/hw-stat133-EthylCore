#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
library(reshape2)

# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel("Investment Models"),
   
   # Sidebar with a slider input for number of bins 
   fluidRow(
     column(4,
            sliderInput("init",
                        label = "Initial Amount",
                        min = 1,
                        max = 100000,
                        value = 1000)
     ),
     column(4,
            sliderInput("return",
                        label = "Return Rate (in %)",
                        min = 0,
                        max = 20,
                        value = 5)
     ),
     column(4,
            sliderInput("years",
                        label = "Years",
                        min = 0,
                        max = 50,
                        value = 10)
     )
   ),
   fluidRow(
     column(4,
            sliderInput("cont",
                        label = "Annual Contribution",
                        min = 0,
                        max = 50000,
                        value = 2000)
     ),
     column(4,
            sliderInput("growth",
                        label = "Growth Rate (in %)",
                        min = 0,
                        max = 20,
                        value = 2)
     ),
     column(4,
            selectInput("facet",
                        label = "Facet?",
                        choices = list("No" = FALSE, "Yes" = TRUE),
                        selected = "No")
     )
   ),
   fluidRow(
     h4("Timeline"),
     plotOutput("timeline_plot")
   ),
   fluidRow(
     h4("Balances"),
     verbatimTextOutput("balances")
   )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  
  output$timeline_plot <- renderPlot({
    #' @title future_value
    #' @description Calculates the future value of a principle investment using a annual rate of return and number of years.
    #' @param amount Initial invested amount
    #' @param rate Annual rate of return
    #' @param years Number of years
    #' @return Returns compounded value over years
    future_value <- function(amount, rate, years){
      return(amount*(1+rate)^years)
    }
    
    #' @title annuity
    #' @description Calculates the future value of a principle investment using a annual rate of return and number of years while also adding money every year.
    #' @param contrib Contributed amount
    #' @param rate Annual rate of return
    #' @param years Number of years
    #' @return Returns compounded value over years of adding money.
    annuity <- function(contrib, rate, years){
      return(contrib*(((1+rate)^years)-1)/rate)
    }
    
    #' @title growing_annuity
    #' @description Computes the future value of growing annuity
    #' @param contrib Contributed amount
    #' @param rate Annual rate of return
    #' @param growth Annual growth rate
    #' @param years Number of years
    #' @return Returns compounded value over years of adding money.
    growing_annuity <- function(contrib, rate, growth, years){
      return(contrib*((((1+rate)^years)-((1+growth)^years))/(rate-growth)))
    }
    
    year <- 0:input$years
    no_contrib <- 0:input$years
    fixed_contrib <- 0:input$years
    growing_contrib <- 0:input$years
    amount <- input$init
    contrib <- input$cont
    rate <- input$return/100
    growth <- input$growth/100
    for(i in year){
      no_contrib[i+1] <- future_value(amount, rate, year[i+1])
      fixed_contrib[i+1] <- future_value(amount, rate, year[i+1]) + annuity(contrib, rate, year[i+1])
      growing_contrib[i+1] <- future_value(amount, rate, year[i+1]) + growing_annuity(contrib, rate, growth, year[i+1])
    }
    modalities <- data.frame(year = year, no_contrib = no_contrib, fixed_contrib = fixed_contrib, growing_contrib = growing_contrib)
  print(input$facet)
    if(input$facet == FALSE){  
    return(ggplot(modalities, aes(year)) + geom_line(aes(y = no_contrib, colour = "no_contrib")) + geom_line(aes(y = growing_contrib, colour = "growing_contrib")) + geom_line(aes(y = fixed_contrib, colour = "fixed_contrib")) +
    ggtitle("Three modes of investing") + xlab("Year") + ylab("Value") + labs(colour = "Investment Models"))
  }
  if(input$facet == TRUE){
    df <- melt(modalities, id.vars="year", measure.vars=c("no_contrib", "fixed_contrib", "growing_contrib"))
    return(
      ggplot(df, aes(x=year, y=value)) + geom_line() + facet_wrap(~ variable) +
      ggtitle("Three modes of investing") + xlab("Year") + ylab("Value") + geom_area(aes(fill = variable), alpha = 0.5)
    )
  }
  }) 
  
  # Generate a summary of the dataset ----
  output$balances <- renderPrint({
    #' @title future_value
    #' @description Calculates the future value of a principle investment using a annual rate of return and number of years.
    #' @param amount Initial invested amount
    #' @param rate Annual rate of return
    #' @param years Number of years
    #' @return Returns compounded value over years
    future_value <- function(amount, rate, years){
      return(amount*(1+rate)^years)
    }
    
    #' @title annuity
    #' @description Calculates the future value of a principle investment using a annual rate of return and number of years while also adding money every year.
    #' @param contrib Contributed amount
    #' @param rate Annual rate of return
    #' @param years Number of years
    #' @return Returns compounded value over years of adding money.
    annuity <- function(contrib, rate, years){
      return(contrib*(((1+rate)^years)-1)/rate)
    }
    
    #' @title growing_annuity
    #' @description Computes the future value of growing annuity
    #' @param contrib Contributed amount
    #' @param rate Annual rate of return
    #' @param growth Annual growth rate
    #' @param years Number of years
    #' @return Returns compounded value over years of adding money.
    growing_annuity <- function(contrib, rate, growth, years){
      return(contrib*((((1+rate)^years)-((1+growth)^years))/(rate-growth)))
    }
    
    year <- 0:input$years
    no_contrib <- 0:input$years
    fixed_contrib <- 0:input$years
    growing_contrib <- 0:input$years
    amount <- input$init
    contrib <- input$cont
    rate <- input$return/100
    growth <- input$growth/100
    for(i in year){
      no_contrib[i+1] <- future_value(amount, rate, year[i+1])
      fixed_contrib[i+1] <- future_value(amount, rate, year[i+1]) + annuity(contrib, rate, year[i+1])
      growing_contrib[i+1] <- future_value(amount, rate, year[i+1]) + growing_annuity(contrib, rate, growth, year[i+1])
    }
    modalities <- data.frame(year = year, no_contrib = no_contrib, fixed_contrib = fixed_contrib, growing_contrib = growing_contrib)
    
    modalities
  })
  
}

# Run the application 
shinyApp(ui = ui, server = server)
