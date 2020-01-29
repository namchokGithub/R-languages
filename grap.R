# graph

library(ggplot2)
library(dplyr)
library(tidyr)

data(CPS85, package = "mosaicData")

ggplot(data = CPS85,mapping = aes(x = exper, y = wage))

# add points
ggplot(data = CPS85,mapping = aes(x = exper, y = wage)) + geom_point()

# delete outlier
plotdata <- filter(CPS85, wage < 40)

# redraw scatterplot
ggplot(data = plotdata, mapping = aes(x=exper, y=wage)) + geom_point(color = "#7FBF3F", alpha = 0.3, size = 3) +
                                                          geom_smooth(method = "lm", size = 0.2, se = FALSE)
# lm = linear model
# se = line shadow  

# indicate sex using color
ggplot(data = plotdata, mapping = aes(x=exper, y=wage, color = sector)) + geom_point(alpha = 0.5, size = 3) +
    geom_smooth(method = "lm", size = 0.2, se = FALSE)

# indicate sex using color
ggplot(data = plotdata, mapping = aes(x=exper, y=wage, color = sex)) + geom_point(alpha = 0.5, size = 3) +
    geom_smooth(method = "lm", size = 0.2, se = FALSE) + 
    scale_x_continuous(breaks = seq(0, 60, 10)) + 
    scale_y_continuous(breaks = seq(0, 30, 5), labels = scale::dollar) + 
    scale_color_manual(values = c("red", "blue"))

# facet_wrap | group
ggplot(data = plotdata, mapping = aes(x=exper, y=wage, color = sex)) + geom_point(alpha = 0.5, size = 1) +
    geom_smooth(method = "lm", size = 0.2, se = FALSE) + 
    scale_x_continuous(breaks = seq(0, 60, 10)) + 
    scale_y_continuous(breaks = seq(0, 30, 5), labels = scales::dollar) + 
    scale_color_manual(values = c("red", "blue")) +
    facet_wrap(~sector) 

# label
ggplot(data = plotdata, mapping = aes(x=exper, y=wage, color = sex)) + geom_point(alpha = 0.5, size = 1) +
    geom_smooth(method = "lm", size = 0.2, se = FALSE) + 
    scale_x_continuous(breaks = seq(0, 60, 10)) + 
    scale_y_continuous(breaks = seq(0, 30, 5), labels = scales::dollar) + 
    scale_color_manual(values = c("red", "blue")) +
    facet_wrap(~sector) + 
    labs(title = "Relationship between wages and experience"
         , subtitle = "Current Poplations Survey"
         , caption = "source: http://mosix-web.org"
         , x = "Years of Experirence", y = "Hourly Wage", color = "Gender")

# Theme
ggplot(data = plotdata, mapping = aes(x=exper, y=wage, color = sex)) + geom_point(alpha = 0.5, size = 1) +
    geom_smooth(method = "lm", size = 0.2, se = FALSE) + 
    scale_x_continuous(breaks = seq(0, 60, 10)) + 
    scale_y_continuous(breaks = seq(0, 30, 5), labels = scales::dollar) + 
    scale_color_manual(values = c("red", "blue")) +
    facet_wrap(~sector) + 
    labs(title = "Relationship between wages and experience"
         , subtitle = "Current Poplations Survey"
         , caption = "source: http://mosix-web.org"
         , x = "Years of Experirence", y = "Hourly Wage", color = "Gender") + 
    theme_light()


# Barchart
data(Marriage, package = "mosaicData")
# plot the distribution of race
ggplot(Marriage, aes(x = race)) + 
    geom_bar()

# plot the distribution of race with colours and label
ggplot(Marriage, aes(x = race)) + 
    geom_bar(fill = "cornflowerblue",alpha = 0.8 , color = "yellow" ) + 
    labs(title = "Test" ,x = "???????????????????????????" ,y = "Frequency")

# Percent
ggplot(Marriage, aes(x = race, y = ..count.. / sum(..count..))) + 
    geom_bar(fill = "cornflowerblue",alpha = 0.8 , color = "yellow" ) + 
    labs(title = "Test" ,x = "Race" ,y = "Percent") + 
    scale_y_continuous(labels = scales::percent)

# newdata <- group_by(Marriage, race) %>% count() %>% mutate(percentage = n/sum(n))

# Sorting 
plotdata <- Marriage %>% count(race)

# stat = "identity" = no calculate

# calculate count
# ggplot(plotdata, aes(x = reorder(race, n), y = n)) + 
#    geom_bar(fill = "red",alpha = 0.8 , color = "yellow" ) + 
#    labs(title = "Test" ,x = "Race" ,y = "Percent")
# Error 404
# Replace counting

# small to big
ggplot(plotdata, aes(x = reorder(race, n), y = n)) + 
    geom_bar(stat = "identity", fill = "red",alpha = 0.8 , color = "yellow" ) +
    labs(title = "Test" ,x = "Race" ,y = "Percent")

# big to small
ggplot(plotdata, aes(x = reorder(race, -n), y = n)) + 
    geom_bar(stat = "identity", fill = "red",alpha = 0.8 , color = "yellow" ) + 
    labs(title = "Test" ,x = "Race" ,y = "Percent")     

# Race
newdata <- group_by(Marriage, race) %>% count() %>% mutate(percentage = n/sum(newdata$n) * 100)

# officialTitle
officialTitleData <- group_by(Marriage, officialTitle) %>% count() %>% mutate(percentage = n/sum(officialTitleData$n))
plotdataOfficialTitle <- Marriage %>% count(officialTitle)
ggplot(plotdataOfficialTitle, aes(x = reorder(officialTitle, -n), y = officialTitleData$percentage)) + 
    geom_bar(stat = "identity", fill = c("#3F7FBF","#3F3FBF","#BF3FBF", "yellow","#7FBF3F","#BF7F3F","#7F3FBF","#3F3FBF","#3F7FBF"), alpha = 0.8 , color = "blue" ) + 
    labs(title = "officialTitle" ,x = "officialTitle" ,y = "Percentage") + geom_text(aes(label = n), vjust=-0.5)+ 
    scale_y_continuous(labels = scales::percent)
 
