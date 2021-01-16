#Define UI for app ----
ui <- navbarPage(title = "MMIWG Crisis",
                 
                 tabPanel("Violent Deaths",
                          sidebarLayout(
                            sidebarPanel(
                              # Input: type of death  ----
                              radioButtons("death",
                                           "Type of Violent Death:",
                                           c("Homicide" = "Homicide",
                                             "Suicide" = "Suicide",
                                             "Both" = "All Violent Deaths")),
                              
                              hr(),
                              #Input: Metro or NonMetro
                              radioButtons("metro", "Metro or Non-metro:",
                                           c("Metro" = "Metro",
                                             "Non Metro" = "Non Metro",
                                             "All Metros" = "All Metros")),
                              
                            ),
                            
                            # Main panel for displaying Death outputs ----
                            mainPanel(
                              plotOutput("us_death2", height = 200) 
                            )
                          )
                 ),
                 
                 tabPanel("Missing", plotOutput("missing")),
                 
                 tabPanel("Map", 
                          sidebarLayout(
                            sidebarPanel(
                              # Input: U.S. map showing viol deaths & missing
                              radioButtons("death",
                                           "Type of Violent Death:",
                                           c("Homicide" = "Homicide",
                                             "Suicide" = "Suicide",
                                             "Both" = "All Violent Deaths")),
                              
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
                              
                            ),
                            
                            # Main panel for displaying Death outputs ----
                            mainPanel(
                              #plotOutput("us_death2", height = 200) 
                            )
                          )
                 ))
                 #plotOutput("map"))
#tabPanel("Citations", verbatimTextOutput("citations"))









