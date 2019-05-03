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
  titlePanel("Data analysis of Chronic desease and health Promotion data"),
  h5("Smoking is the main risk factor for many diseases; In this project, we would like to study the smoking effect (Asthma,

        high blood pressure, Stroke) , Data used provided by the Centers for Disease Control and Prevention (CDC), Division of Population Health, Epidemiology
        
        and Surveillance Branch. With this model we used the smoking data 
        to predict the occurrence of other diseases such as Hypertension, Asthma, and Stroke. after models compared and analyzed, we found that stroke has a higher prevalence 
        rate among smokers compared to the other diseases ."),
  
  h4("Souce of the data:"),
  h5("https://chronicdata.cdc.gov/500-Cities/500-Cities-City-level-Data-GIS-Friendly-Format-201/dxpw-cm5u"),
  
  
  # Sidebar with a slider input 
  sidebarLayout(
    
    
    sidebarPanel(
      
      h3("Upload a csv file used for the analysis") ,
      fileInput("file1", "Choose CSV File",
                accept = c(
                  "text/csv",
                  "text/comma-separated-values,text/plain",
                  ".csv")
      ),
      tags$hr(),
      checkboxInput("header", "Header", TRUE),
      
      
      h3("Move the slider"), 
      sliderInput("sliderSmoke","Choose Smoking prevalance(x)",8.5, 30.9, value = 10),
      
      h4("Smoking rate:"),
      textOutput("text1"),
      
      
      h3("Move the slider"), 
      sliderInput("sliderPop","Choose population(x)",42, 8154190, value = 43),
      
      h4("population:"),
      textOutput("text2")
      
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      
      tableOutput("contents"),
      
      plotOutput("plot1"),
      
      h2("Prediction1"),
      textOutput("prediction1"),
      div(" Model Interpretation: ", style = "color:blue ; font-si18pt" ) ,
      
      p("we found this as a good fit because we got adjusted R^2 is greater than others two and close to 1.  Values of Residual standard error: 0.4181 on 497, degrees of freedom
,Multiple R-squared: 0.6987, adjusted R-squared: 0.6975, F-statistic: 576.4 on 2 and 497 DF, p-value: < 2.2e-16, R^2 is 0.6987. It means data variability in this data is good that is 69.87%", style = "font-family: 'times'; font-si16pt"),
             h4("Coefficients Analysis:"),
           h4(" Estimate  Std.Error  t value Pr(>|t|)   ") ,
           h4("(Intercept) -0.232705   0.123020  -1.892   0.0591 .") , 
         h4("x  0.112247   0.005436  20.650   <2e-16 ***") ,
h4("ppl_BPHIGH_age_adjusted_prevalence 0.046371   0.004982   9.307   <2e-16 ***") ,
         
         
         h4("The intercept is the grand mean of stroke rate , calculated for all data regardless of smoking rate=0, here it is -0.232705"),
         h4("The data here shows that the coefficients for x (smoking rate) is 0.112247.  The coefficient indicates that for every additional 
         prevalence of smoke ,you can expect stroke prevalence increase by an average of 0.112247 keeping  ppl_BPHIGH_age_adjusted_prevalence 
         as constant."),
         h4("The p-value for x is less than <2e-16 here . A very small value means that x is probably an excellent addition to this model.
         "),
      
    
      
      plotOutput("plot2"),
      
      h3("prediction2"),
      textOutput("prediction2"),

h2("Question:what is the prevalence rate of cancer disease  among population?"),
h4("The data here shows that the coefficients for x (population) is -0.00000012459.  The coefficient indicates that for every additional population, you can expect cancer 
   prevalence decreases by an average of -0.00000012459, as it is negative value.")


    ))
  ))

