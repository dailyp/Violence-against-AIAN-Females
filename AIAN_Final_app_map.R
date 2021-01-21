library(plotly)
df <- read.csv("https://raw.githubusercontent.com/plotly/datasets/master/2011_us_ag_exports.csv")
view(df)
df_dmuu <- read_csv("data/comb_df_map.csv")

df_dmuu <- df_dmuu %>% 
  rename(state = "State")
view(df_dmuu)

df_dmuu <- df_dmuu  %>% 
  inner_join(df) %>% 
  select("code", "state", "value", "category")

df_dmuu$hover <- with(df_dmuu, paste(state, '<br>'))

# df$hover <- with(df, paste(state, '<br>', "Beef", beef, "Dairy", dairy, "<br>",
#                            "Fruits", total.fruits, "Veggies", total.veggies,
#                            "<br>", "Wheat", wheat, "Corn", corn))
# give state boundaries a white border
l <- list(color = toRGB("white"), width = 2)
# specify some map projection/options
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

df_dmuu %>% 
  write_csv("final_death_missing_map.csv")
