#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Data analysis of age adjusted prevalnce of Smoking and age_adjusted prevalance of stroke among prople"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
    h1("Move the slider"), 
    sliderInput("sliderSmoke","Choose Smoking prevalance(x)",8.5, 30.9, value = 10),
    
    h3("Smoking rate:"),
    textOutput("text1")
  
     ),
    
    # Show a plot of the generated distribution
    mainPanel(
    
      
      plotOutput("plot1"),
      
      h2("Prediction"),
      textOutput("prediction1"),
      br()
      
  ))
))
