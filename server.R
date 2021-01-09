
# Define server logic for app ----
server <- function(input, output, session) {
    output$dplot <- renderPlot({
        ddata <- xx %>%
            filter(death == input$death) %>%
            filter(metro == input$metro) %>% 
            filter(hispanic == input$hispanic)
        print(data)
        ggplot(ddata, aes(x = race, y = count())) + 
            geom_col()
    })
}

