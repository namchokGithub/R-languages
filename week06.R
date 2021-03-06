library(readr)
library(readxl) # Exel ,spreadsheets
library(haven) # Statustucak packeages
library(dplyr) # Selecting variable
library(tidyr) # reshape data
library(ggplot2) # Graph
library(treemapify) # Tree map
library(scales) # Percent.

# --------------------------------- #

###### stacked bar chart  ######
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
    geom_line(size = 1.5, color = "lightblue") + 
    geom_point(size = 3, color = "steelblue") + 
    labs(y = "Life Expectancy (years)", x = "Year", 
         title = "Life expectancy changes over time", 
         subtitle = "United States (1952-2007)", 
         caption = "Source: http://www.gapminder.org/data/")+
    theme(plot.title = element_text(hjust = 0.5), plot.subtitle = element_text(hjust = 0.5))



##### Home work #####

# change the order the levels for the categorical variable "class" 
mpg$manufacturer = factor(mpg$manufacturer, levels = c("audi", "chevrolet", "dodge", "ford", "honda", "hyundai", "jeep"
                                         , "land rover", "lincoln", "mercury", "subaru", "toyota", "volkswagen"))

# create a summary dataset 
plotdata <- mpg %>% group_by(manufacturer, year) %>%
    summarize(n = n()) %>% 
    mutate(pct = n/sum(n), lbl = scales::percent(pct)) 

ggplot(plotdata, aes(x = factor(manufacturer, levels = c("audi", "chevrolet", "dodge", "ford", "honda", "hyundai", "jeep"
                                                  , "land rover", "lincoln", "mercury", "subaru", "toyota", "volkswagen")), 
                     y = pct, fill = factor(year, levels = c("1999", "2008"), labels = c("1999", "2008")))) +
    
    geom_bar(stat = "identity", position = "fill") + 
    scale_y_continuous(breaks = seq(0, 1, .2), labels = percent) + 
    geom_text(aes(label = lbl), size = 3, position = position_stack(vjust = 0.5)) + 
    scale_fill_brewer(palette = "Accent") + 
    labs(y = "Percent", fill = "Year", x = "Class", title = "Year sales by Manufaclurer") + 
    theme_minimal() +
    theme(plot.title = element_text(hjust = 0.5))
                   
                   
                   
                                                   

##### Barchart #####

data(Salaries, package="carData")
# calculate mean salary for each rank 
plotdata <- Salaries %>% group_by(rank) %>% summarize(mean_salary = mean(salary))
                                                      
# plot mean salaries 
ggplot(plotdata, aes(x = rank, y = mean_salary)) + geom_bar(stat = "identity")

# plot mean salaries in a more attractive fashion 
ggplot(plotdata, aes(x = factor(rank, labels = c("Assistant\nProfessor", "Associate\nProfessor", "Full\nProfessor")), y = mean_salary)) + 
    geom_bar(stat = "identity", fill = c("cornflowerblue", "lightblue", "green")) + 
    geom_text(aes(label = dollar(mean_salary)), vjust = -0.25) + 
    scale_y_continuous(breaks = seq(0, 130000, 20000), label = dollar) + 
    labs(title = "Mean Salary by Rank", subtitle = "9-month academic salary for 2008-2009", x = "", y = "")

######  Grouped kernel density plots ###

# plot the distribution of salaries 
# by rank using kernel density plots 
ggplot(Salaries, aes(x = salary, fill = rank)) + 
    geom_density(alpha = 0.4) + 
    labs(title = "Salary distribution by rank")


####### Box plots ######

# plot the distribution of salaries by rank using boxplots 
ggplot(Salaries, aes(x = rank, y = salary)) + 
    geom_boxplot() + 
    labs(title = "Salary distribution by rank")

# plot the distribution of salaries by rank using boxplots 
ggplot(Salaries, aes(x = rank, y = salary)) + 
    geom_boxplot(notch = TRUE, fill = "cornflowerblue", alpha = .7) + 
    labs(title = "Salary distribution by rank")


###### violin #######

# plot the distribution of salaries 
# by rank using violin plots 
ggplot(Salaries, aes(x = rank, y = salary)) + 
    geom_violin() + 
    labs(title = "Salary distribution by rank")


# plot the distribution using violin and boxplots 
ggplot(Salaries, aes(x = rank, y = salary)) + 
    geom_violin(fill = "cornflowerblue") + 
    geom_boxplot(width = .2, fill = "orange", outlier.color = "orange", outlier.size = 2) + 
    labs(title = "Salary distribution by rank")













                                 