library(dplyr)
library(RMySQL)
library(readr)
library(tidyr)


# starwars <- read.csv("starwars.csv")
# View(starwars)

# Select ##################################
# newData  <- select(starwars, name) # select (filename, column)
# newData  <- select(starwars, name == "R%") # filter
# newData  <- select(starwars, birth_year > 10) # filter

# Group by ###############################
# starships <- group_by(starwars, homeworld) %>% count()

# Mean ###################################
# mean_of_height <- group_by(starwars, homeworld) %>% summarise(mean(height))

# Mutate #################################
# New column and Edit column
# new_column <-   select(starwars, name, height) %>% mutate(new_height = height * 0.394)

# If else ################################
# if_else <- select(starwars, name, height) %>% mutate(IsOver = ifelse(height > 100, "true", "false"))
# ifelse(condition, true, false)

# Gather #################################
# reshape
# data  <- select(starwars, name, height, mass)
# gather <- gather(data, key = 'variable', value = 'value')
# gather <- gather(data, key = 'variable', value = 'value', height:mass) # 1:4 # one to four

# Na.omit ################################
# find NA data and clean
# data  <- select(starwars, name, height, mass)
# cleanNAData <- na.omit(data)

# is.na ##################################
# return true or false
# naData <- select(starwars, hair_color) %>% mutate(IsOver = ifelse(is.na(hair_color), "true", "false"))

# Summarize ##############################
# data <- group_by(starwars, homeworld, height) %>% 
#        summarise(mean_height = mean(height)) %>% 
#        mutate(class = ifelse(mean_height > 190, "Tallest", ifelse(mean_height > 150, "Tall", "Short")))

 data <- group_by(starwars, homeworld, height) %>% 
        summarise(mean_height = mean(height)) %>% 
        mutate(class = ifelse(mean_height > 190, "Tallest", ifelse(mean_height > 150, "Tall", "Short")))


