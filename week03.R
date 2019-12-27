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

# filer gender equal "male" and mass more than "50"
swGenderAndMass <- filter(newStarwar, gender=="male" & mass > 50)

# %in%
# c is array or vector
swHomeworld <- filter(newStarwar, homeworld %in% c("Alderaan", "Endor", "Coruscant"))
