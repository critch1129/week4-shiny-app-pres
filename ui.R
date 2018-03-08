library(shiny); library(caret); library(tidyverse); library(plotly); library(e1071)

shinyUI(pageWithSidebar(
  headerPanel("Predict Iris Species with LDA"),
  sidebarPanel(
    sliderInput("sep_L", label = h3("Sepal Length"), min = 4, max = 8, value = 5.8, step = 0.1),
    sliderInput("sep_W", label = h3("Sepal Width"), min = 2, max = 5, value = 3.0, step = 0.1),
    sliderInput("pet_L", label = h3("Petal Length"), min = 1, max = 7, value = 3.7, step = 0.1),
    sliderInput("pet_W", label = h3("Petal Width"), min = 0.1, max = 3, value = 1.2, step = 0.1),
    submitButton("Predict!")
  ),
  mainPanel(
    h2('Sepal and Petal Predictions'),
    h4('You entered'),
    verbatimTextOutput("sep_L"),
    textOutput("text1"),
    verbatimTextOutput("sep_W"),
    verbatimTextOutput("pet_L"),
    verbatimTextOutput("pet_W"),
    h4('Which resulted in this Species'),
    verbatimTextOutput("prediction"),
    plotlyOutput("plot1"))
    
))
