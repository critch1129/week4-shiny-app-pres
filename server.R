library(shiny); library(caret); library(tidyverse); library(plotly); library(e1071)

mod_lda <- train(Species ~ ., data = iris, method = "lda") 
irisPredict <- function(sep_L, sep_W, pet_L, pet_W)
  predict(mod_lda, data.frame("Sepal.Length" = sep_L, "Sepal.Width" = sep_W, "Petal.Length" = pet_L, "Petal.Width" = pet_W))    

shinyServer(function(input, output, session) {
  output$sep_L <- renderPrint({input$sep_L})
  output$sep_W <- renderPrint({input$sep_W})
  output$pet_L <- renderPrint({input$pet_L})
  output$pet_W <- renderPrint({input$pet_W})
  output$prediction <- renderPrint({irisPredict(as.numeric(input$sep_L), 
                                                  input$sep_W, input$pet_L,
                                                  input$pet_W)
    })
  
  output$plot1 <- renderPlotly({
    p <- iris %>%
      gather(key = flower_part, value = measure, -Species) %>%
      ggplot(aes(x = Species, y = measure, color = Species))+
      geom_boxplot()+
      facet_wrap(~flower_part)+
      xlab("")+
      ylab("")+
      ggtitle("Boxplot of Iris Species by Measurement")
    
    ggplotly(p)
    
    })
  
})
