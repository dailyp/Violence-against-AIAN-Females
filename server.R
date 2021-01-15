

server <- function(input, output, session) {
    output$us_death2 <- renderPlot({
        us_death2 %>%
          filter(Cause_death == input$death) %>%
          filter(Metro_type == input$metro) %>%
            # filter(hispanic == input$hispanic)
        ggplot(aes(x = Race, y = Crude_rate)) +
            geom_col()
    })
    
    # output$us_death2 <- renderPlot({
    #   us_death2 %>%
    #     filter(Cause_death == input$death) %>%
    #     #filter(Metro_type == input$metro) %>%
    #     # filter(hispanic == input$hispanic)
    #     ggplot(aes(x = Race, y = Crude_rate)) +
    #     geom_col()
    # })
}


