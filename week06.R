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
mpg$class = factor(mpg$class, levels = c("2seater", "subcompact", "compact", "midsize", "minivan", "suv", "pickup"))

# create a summary dataset 
plotdata <- mpg %>% group_by(class, drv) %>%
                summarize(n = n()) %>% 
                mutate(pct = n/sum(n), lbl = scales::percent(pct)) 
plotdata

ggplot(plotdata, aes(x = factor(class, levels = c("2seater", "subcompact", "compact", "midsize", "minivan", "suv", "pickup")), 
                     y = pct, fill = factor(drv, levels = c("f", "r", "4"), labels = c("front-wheel", "rear-wheel", "4-wheel")))) +
    geom_bar(stat = "identity", position = "fill") + 
    scale_y_continuous(breaks = seq(0, 1, .2), label = percent) + 
    geom_text(aes(label = lbl), size = 3, position = position_stack(vjust = 0.5)) + 
    scale_fill_brewer(palette = "Set2") + 
    labs(y = "Percent", fill = "Drive Train", x = "Class", title = "Automobile Drive by Class") + 
    theme_minimal()
                   
                   
data(Salaries, package="carData")
# simple scatterplot 
ggplot(Salaries, aes(x = yrs.since.phd,y = salary)) + geom_point()

# enhanced scatter plot 
ggplot(Salaries, aes(x = yrs.since.phd, y = salary)) + geom_point(color="cornflowerblue", size = 2, alpha=.8) + 
    scale_y_continuous(label = scales::dollar, limits = c(50000, 250000)) + 
    scale_x_continuous(breaks = seq(0, 60, 10), limits=c(0, 60)) + 
    labs(x = "Years Since PhD", y = "", title = "Experience vs. Salary", subtitle = "9-month salary for 2008-2009")


# scatterplot with linear fit line 
ggplot(Salaries, aes(x = yrs.since.phd, y = salary)) +
    geom_point(color= "steelblue") + geom_smooth(method = "lm")

# scatterplot with quadratic line of best fit 
ggplot(Salaries, aes(x = yrs.since.phd, y = salary)) + 
                geom_point(color= "steelblue") + 
                geom_smooth(method = "lm", formula = y ~ poly(x, 2), color = "indianred3")

# scatterplot with loess smoothed line 
ggplot(Salaries, aes(x = yrs.since.phd, y = salary)) + 
        geom_point(color= "steelblue") + 
        geom_smooth(color = "tomato")

# scatterplot with loess smoothed line 
# and better labeling and color 
ggplot(Salaries, aes(x = yrs.since.phd, y = salary)) + 
    geom_point(color="cornflowerblue", size = 2, alpha = .6) + 
    geom_smooth(size = 1.5, color = "darkgrey") + 
    scale_y_continuous(label = scales::dollar, limits = c(50000, 250000)) +
    scale_x_continuous(breaks = seq(0, 60, 10), limits = c(0, 60)) + 
    labs(x = "Years Since PhD", y = "", title = "Experience vs. Salary", subtitle = "9-month salary for 2008-2009") + 
    theme_minimal()

######### Line plot ###########
data(gapminder, package="gapminder")
# Select US cases 
plotdata <- filter(gapminder, country == "United States")
# simple line plot 
ggplot(plotdata, aes(x = year, y = lifeExp)) + geom_line()

# line plot with points 
# and improved labeling 
ggplot(plotdata, aes(x = year, y = lifeExp)) + 
    geom_line(size = 1.5, color = "lightgrey") + 
    geom_point(size = 3, color = "steelblue") + 
    labs(y = "Life Expectancy (years)", x = "Year", 
         title = "Life expectancy changes over time", 
         subtitle = "United States (1952-2007)", 
         caption = "Source: http://www.gapminder.org/data/")



                   
                   
                   
                                                   