library(shiny) 
ui <-fluidPage(
  numericInput(inputId = "n","Sample Size",
               value=50),
  plotOutput(outputId = "hist")
)

server <-function(input,output){
  output$hist <-renderPlot({
    hist(rnorm(input$n,mean=0,sd=sqrt(1)/input$n),col=rainbow(25),
         xlim = c(-0.05,0.05),
         main = "Sampling Distribution and Sample Size", 
         xlab = "Sample Means")
  })
}

shinyApp(ui,server)