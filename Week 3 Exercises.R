#install.packages("tidyr")
library(tidyr)
library(tidyverse)
table1

#12.2.1 Exercises

#1 
#table1: Tidy data with each oberservation only having one data point
#table2: type column has two different variables and needs to be split
#table3: Rate column has two observations with a / separator
#table4a: Just country and year populatio data
#table4b: Just country and year incidents data

#2
table1 %>%
  mutate(rate=cases/population*10000)


table2 %>%
  spread(type,count) %>%
  mutate(rate=cases/population*10000)

tidy4a <- table4a %>% 
  gather(`1999`, `2000`, key = "year", value = "cases")
tidy4b <- table4b %>% 
  gather(`1999`, `2000`, key = "year", value = "population")
tidy4<-left_join(tidy4a, tidy4b)
mutate(tidy4,rate=cases/population*10000)

#3
library(ggplot2)

table2 %>%
  spread(type,count) %>%
  mutate(rate=cases/population*10000) ->table2tidy

ggplot(table2tidy, aes(year, cases)) + 
  geom_line(aes(group = country), colour = "grey50") + 
  geom_point(aes(colour = country))

#12.3.3
#1

stocks <- tibble(
  year   = c(2015, 2015, 2016, 2016),
  half  = c(   1,    2,     1,    2),
  return = c(1.88, 0.59, 0.92, 0.17)
)
stocks %>% 
  spread(year, return) %>% 
  gather("year", "return", `2015`:`2016`,convert=TRUE)

#It loses the variable type for year.  Convert makes it transfer the correct type along with the changes.

#2

table4a %>% 
  gather('1999', '2000', key = "year", value = "cases")
#There are no tick marks around year.  R thinks they're positions instead of columns.

#3

people <- tribble(
  ~name,             ~key,    ~value, ~observation,
  #-----------------|--------|------|-------------
  "Phillip Woods",   "age",       45, 1,
  "Phillip Woods",   "height",   186, 1,
  "Phillip Woods",   "age",       50, 2,
  "Jessica Cordero", "age",       37, 1,
  "Jessica Cordero", "height",   156, 1
)

people %>%
  spread(key,value)

#It fails becuase there are identical values for rows 1 and 3.  You could add an extra column for observation, year, etc.

#4
preg <- tribble(
  ~pregnant, ~male, ~female,
  "yes",     NA,    10,
  "no",      20,    12
)
preg %>%
  gather(male,female,key="sex",value="count")

#12.5.1
#1. The fill argument looks to fill missing data with the nearest match.  Both spread and complete fill them with NAs
#2. The direction argument tells R which value to substitute in for fill, either the previous (up) or the next (down).
