library(readr)
library(readxl) # Exel ,spreadsheets
library(haven) # Statustucak packeages
library(dplyr) # Selecting variable
library(tidyr) # reshape data
library(ggplot2) # Graph
library(treemapify) # Tree map
library(scales) # Percent.

# --------------------------------- #

# stacked bar chart 
ggplot(mpg, aes(x = class, fill = drv)) + geom_bar(position = "stack")

# grouped bar plot 
ggplot(mpg, aes(x = class, fill = drv)) + geom_bar(position = "dodge")

# grouped bar plot preserving zero count bars 
ggplot(mpg, aes(x = class, fill = drv)) + geom_bar(position = position_dodge(preserve = "single"))

# bar plot, with each bar representing 100% 
ggplot(mpg, aes(x = class, fill = drv)) + geom_bar(position = "fill") + labs(y = "Proportion")

# bar plot, with each bar representing 100%, 
# reordered bars, and better labels and colors 
ggplot(mpg, aes(x = factor(class, levels = c("2seater", "subcompact", "compact", "midsize", "minivan", "suv", "pickup")), 
                fill = factor(drv, levels = c("f", "r", "4"), labels = c("front-wheel", "rear-wheel", "4-wheel")))) + 
    geom_bar(position = "fill") + 
    scale_y_continuous(breaks = seq(0, 1, .2), label = percent) + 
    scale_fill_brewer(palette = "Set2") + 
    labs(y = "Percent", fill = "Drive Train", x = "Class", title = "Automobile Drive by Class") + 
    theme_minimal()

# CATEGORICAL VS. CATEGORICAL 

# change the order the levels for the categorical variable "class" 
mpg$class = factor(mpg$class, levels = c("2seater", "subcompact", "compact", "midsize", "minivan", "suv", "pickup")  
                                                   