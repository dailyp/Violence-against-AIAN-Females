
server <- function(input, output, session) {
    output$us_death2 <- renderPlot({
        us_death2 %>%
            filter(Cause_death == input$death) %>%
            filter(Metro_type == input$metro) %>%
            # filter(hispanic == input$hispanic)
            ggplot(aes(x = Race, y = .data[[input$trend]], fill = Race)) +
            geom_bar(stat = "identity")+
            scale_fill_brewer(palette = "Dark2")
    })
    
    output$death_trend <- renderPlot({
        us_death2 %>%
            filter(Cause_death == input$death) %>%
            filter(Metro_type == input$metro) %>%
            ggplot(aes(x = Year, y = .data[[input$trend]], color = Race)) +
            geom_line()+
            scale_color_brewer(palette = "Dark2")
    })
    
    output$missing <- renderPlot({
        ncic_proport %>% 
            ggplot(aes(x=Year, y=Percentage, fill=Race)) + 
            geom_area(alpha=0.6, size=1)+
            scale_fill_brewer(palette = "Dark2")
    })
    
    output$missing_pop <- renderPlot({
        ncic_stacked %>% 
            ggplot(aes(x = Year, y = Count, fill = Race)) +
            geom_area(alpha=0.6 , size=1)+
            scale_fill_brewer(palette = "Dark2")
    })
    
    output$map <- renderPlot({
        # df <- read.csv("https://raw.githubusercontent.com/plotly/datasets/master/2011_us_ag_exports.csv")
        # df_dmuu <- read_csv("data/comb_df_map.csv")
        # 
        # df_dmuu <- df_dmuu %>% 
        #     rename(state = "State")
        # 
        # df_dmuu <- df_dmuu  %>% 
        #     inner_join(df) %>% 
        #     select("code", "state", "value", "category")
        # 
        #df_dmuu$hover <- with(df_dmuu, paste(state, '<br>'))
        df_dmuu %>%
            l <- list(color = toRGB("white"), width = 2)
            
            g <- list(
                scope = 'usa',
                projection = list(type = 'albers usa'),
                showlakes = TRUE,
                lakecolor = toRGB('white')
            )
            
            fig <- plot_geo(df_dmuu, locationmode = 'USA-states')
            fig <- fig %>% add_trace(
                z = ~value, text = ~hover, locations = ~code,
                color = ~value, colors = 'Purples'
            )
            fig <- fig %>% colorbar(title = "Violent Deaths, Missing")
            fig <- fig %>% layout(
                title = 'Violent Deaths and Missing by State<br>(Hover for breakdown)',
                geo = g
            )
            fig
            
    })
    
}


