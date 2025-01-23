library(shiny)
library(shinythemes)
library(tidyverse)
library(visNetwork)

shinyUI(
  navbarPage(theme = shinytheme("paper"), fluid = T,
             "The Ninety-Five's",
             tabPanel("Overview",
                      visNetworkOutput("network"),
                      
                      hr(),
                      
                      fluidRow(
                        column(3,
                               h4(tags$b("Model Parameters")),
                               numericInput('cohort', 'Total PLHIV Cohort', 95),
                               selectInput('cycle_type', 'Cycle Type', c("Quarterly", "Annual"))
                        ),
                        column(3,
                               h4("Geography"),
                               selectInput('ou', 'Operating Unit', c("Angola",
                                                                     "Asia Region",
                                                                     "Botswana",
                                                                     "Burundi",                         
                                                                     "Cameroon",
                                                                     "Cote d'Ivoire",                   
                                                                     "Democratic Republic of the Congo",
                                                                     "Dominican Republic",              
                                                                     "Eswatini",
                                                                     "Ethiopia",                        
                                                                     "Haiti",
                                                                     "Kenya",                           
                                                                     "Lesotho",
                                                                     "Malawi",                          
                                                                     "Mozambique",
                                                                     "Namibia",                         
                                                                     "Nigeria",
                                                                     "Rwanda",                          
                                                                     "South Africa",
                                                                     "South Sudan",                     
                                                                     "Tanzania",
                                                                     "Uganda",                          
                                                                     "Ukraine",
                                                                     "Vietnam",                         
                                                                     "West Africa Region",
                                                                     "Western Hemisphere Region",       
                                                                     "Zambia",
                                                                     "Zimbabwe")),
                               selectInput('psnu', 'PSNU', c('None'))
                        ),
                        column(3,
                               h4("Population"),
                               selectInput('age', 'Age', c("All", "<15", "15+")),
                               selectInput('sex', 'Sex', c("All", "Female", "Male"))
                        ),
                        column(3,
                               h4("About"),
                               p("The Ninety-Five is a decision-making playground. 
                               This program simulation model visualizes patient movement across the HIV care and treatment cascade.
                               Use this tool to test program scenarios and indicator assumptions."),
                               p("Randy Yee (pcx5@cdc.gov)"),
                               p("CDC | GHC | DGHT | HIDMSB")
                               
                        )
                      )
             ), #TABPANEL 1
             tabPanel("Resource Modifications"), #TABPANEL 2
             tabPanel("HTS Tree"), #TABPANEL 3
             tabPanel("TX Chain"), #TABPANEL 4
             tabPanel("VL Branch"), #TABPANEL 5
             tabPanel("TB Branch"), #TABPANEL 6
             tabPanel("CXCA Branch"), #TABPANEL 7
             tabPanel("Results")#, #TABPANEL 8
             # tabPanel("Data",
             #          rpivotTableOutput("pivotTable")
             #          ) #TABPANEL 9
  ) #NAVBARPAGE
) #SHINYUI
