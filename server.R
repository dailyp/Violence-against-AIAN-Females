
server <- function(input, output, session) {
    output$us_death2 <- renderPlot({
        us_death2 %>%
            filter(Cause_death == input$death) %>%
            filter(Metro_type == input$metro) %>%
            ggplot(aes(x = Race, y = .data[[input$trend]], fill = Race)) +
            geom_bar(stat = "identity")+
            scale_fill_hue(l=40, c=35)
            #scale_fill_brewer(palette = "YlOrBr")
            #scale_fill_manual(values=wes_palette(n=3, name="GrandBudapest"))
    })
    
    output$death_trend <- renderPlotly({
        us_death2 %>%
            filter(Cause_death == input$death) %>%
            filter(Metro_type == input$metro) %>%
            ggplot(aes(x = Year, y = .data[[input$trend]], color = Race)) +
            geom_line()+
            scale_color_hue(l=40, c=35)

    })
    
    #output$missing <- renderPlot({
        # ncic_proport %>% 
        #     ggplot(aes(x=Year, y=Percentage, fill=Race)) + 
        #     geom_area(alpha=0.6, size=1)+
        #     scale_fill_brewer(palette = "Dark2")
    #})
    
    output$missing_pop <- renderPlotly({
        ncic_pop_proport2 %>% 
            ggplot(aes(x = Year, y = .data[[input$proportion]], color = Race)) +
            geom_line()+
            scale_color_hue(l=40, c=35)
            #scale_fill_brewer(palette = "Dark2")
    })
    
    output$map <- renderPlotly({
            df_dmuu$hover <- with(df_dmuu, paste(state, '<br>'))
        
            l <- list(color = toRGB("white"), width = 1)
            
            g <- list(
                scope = 'usa',
                projection = list(type = 'albers usa'),
                showlakes = TRUE,
                lakecolor = toRGB('white')
            )
            
            fig <- plot_geo(df_dmuu, locationmode = 'USA-states')
            fig <- fig %>% add_trace(
                z = ~value, text = ~hover, locations = ~code,
                color = ~value, colorscale = 'scl'
            )
            fig <- fig %>% colorbar(title = "Count by State")
            fig <- fig %>% layout(
                title = '',
                geo = g
            )
            fig
            
    })
    
    output$map_pop <- renderPlotly({
        aian_census19_map$hover <- with(aian_census19_map, paste(state, '<br>'))
        
        l <- list(color = toRGB("white"), width = 1)

        g <- list(
            scope = 'usa',
            projection = list(type = 'albers usa'),
            showlakes = TRUE,
            lakecolor = toRGB('white')
        )
        
        fig <- plot_geo(aian_census19_map, locationmode = 'USA-states')
        fig <- fig %>% add_trace(
            z = ~value, text = ~hover, locations = ~code,
            color = ~value, colors = 'Greens'
        )
        fig <- fig %>% colorbar(title = "Population")
        fig <- fig %>% layout(
            title = '',
            geo = g
        )
        
        fig
        
    })
    
}


