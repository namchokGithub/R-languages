# Quiz 02 
# Namchok Singhachai 60160169

library(ggplot2)
library(dplyr)
library(tidyr)
library(readr)

salaries <- read.csv("salaries.csv")

##### Quiz 01 #####

ggplot(data = salaries, mapping = aes(x=yrs.service, y=salary, color=rank)) + 
    geom_smooth(method = "lm", size = 0.2, se = FALSE) + 
    geom_point(alpha = 0.5, size = 1) +
    facet_wrap(~discipline) + 
    labs(title = "Relationship between salary and year of service"
         , x = "Years of Services", y = "Salary (Bath)")

##### Quiz 02 #####

avg_salary <- salaries %>% group_by(rank) %>% summarise(avg_salary = mean(salary, na.rm = TRUE))

ggplot(avg_salary, mapping = aes(reorder(x=rank, avg_salary), y=avg_salary)) + 
    geom_bar(stat = "identity", fill = c("#A1E8E4", "#FC6472", "#ECCDB3") ,alpha = 0.8 , color = "black") + 
    coord_flip()+ 
    labs(title = "Mean salary by rank"
         , x = "Rank", y = "Mean Salary") + geom_text(aes(label = avg_salary), vjust = -0.1) 

##### Quiz 03 #####

years <- mutate(salaries,
                years=ifelse(yrs.service < 10, "Lower 10 year"
                             ,ifelse(yrs.service >= 10 & yrs.service <= 20, "Between 10 - 20 year", "Higher 20 year"))
                ) %>% 
            group_by(years) %>% 
            count(years)

ggplot(data = years,
       mapping = aes(x = reorder(years,n),y=n)) +
        geom_bar(stat = "identity", fill = c("#A1E8E4", "#FC6472", "#ECCDB3")) +
        scale_y_continuous(labels = scales::percent) + 
        labs(title = "Mean salary by rank"
         , x = "Level", y = "Frequency") + geom_text(aes(label = n), vjust = -0.25)



