library(readr)

# Exel ,spreadsheets
library(readxl)

# Statustucak packeages
library(haven)

# Selecting variable
library(dplyr)

# reshape data
library(tidyr)

#------------------ End library -------------------- #

data <- read.csv("salaries.csv")


#### No.1 #####
one <- data %>% group_by(rank) %>% summarise(yearAvg = mean(yrs.service, na.rm = TRUE))
  
#### No.2 #####
two <- data %>% select(rank, salary) %>% 
                 mutate(salary_level = ifelse(salary >= mean(salary, na.rm = TRUE), "Hight average", "Low average"))

#### No.3 #####
three <- data %>% distinct(rank) %>%
                   mutate(fullRank = ifelse(rank=="AssocProf","Associate Professor", 
                                            ifelse(rank=="AsstProf","Assistant Professor","Professor")))

rankRow <- distinct(data, rank)
fullRankRow <- mutate(rankRow, fullRank = ifelse(rank=="AssocProf","Associate Professor", 
                                     ifelse(rank=="AsstProf","Assistant Professor","Professor")))
answer <- data.frame(fullRankRow)

#### No.4 #####
four <- data %>% filter(yrs.service >= 20 & yrs.since.phd >= 20) %>% 
                 group_by(rank, sex) %>% summarize(mean_salary = mean(salary))

#### No.5 #####
five <- gather(four, key="variable", value="value", sex:mean_salary )







