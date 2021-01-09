
#Consider navbarpage
# ui <- navbarPage("My Application",
#                  tabPanel("Component 1"),
#                  tabPanel("Component 2"),
#                  tabPanel("Component 3")
# Define UI for app ----
ui <- fluidPage(
    
    # App title ----
    titlePanel("Crisis: American Indian and Alaskan Native (AIAN) Women and Girls Missing or Murdered"),
    
    # Sidebar layout with input and output definitions ----
    sidebarLayout(
        
        # Sidebar panel for inputs ----
        sidebarPanel(
            
            # Input: Select the race type ----(block for now)
            # radioButtons("race", "Race:",
            #              c("AIAN" = "aian",
            #                "Asian" = "asian",
            #                "Black" = "black",
            #                "Hawaiian_Pacific" = "hpi",
            #                "White" = "white")),
            
            # hr() element to introduce extra horizontal spacing ----
            #hr(),
            
            # Input: type of death  ----
            radioButtons("death",
                        "Type of Violent Death:",
                        c("Homicide" = "homicide",
                        "Suicide" = "suicide",
                        "Both" = "bothdeath")),
            
            hr(),
            #Input: Metro or NonMetro
            radioButtons("metro", "Metro or Non-metro:",
                         c("Metro" = "metro",
                           "NonMetro" = "nonmetro",
                           "Both" = "bothmetro")),
            
            hr(),
            #Input: Hispanic combined and separated 
            radioButtons("hispanic", "Show Hispanic vs Non Hispanic:",
                         c("Hispanic" = "hispanic",
                           "Not Hispanic" = "nothispanic")),
            
        
            hr(),
            #Apply Filter Button
            actionButton("apply_filter", "Apply Filter")
    ),
        
        # Main panel for displaying Death outputs ----
        mainPanel(
            
            # Output: Tabset w/ plot  ----
            tabsetPanel(type = "tabs",
                        tabPanel("Deaths", plotOutput("deaths")),
                        tabPanel("Missing", plotOutput("missing")),
                        tabPanel("Map", plotOutput("map")),
                        tabPanel("Citations", verbatimTextOutput("citations"))
            )
            
        )
    )
)
