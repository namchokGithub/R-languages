library(readr)
# Exel ,spreadsheets
library(readxl)
# Statustucak packeages
library(haven)
# Selecting variable
library(dplyr)

#------------------ End library -------------------- #

# load new data
newStarwar <- select(starwars, -films, -vehicles, -starships)

# filer gender equal "male"
swGender <- filter(newStarwar, gender=="male")
