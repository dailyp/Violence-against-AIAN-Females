
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
    output$maps <- renderLeaflet({
        df_dmuu <- read.csv("data/comb_df_map.csv")
        US_state <- st_read(
            "data/cb_2018_us_state_5m/cb_2018_us_state_5m.shp")
        shp_df_dmuu <-  merge(US_state, df_dmuu, by.x="NAME",   by.y='State')
        
        
        bins <- c(0, 10, 20, 50, 100, 200, 500, 1000, Inf)
        pal <- colorBin("YlOrRd", domain = shp_df_dmuu$value, bins = bins)

        labels <- sprintf(
            "<strong>%s</strong><br/>%g people </sup>",
            shp_df_dmuu$NAME,shp_df_dmuu$value
        ) %>% lapply(htmltools::HTML)
        
        leaflet(shp_df_dmuu) %>%
            setView(-96, 37.8, 4) %>%
            #addTiles() %>% 
            addProviderTiles("MapBox", options = providerTileOptions(
                id = "mapbox.light",
                accessToken = Sys.getenv('MAPBOX_ACCESS_TOKEN')))%>% 
            addPolygons(
                
                fillColor = ~pal(value),
                weight = 2,
                opacity = 1,
                color = "white",
                dashArray = "3",
                fillOpacity = 0.7,
                label = labels,
                labelOptions = labelOptions(
                    style = list("font-weight" = "normal", padding = "3px 8px"),
                    textsize = "15px",
                    direction = "auto")
            ) %>% 
            addLegend(pal = pal, values = ~value, opacity = 0.7, title = NULL,
                      position = "bottomright")
    })
    

}


