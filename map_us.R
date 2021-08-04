library(igraph)
library(EpiContactTrace)
library(RColorBrewer)
library(ggplot2)
library(maps)
library(doBy)
library(plyr)

# get all states from USA
all_states <- map_data("state")
# exclude alaska and hawaii
states <- subset(all_states, region %in% c( "illinois",
                                            "indiana", "iowa", 
                                            "kentucky", "michigan", 
                                            "minnesota","missouri", "north dakota",
                                            "ohio", "south dakota", "wisconsin", "nebraska",
                                            "kansas","colorado","tennessee","north carolina",
                                            "south carolina" ,"oklahoma","georgia","texas",
                                            "new mexico", "wyoming", "virginia", "west virginia",
                                            "alabama","pennsylvania","maryland","new jersey",
                                            "arkansas","louisiana","florida","mississippi",
                                            "new york","connecticut","rhode island",
                                            "massachusetts","vermont","new hampshire","maine",
                                            "montana", "washington","oregon", "idaho","california",
                                            "nevada","utah","arizona") )

# get county data
county_df <- map_data('county')
# select a specific state (e.g., Minnesota) with its counties
mn <- subset(county_df, region=="minnesota") # Counties in Minnesota


# 1) let's plot US
p <- ggplot() + geom_polygon( data=states, aes(x=long, y=lat, group = group), 
                              colour="black", fill="white" , size=0.2)
p <- p + theme_void()
p


# 2) let's add the counties of a specific state (e.g., counties of Minnesota)
p <- ggplot() + geom_polygon( data=states, aes(x=long, y=lat, group = group), 
                              colour="black", fill="white" , size=0.2)
p <- p + geom_polygon( data=mn, aes(x=long, y=lat, group = group),
                       colour="black", fill="white" , size=0.05)
p <- p + theme_void()
p


# 3) let's stress a state and add its counties  (e.g., counties of Minnesota)
p <- ggplot() + geom_polygon( data=states, aes(x=long, y=lat, group = group), 
                              colour="black", fill="white" , size=0.2)
p <- p + geom_polygon( data=mn, aes(x=long, y=lat, group = group),
                       colour="black", fill="white" , size=0.05)
p <- p + geom_polygon(data= subset(states, region == "minnesota"), 
                      aes(x=long, y=lat, group = group),
                      colour="red", fill="transparent" , size=0.5)
p <- p + theme_void()
p


# 4) let's stress a state  (e.g., counties of Minnesota)
p <- ggplot() + geom_polygon( data=states, aes(x=long, y=lat, group = group), 
                              colour="black", fill="white" , size=0.2)
p <- p + geom_polygon(data= subset(states, region == "minnesota"), 
                      aes(x=long, y=lat, group = group),
                      colour="red", fill="green" , size=0.5)
p <- p + theme_void()
p




# 5) Save the map in high resolution
# tiff ("Fig1.tiff", width = 6, height = 4, units = 'in', res = 300, compression = 'lzw')
# p
# dev.off ()
