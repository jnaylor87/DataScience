#5.5.2

#1
mutate(flights, dep_time_min= dep_time %/% 100*60 + dep_time %% 100)
mutate(flights, sched_dep_time_min= sched_dep_time %/% 100*60 + sched_dep_time %% 100)

#2
# I expect to see total hours and minutes, however, it's dividing them on a basis of 100 instead of 60 as units of time
# We need to change the arrival and departure times to minutes

#3
# Once adjusted to min, the dep_delay is the difference between the two

#4 
flights_delayed <- mutate(flights, dep_delay_rank = min_rank(-dep_delay))
flights_delayed <- filter(flights_delayed, dep_delay_rank <= 20)
arrange(flights_delayed, dep_delay_rank)

#5
# It adds 1-3 to 1-10, repeating 1-3 for the sequence.  Because one is longer than the other, it repeats the shorter function.

#5.6.7

#2
not_cancelled %>% group_by(dest) %>% summarize(flights=sum(dep_time>0))
not_cancelled %>% group_by(tailnum) %>% summarize(milage=sum(distance))

#3
# It's redundant.  If a flight didn't depart, it didn't arrive.

#4
cancelled %>% group_by (month,day) %>% summarise(nixed=sum(distance))
#The totals come in waves and they do not correlated to the average delay

#5
flights %>% group_by(carrier) %>% summarise(n(),mean(dep_delay,na.rm=TRUE))
# F9 Has the worst delays

#6
#It orders the totals by the highest grouped count. It would be useful to quickly sort the list.

#5.7.1 #I ended up looking up solutions on this and then reverse engineering to understand how the solutions worked.
#I will freely admit to not being able to create elegant solutions found in questions 4-8

#1
#Mutate allows adding on transformed variables while transmute replaces original data

#2 N844MH
flights %>%
  +     group_by(tailnum) %>%
  +     summarise(arr_delay = mean(arr_delay)) %>%
  +     filter(rank(desc(arr_delay)) <= 1)
#3 7AM
#4 
flights %>%
  filter(!is.na(arr_delay), arr_delay > 0) %>%  
  group_by(dest) %>%
  mutate(arr_delay_total = sum(arr_delay),
         arr_delay_prop = arr_delay / arr_delay_total)
#5
lagged_delays <- flights %>%
  arrange(origin, year, month, day, dep_time) %>%
  group_by(origin) %>%
  mutate(dep_delay_lag = lag(dep_delay)) %>%
  filter(!is.na(dep_delay), !is.na(dep_delay_lag))
#6
#7
dest_2carriers <- flights %>%
  # keep only unique carrier,dest pairs
  select(dest, carrier) %>%
  group_by(dest, carrier) %>%
  filter(row_number() == 1) %>%
  # count carriers by destination
  group_by(dest) %>%
  mutate(n_carrier = n_distinct(carrier)) %>%
  filter(n_carrier >= 2)

carriers_by_dest <- dest_2carriers %>%
  group_by(carrier) %>%
  summarise(n_dest = n()) %>%
  arrange(desc(n_dest))
head(carriers_by_dest)
#8
flights %>%
  arrange(tailnum, year, month, day) %>%
  group_by(tailnum) %>%
  mutate(delay_gt1hr = dep_delay > 60) %>%
  mutate(before_delay = cumsum(delay_gt1hr)) %>%
  filter(before_delay < 1) %>%
  count(sort = TRUE)
#19.3.1

#1
#"Short_Prefix":  It counts the number of characters in the prefix and returns true if the first string is shorter
#"Drop_First_Entry": It cuts out the first entry in a list
#"Last_Value": Returns last value computed

#2
#Align the cases and naming conventions

#3

#19.4.4
#1 if only looks to test a single condition while ifelse tests each element
#2 
greet <- function(time = lubridate::now()) {
hr <- lubridate::hour(time)
if (hr < 12) {
  print("good morning")
} else if (hr < 17) {
  print("good afternoon")
} else {
  print("good evening")
}
}
#3
fizzbuzz <- function(x) {
  if (!(x %% 3) && !(x %% 5)) {
    "fizzbuzz"
  } else if (!(x %% 3)) {
    "fizz"
  } else if (!(x %% 5)) {
    "buzz"
  } else {
    x
  }
}
#4
temp <- seq(-10, 50, by = 5)
cut(temp, c(-Inf, 0, 10, 20, 30, Inf), right = TRUE,
    labels = c("freezing", "cold", "cool", "warm", "hot"))
#5
#switch() chooses the nth value of a list based on the numeric input

#6
#It returns the next value of whatever is entered.  e is Null

