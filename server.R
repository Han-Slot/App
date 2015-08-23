library(shiny)

shinyServer(function(input, output) {
  
  sliderValues <- reactive({
    
    data.frame(
      Name = c("Time-interval",
               "Frequency", "Damping strength"),
      Value = as.character(c(paste(input$range, collapse=' - '),
                             input$w, input$a)), 
      stringsAsFactors=FALSE)
  })
  
  output$plot <- renderPlot({
    w <- input$w
    a <- input$a
    t1 <- input$range[1]
    t2 <- input$range[2]
    
    curve(exp(-a*t)*sin(w*t), from = t1, to = t2, xname = "t", n = 2000)
    
  })
  
  output$values <- renderTable({
    sliderValues()
  })
})