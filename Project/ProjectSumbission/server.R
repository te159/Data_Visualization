library(shiny)
library(ggplot2)

shinyServer(function(input, output) {
  
  ##To show a uploaded data
  output$contents <- renderTable({
    
    inFile <- input$file1
    
    if (is.null(inFile))
      return(NULL)
    
    read.csv(inFile$datapath, header = input$header)
  })
  
  #to get a first plot
  output$text1<-renderText(input$sliderSmoke)
  
  options(scipen = 999)
  
  Project <- data.frame(read.csv(file =  'C:/Users/Talal/Documents/GitHub/Data_Visualization/Project/Regression_Model/selecteddata2.csv') , header = TRUE,  stringsAsFactors = FALSE)
  
  
  State <- c (Project[,1])
  city <- c (Project[,2])
  PlaceFIPS <- c (Project[,3])
  population <- c (Project[,4])
  ppl_No_Insurance <- c (Project[,5])
  ppl_BPHIGH_age_adjusted_prevalence <- c (Project[,6])
  ppl_Cancer_age_adjusted_prevalence <- c (Project[,7])
  ppl_Asthma_age_adjusted_prevalence <- c (Project[,8])
  ppl_Smoking_age_adjusted_Prevalence <- c (Project[,9])
  ppl_Diabetes_age_adjusted_prevalence <-  c (Project[,10])
  ppl_Stroke_age_adjusted_prevalence <-  c (Project[,11])
  
  
  model1 <- lm(ppl_Stroke_age_adjusted_prevalence ~ ppl_Smoking_age_adjusted_Prevalence,
               data=Project) 
  
  resid <- resid(model1) 
  
  prediction1 <- reactive({
    
    predict(model1, newdata = data.frame(ppl_Smoking_age_adjusted_Prevalence = input$sliderSmoke))
    
  }) 
  
  
  ##To get a second plot
  output$plot1 <- renderPlot({
    
    plot( ppl_Smoking_age_adjusted_Prevalence, ppl_Stroke_age_adjusted_prevalence, 
          xlab = "ppl_smoking_age_adjusted_Prevalence", 
          ylab = "ppl_Stroke_age_adjusted_prevalence", 
          bg = "lightblue", col = "black", cex = 1, pch = 21, frame = FALSE,  
          main="Prediction summary for the residual plot of age adjusted prevalance of smoking among people and age adjusted prevalance of Stroke among people"
          ,cex.main=1.0)
    
    abline(model1, col="red", lwd=2)
    
    points(input$sliderSmoke, prediction1(), col = "blue", pch = 16, cex = 2)
  }) 
  
  output$prediction1 <- renderText({
    prediction1()
    
    
  })
  output$text2<-renderText(input$sliderPop*1000)
  
  model2 <- lm(ppl_Cancer_age_adjusted_prevalence ~ population,
               data=Project) 
  
  resid <- resid(model2) 
  
  prediction2 <- reactive({
    
    predict(model2, newdata = data.frame(population = input$sliderPop))
    
  }) 
  output$plot2 <- renderPlot({
    
    plot( population, ppl_Cancer_age_adjusted_prevalence, 
          xlab = "population", 
          ylab = "ppl_cancer_age_adjusted_prevalence", 
          bg = "lightblue", col = "black", cex = 1, pch = 21, frame = FALSE,  
          main="Prediction summary for the residual plot of population and age adjusted prevalance of cancer among people"
          ,cex.main=1.0)
    
    abline(model2, col="red", lwd=2)
    
    points(input$sliderPop , prediction2(), col = "blue", pch = 16, cex = 2)
  }) 
  
  output$prediction2 <- renderText({
    prediction2()
  })
 
  
})





