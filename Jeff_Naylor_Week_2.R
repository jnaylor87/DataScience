my_variable <- 10
my_variable

library(tidyverse)

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy))

filter(mpg, cyl == 8)
filter(mpg, displ > 3)

5.2.4

filter(flights, arr_delay >= 120)
filter(flights, (dest == "IAH" | dest == "HOU"))
filter(flights, (carrier == "United" | carrier == "American" | carrier =="Delta"))
filter(flights, month %in% c(6,7,8))
filter(flights, arr_delay > 120, dep_delay <0)
filter(flights, dep_delay >60, arr_delay < dep_delay -30)
filter(flights, dep_time <= 0600)

filter(flights,between(month,6,8))
filter(flights,between(dep_time, 0000,0600))

8,245 lack departure time and also lack info on other actual schedule items.
Likely cancelled flights

5.3.1
1. arrange(flights, desc(is.na(dep_time)))
2. arrange(flights, desc(dep_delay))
   arrange(flights, dep_delay)
3. arrange(flights, air_time)
   arrange(flights, desc(air_time))
4. arrange(flights, desc(distance))
   arrange(flights, distance)
   
5.4.1

2. Ignores the second entry
3. Allows you to include all entries from a list stored in a vector
4. By default ignores case.  Change it in the options tab