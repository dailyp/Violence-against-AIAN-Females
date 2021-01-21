#Define UI for app ----
ui <- navbarPage(title = "MMIWG Crisis", theme = shinytheme("superhero"),
                 
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
                              
                              hr(),
                              #Input: Death trend, rate or number
                              selectInput("trend", "Trends:",
                                          c("Number of Deaths" = "Num_Deaths",
                                             "(Crude) Rate of Deaths"= "Crude_rate")),
                              
                            ),
                            
                            # Main panel for displaying Death outputs ----
                            mainPanel(
                              plotOutput("us_death2", height = 200),
                              plotOutput("death_trend", height = 200)
                            )
                          )
                 ),
                 
                 tabPanel("Missing", 
                          sidebarLayout(
                            sidebarPanel(
                              hr(),
                              #Input: Missing
                              radioButtons("proportion", "Variations of Proportion:",
                                           c("Proportion of Missing" = "proportion_of_missing",
                                             "Poportion of Race" = "proportion_of_race")),
                             
                              
                            ),
                            
                            # Main panel for displaying Death outputs ----
                            mainPanel(
                              h4("NCIC Missing Person and Unidentified Person, All Genders, 2007-2019"),
                          plotOutput("missing", height = 200),
                          plotOutput("missing_pop", height = 200)),
                          )),
                 
                 tabPanel("Map", 
                         # sidebarLayout(
                         #   sidebarPanel(
                              # Input: U.S. map showing viol deaths & missing
                            
                          #  ),
                            
                            # Main panel for displaying Death outputs ----
                            mainPanel(
                              h4("AIAN Females Violent Death (Suicide & Homicide), 2001-2018,
                                 and AIAN Females Missing/Unidentified/Unclaimed, Jan 4, 2021"),
                              
                              leafletOutput("maps", width = 1000) 
                            )
                          )
                 )
#                 )
                 
#tabPanel("Citations", verbatimTextOutput("citations"))









