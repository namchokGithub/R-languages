# graph

library(ggplot2)
library(dplyr)

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

