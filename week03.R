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

# load new data
newStarwar <- select(starwars, -films, -vehicles, -starships)

# filer gender equal "male"
# swGender <- filter(newStarwar, gender=="male")

# filer gender equal "male" and mass more than "50"
# swGenderAndMass <- filter(newStarwar, gender=="male" & mass > 50)

# %in%
# c is array or vector
# swHomeworld <- filter(newStarwar, homeworld %in% c("Alderaan", "Endor", "Coruscant"))

# Add new column ifelse
# swNewColumn <- mutate(newStarwar, NewColumn = ifelse(eye_color %in% c("black", "blue", "brown"), eye_color,"other"))

# Replace column
swReplaceColumn <- mutate(newStarwar, eye_color = ifelse(eye_color %in% c("black", "blue", "brown"), eye_color,"other"))


# | is or, & is and
# set height greater than 200 or less than 75 to missing
# swNewHeight <- mutate(newStarwar, height = ifelse(height < 75 | height > 200, NA, height))

# na.rm=TRUE remove NA data
# calculate mean
# swNewRemoveNA <- summarise(newStarwar, mean_ht = mean(height, na.rm = TRUE)
#                                       ,mean_mass = mean(mass, na.rm = TRUE))

# Group by # by gender and find mean
# swGroup <- group_by(newStarwar, gender)
# swMeanGender <- summarise(swGroup, mean_ht = mean(height, na.rm = TRUE)
#                                   ,mean_mass = mean(mass, na.rm = TRUE))

# %>% pipe
# swPipe <- newStarwar %>% filter(gender=="female") %>% 
#                          group_by(species) %>% 
#                          summarise(mean_ht = mean(height, na.rm = TRUE))

# NO ADVICE!!!!!!!!!
# cleaningData <- na.omit(newStarwar) # cleaning data
# swPipeCn <- cleaningData %>% filter(gender=="female") %>% 
#                          group_by(species) %>% 
#                          summarise(mean_ht = mean(height, na.rm = TRUE))

########## Reshape
swLongData <- gather(newStarwar, key="", value="",  )




