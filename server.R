
# Define server logic for app ----
server <- function(input, output, session) {
    output$us_death2 <- renderPlot({
        ddata <- us_death2 %>%  
            # filter(death == input$death) %>%
             #filter(metro == input$metro) %>% 
            # filter(hispanic == input$hispanic)
        ggplot(ddata, aes(x = Race, y = .data[[input$metro]])) + 
            geom_col()
    })
}

