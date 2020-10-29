# make my vectors ---------------------------------------------------------

primes <- c(2, 3, 5, 7, 11, 13)
primes2 <- primes * 2
primes3 <- primes2 ^ 10 + primes

# make my data frame ------------------------------------------------------

df <- data.frame(name = c("billy", "bob", "mary"), # this is the name
                 age = c(23, 25, 27))              # the age


# do something else -------------------------------------------------------

x <- 42


# looking at lists --------------------------------------------------------

my_list <- list(x = 1, y = 'hello', z = TRUE)

X <- matrix(c(1, 2, 3, 4, 5, 6), ncol = 3)

Y <- t(X)

# inner product 
Z <- Y %*% X

solve(Z)

# install.packages(c("tidyverse", "lme4"), type = 'binary')



# read in a csv files from URL --------------------------------------------

library(tidyverse)
weight_df <- read_csv("https://raw.githubusercontent.com/mark-andrews/irrs01/master/data/weight.csv")
weight_df2 <- read.csv("https://raw.githubusercontent.com/mark-andrews/irrs01/master/data/weight.csv")
