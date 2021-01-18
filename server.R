
server <- function(input, output, session) {
    output$us_death2 <- renderPlot({
        us_death2 %>%
            filter(Cause_death == input$death) %>%
            filter(Metro_type == input$metro) %>%
            # filter(hispanic == input$hispanic)
            ggplot(aes(x = Race, y = Crude_rate)) +
            geom_col()
    })
    
    output$death_trend <- renderPlot({
        us_death2 %>%
            filter(Cause_death == input$death) %>%
            filter(Metro_type == input$metro) %>%
            ggplot(aes(x = Year, y = .data[[input$trend]], color = Race)) +
            geom_line()
    })
    
     
    
    output$maps <- renderPlot({
        viol_death_map %>% 
            state_choropleth(viol_death_map, 
                             num_colors=9) +
            scale_fill_brewer(palette="YlOrRd") +
            labs(title = "AIAN Female Violent Deaths by State, 2001-2018",
                 #subtitle = "",
                 caption = "source: CDC",
                 fill = "Events")
    })
    

}


