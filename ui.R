#Define UI for app ----
ui <- navbarPage(title = "MMIWG Crisis",
                 
                 tabPanel("Violent Deaths",
                          sidebarLayout(
                              sidebarPanel(
                                  # Input: type of death  ----
                                  radioButtons("death",
                                               "Type of Violent Death:",
                                               c("Homicide" = "homicide",
                                                 "Suicide" = "suicide",
                                                 "Both" = "bothdeath")),
                                  
                                  hr(),
                                  #Input: Metro or NonMetro
                                  radioButtons("metro", "Metro or Non-metro:",
                                               c("Metro" = "Metro",
                                                 "Non Metro" = "Non Metro",
                                                 "All Metros" = "All Metros")),
                                  
                                  #hr(),
                                  #Input: Hispanic combined and separated 
                                  #radioButtons("hispanic", "Show Hispanic vs Non Hispanic:",
                                               #c("Hispanic" = "hispanic",
                                                 #"Not Hispanic" = "nothispanic")),
                                  
                                  
                                  hr(),
                                  #Apply Filter Button
                                  actionButton("apply_filter", "Apply Filter")
                              ),
                              
                              # Main panel for displaying Death outputs ----
                              mainPanel(
                                  plotOutput("us_death2")
                              )
                          )
                 ),
                 
                 tabPanel("Missing", plotOutput("missing")),
                 tabPanel("Map", plotOutput("map")),
                 tabPanel("Citations", verbatimTextOutput("citations"))
)







