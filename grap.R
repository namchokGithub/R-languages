# grap

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
                                                          geom_smooth(method = "lm")

# lm = linear model

