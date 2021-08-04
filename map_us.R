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


# lets plot US
p <- ggplot() + geom_polygon( data=states, aes(x=long, y=lat, group = group), colour="black", fill="white" , size=0.2)
p <- p + theme(axis.title.x=element_blank(),
              axis.text.x=element_blank(),
              axis.ticks.x=element_blank())
p


p <- p + geom_polygon( data=states, aes(x=long, y=lat, group = group),colour="black", fill="white" , size=0.2)
p <- p + geom_polygon( data=mn, aes(x=long, y=lat, group = group),colour="black", fill="white" , size=0.05)
# p <- p + geom_segment(aes(x=X1, y=Y1, xend = X2, yend = Y2), data=edge, size = 0.25, colour="grey") + geom_point( data=subset(attr, type != "Feed" |  type != "Office" |  type != "Truckwash" ), aes(x=long,y=lat), size=0.5) + labs(x = "Longitude", y = "Latitude") + theme_bw() + theme(panel.grid.major=element_line(colour="black", size=0.05)) 
p <- p + theme(axis.text.x=element_text(size=8), axis.text.x = element_text(size=10))
p <- p + theme(axis.text.y=element_text(size=8), axis.text.y = element_text(size=10))

p


# tiff ("Fig1.tiff", width = 6, height = 4, units = 'in', res = 300, compression = 'lzw')
# p
# dev.off ()
