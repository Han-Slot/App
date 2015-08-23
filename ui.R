library(shiny)

shinyUI(fluidPage(
  
  titlePanel("Exponentially damped Sine wave"),
  
  sidebarLayout(
    sidebarPanel(
     
      sliderInput("range", "Choose time-interval to be plotted:",
                  min = 0, max = 100, value = c(20,50)),
      
      sliderInput("a", "Choose damping strength:",
                  min = 0, max = 0.5, value = 0.1),
      
      sliderInput("w", "Choose frequency:", 0, 10, 1,
                  step = 0.1, animate=animationOptions(interval=500, loop=TRUE)),
      
      helpText("Note: to perform a frequency sweep just push the arrow button below.")
      
      ),
  
    mainPanel(
      tabsetPanel(type = "tabs",
                  tabPanel(h3("Documentation"), 
                  br(), 
                  h4("With this app one can 
                  display an exponentially 
                  damped Sine wave and investigate 
                  how its shape changes with 
                  frequency and damping strength."), 
                  h4("In addition, one can select 
                  the time-interval over 
                  which the wave is plotted 
                  and either choose a fixed 
                  frequency or perform a 
                  frequency sweep."), 
                  br(),
                  h4("The exponentially damped 
                  Sine wave is described by the function:"), 
                  br(),
                  h3(span("f(t; a, w) = exp[- a*t] sin[w*t]", 
                  style = "color:blue")), 
                  br(), 
                  h4("with damping strength", 
                  span("a > 0", style = "color:red"), 
                  " and frequency", span("w > 0", 
                  style = "color:red"))),
                  tabPanel(h3("Plot"), plotOutput("plot")), 
                  tabPanel(h3("Summary"), tableOutput("values"))
      )
    )
  )
))