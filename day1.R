a=(1:5)

print(a)

a <- (1:5)

b = "I am Namchok"

z = c(1,2,3,4,NA,5,NA)

complete.cases(z)

gender <- c("male", "female")

c=c(1+(0+3i))   #complex ventor

is.na(z) # detect NA

m=c(2/3,3/3,0/0)
is.finite(m)
is.infinite(m)
is.nan(m)


a <- 4
b <- 10
sum <- a+b
print(sum)

a <- 2
sum <- a^2
sum

vec = c(1:10) # vector
mat = matrix(vec, ncol = 2, nrow = 5)

mat = matrix(c(1:10), ncol = 2, nrow = 5)
t(mat) # transpose

d = diag(3) # diagonal identiry matrix 

zro = matrix(rep(0,6), nrow = 2, ncol = 3)
#rep loop

id = 1
bestFriends = c("Mhee", "Tar", "C", "Bank")
FriendsGirlsFriends = c("Tar", "Tar", "Bank", "Mhee")
bestFriendsGig = c(5, 1, 22, 5)
yearsold = c(50,10,6,15)
data = data.frame(id, bestFriends, FriendsGirlsFriends, bestFriendsGig)
data = cbind(data, yearsold) # column
data[,-4] # column
data[-4,] # row, case
data[3,2] # show row 3 column 2

data = data[c(2,1)] # swap column 2 and 1

names(data) # Show name column
colnames(data) = c("id", "b", "f", "BB", "y")
data

#std <- c(1, "Bacnk", "NO", 0, 21,21)
#data = rbind(data, std) # row

#data$car <- c('BMW',NA,NA,'SUZUKI')

library(readr)

salaries <- read_csv('salaries.csv')
year <- read_tsv('10year.txt')
View(year)


