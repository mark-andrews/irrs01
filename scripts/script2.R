library(tidyverse)
weight_df <- read_csv("https://raw.githubusercontent.com/mark-andrews/irrs01/master/data/weight.csv")
weight_df <- read_csv("https://tinyurl.com/irss01weight")

# get summary stats on some variables in weight_df
summarize(weight_df, 
          average_height = mean(height),
          stdev_weight = sd(weight),
          n = n()
)

# get summary stats on some variables in weight_df
# grouped by some grouping
summarize(group_by(weight_df, gender), 
          average_height = mean(height),
          stdev_weight = sd(weight),
          n = n()
)
# get summary stats on some variables in weight_df
# grouped by gender and race
summarize(group_by(weight_df, gender, race), 
          average_height = mean(height),
          stdev_weight = sd(weight),
          n = n()
)

# dplyr verbs
  # select
  # rename
  # slice
  # filter
  # mutate
  # arrange

# select columns with `select`
select(weight_df, gender, weight, height)
select(weight_df, gender, starts_with('height'))
select(weight_df, contains('eight'))
select(weight_df, gender:age)
select(weight_df, 3:7)

# rename with `rename`
rename(weight_df, sex = gender, Age = age)

# extracting subsets of rows with `slice`
slice(weight_df, 121:125)
# base R equivalent
weight_df[121:125,]

slice(weight_df, -(1:3))

# filter rows with `filter`
filter(weight_df, gender == 'Male', height > 180)
filter(weight_df, (gender == 'Male') & (height > 180)) 
filter(weight_df, (gender == 'Male') | (height > 180)) 
filter(weight_df, race %in% c(1, 2, 3))

mutate(weight_df,
       tall = height > 180,
       race = ifelse(race == 1, 'white', 'non-white'))

# sort with `arrange`
arrange(weight_df, desc(gender), desc(height))

select(weight_df, gender, weight, height) %>% 
  filter(height > 180)

weight_df_1 <- select(weight_df, gender, weight, height)
filter(weight_df_1, height > 180)
  

