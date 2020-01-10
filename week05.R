library(readr)
library(readxl) # Exel ,spreadsheets
library(haven) # Statustucak packeages
library(dplyr) # Selecting variable
library(tidyr) # reshape data
library(ggplot2) # Graph
library(treemapify) # Tree map
library(scales) # Percent.

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
    theme(axis.text.x = element_text(angle = 47, hjust = 1)) # Label rolate

# Pie chart #
plotdata <- Marriage %>% count(race) %>% 
    arrange(desc(race)) %>%                     # desc = sort by column
    mutate(prop = round(n * 100 / sum(n), 1),   # find percent
           lab.ypos = cumsum(prop) - 0.5 *prop) 

ggplot(plotdata, aes(x = "", y = prop, fill = race)) + 
    geom_bar(width = 1, stat = "identity", color = "black") + 
    coord_polar("y", start = 0, direction = -1) + 
    labs(title = "Participants by race")+
    theme_void()+
    theme(plot.title = element_text(hjust = 0.5))

# create a pie chart with slice labels 
plotdata <- Marriage %>% 
    count(race) %>% 
    arrange(desc(race)) %>%
    mutate(prop = round(n*100/sum(n), 1), lab.ypos = cumsum(prop) - 0.5*prop) 

plotdata$label <- paste0(plotdata$race, "\n",round(plotdata$prop), "%") 

ggplot(plotdata, aes(x = "", y = prop, fill = race)) + 
    geom_bar(width = 1, stat = "identity", color = "black", 
             fill = c("blue", "green", "yellow", "red")) + 
    coord_polar("y", start = 0,direction = -1) + theme_void() + 
    theme(legend.position = "TRUE") +
    geom_text(aes(y = lab.ypos, label = label),  
              color = c("red", "blue", "green", "yellow")) +
    labs(title = "Participants by race")+
    theme(plot.title = element_text(hjust = 0.5))




# Tree map
library(treemapify) 

# create a treemap of marriage officials 

plotdata <- Marriage %>% count(officialTitle) 

ggplot(plotdata, aes(fill = officialTitle, area = n)) + 
    geom_treemap() + 
    labs(title = "Marriages by officiate") 

# create a treemap with tile labels 

ggplot(plotdata, aes(fill = officialTitle, area = n, label = paste0(officialTitle, "\n", n, " persons"))) +
    geom_treemap() + 
    geom_treemap_text(colour = "white", place = "centre") + 
    labs(title = "Marriages by officiate") + 
    theme(legend.position = "none")


# Histogram

# plot the age distribution using a histogram 
ggplot(Marriage, aes(x = age)) + 
    geom_histogram() + 
    labs(title = "Participants by age", x = "Age")

# plot the histogram with blue bars and white borders 
ggplot(Marriage, aes(x = age)) + 
    geom_histogram(fill = "cornflowerblue", color = "white") + 
    labs(title="Participants by age", x = "Age") 

# plot the histogram with 20 bins 
ggplot(Marriage, aes(x = age)) + 
    geom_histogram(fill = "cornflowerblue", color = "green", bins = 30) + 
    labs(title="Participants by age", subtitle = "number of bins = 30", x = "Age")
# bins = range

# plot the histogram with a binwidth of 5  and show percent
ggplot(Marriage, aes(x = age, y =  ..count.. / sum(..count..))) + 
    geom_histogram(fill = "cornflowerblue", color = "white", binwidth = 3) + 
    labs(title="Participants by age", subtitle = "binwidth = 3 years", x = "Age") + 
    scale_y_continuous(labels = scales::percent)
# binwidth = width of bar

# age_avg <- Marriage %>% summarise(mean(age, na.rm = TRUE))

# Kernel

# Create a kernel density plot of age 
ggplot(Marriage, aes(x = age)) + 
    geom_density() +    
    labs(title = "Participants by age") 

# Create a kernel density plot of age 
ggplot(Marriage, aes(x = age)) + 
    geom_density(fill = "indianred3") + 
    labs(title = "Participants by age")

# default bandwidth for the age variable 
bw.nrd0(Marriage$age) ## [1] 5.181946 

# Create a kernel density plot of age 
ggplot(Marriage, aes(x = age)) + 
    geom_density(fill = "deepskyblue", bw = 1) + 
    labs(title = "Participants by age", subtitle = paste0("bandwidth = ", bw.nrd0(Marriage$age)))

# Dot Chart 

# plot the age distribution using a dotplot 
ggplot(Marriage, aes(x = age)) + 
    geom_dotplot(binwidth = 2) + 
    labs(title = "Participants by age", y = "Proportion", x = "Age") 

# Plot ages as a dot plot using 
# gold dots with black borders 

ggplot(Marriage, aes(x = age)) + 
    geom_dotplot(fill = "gold", color = "black", binwidth = 2) +
    labs(title = "Participants by age", y = "Proportion", x = "Age") 



