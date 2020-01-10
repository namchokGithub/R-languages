library(readr)
library(readxl) # Exel ,spreadsheets
library(haven) # Statustucak packeages
library(dplyr) # Selecting variable
library(tidyr) # reshape data
library(ggplot2) # Graph

# ------------------------------------------------------- #

data(Marriage, package = "mosaicData")

plotdata <- Marriage %>% count(race) %>% mutate(pct = n / sum(n), pctlabel = paste0(round(pct*100), "%")) 

# plot the bars as percentages, 
# in decending order with bar labels 
ggplot(plotdata, aes(x = reorder(race, -pct), y = pct)) + 
    geom_bar(stat = "identity", fill = "indianred3", color = "black") + 
    geom_text(aes(label = pctlabel), vjust = -0.5) + 
    scale_y_continuous(labels = scales::percent) + 
    labs(x = "Race", y = "Percent", title = "Participants by race") + 
    theme(axis.text.x = element_text(angle = 90, hjust = 1)) # Label rolate
