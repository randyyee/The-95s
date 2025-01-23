library(shiny)
library(shinythemes)
library(tidyverse)
library(visNetwork)
library(rpivotTable)

MSD <- readRDS("MSD.rds")

shinyServer(function(input, output, session) {
  
  output$network <- renderVisNetwork({
    
    edges2 <- as.data.frame(readxl::read_excel("NinetyFive_Net.xlsx", sheet = 5)) #(to,from)
    nodes2 <- as.data.frame(readxl::read_excel("NinetyFive_Net.xlsx", sheet = 6)) #(id)
    
    
    visNetwork(nodes2, edges2, width = "1000px", height = "1000px") #%>%
      # visOptions(selectedBy = "group",
      #            highlightNearest = list(enabled = T, degree = 2, hover = T))
    
  })
  
  # output$pivotTable <- renderRpivotTable({
  #   MSD <- MSD %>% filter(operatingunit == input$ou)
  #   rpivotTable(MSD)
  # })
  
  observe({
    x <- unique(MSD[MSD$operatingunit==input$ou,"psnu"])
    updateSelectInput(session, "psnu",
                      label = "PSNU",
                      choices = x
    )
  })
  
  
  
  
})
