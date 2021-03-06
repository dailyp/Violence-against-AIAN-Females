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
                                          c("Number of Deaths" = "Deaths",
                                             "(Crude) Rate of Deaths"= "Rate")),
                              
                            ),
                            
                            # Main panel for displaying Death outputs ----
                            mainPanel(
                              h4("CDC Violent Deaths of Females by Race (non-Hisp) and Metro, 2001-2018"),
                              plotOutput("us_death2", height = 200),
                              plotlyOutput("death_trend", height = 200)
                            )
                          )
                 ),
                 
                 tabPanel("Missing", 
                          sidebarLayout(
                            sidebarPanel(
                              hr(),
                              #Input: Missing
                              radioButtons("proportion", "Variations of Proportion:",
                                           c("Proportion of Missing" = "Proportion of Missing",
                                             "Proportion of Race" = "Proportion of Race")),
                             
                              
                            ),
                            
                            # Main panel for displaying Death outputs ----
                            mainPanel(
                              h4("NCIC Missing Person and Unidentified Person, All Genders, 2007-2019"),
                          #plotOutput("missing", height = 200),
                          plotlyOutput("missing_pop", height = 200)),
                          )),
                 
                 tabPanel("Map", 
                         # sidebarLayout(
                         #   sidebarPanel(
                              # Input: U.S. map showing viol deaths & missing
                            
                          #  ),
                            
                            # Main panel for displaying Death outputs ----
                            mainPanel(
                              h4("CDC AIAN Females Violent Death, 2001-2018,
                                 and NamUs Missing/Unidentified/Unclaimed, Jan 2021"),
                              
                              plotlyOutput("map"),
                              hr(),
                              h4("US Census AIAN 2019 Population by State"),
                              plotlyOutput("map_pop")) 
                            )
                          )
                 
#                 )
                 
#tabPanel("Citations", verbatimTextOutput("citations"))









