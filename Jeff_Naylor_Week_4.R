#20.3.5
#1. The main difference is how NA values are treated.  They are not finite, however they are also not infinite.
#2. It checks to see whether the difference between two values is within a set tolerance.
#3. An integer and double can have nearly infinite values, only limited by what the program can store.
#4. Round 

#20.4.6
#1. It lets you know the % of data that is NA. Calculates the number of elements that are NA or infinite
#2. is.atomic only checks if an object is one of the atomic types.  is.vector also allows for lists
#3. Both allow naming elements of vectors, the second allows for more types of setups
#4. last_value<-function(x){
x[[length(x)]]
}
even_numbers<- function(x){
  x[x%%2==0]
}
#5
#6 It returns NA

#20.5.4
#1 See Word Doc
#2 In a Tibble, all columns must have same # of rows

#21.2.1
#1: 
for (i in colnames(mtcars)){ output[i]<-mean(mtcars[[i]])}
output <- vector("list", ncol(flights))
names(output) <- names(flights)
for (i in names(flights)) {
  output[[i]] <- class(flights[[i]])
}

#2
stringr::str_c(letters, collapse = "")
sqrt(sum((x - mean(x)) ^ 2) / (length(x) - 1))

#3
humps <- c("five", "four", "three", "two", "one", "no")
for (i in humps) {
  cat(str_c("Alice the camel has ", rep(i, 3), " humps.",
            collapse = "\n"), "\n")
  if (i == "no") {
    cat("Now Alice is a horse.\n")
  } else {
    cat("So go, Alice, go.\n")
  }
  cat("\n")
}

#4
#21.3.5
#1
#2 You get NULL. For duplicates, it only returns the first result.
#3

#21.5.3
#1. 
map_dbl(mtcars,mean)
mapchr(flights,typeof)
map_int(iris, function(x) length(unique(x)))