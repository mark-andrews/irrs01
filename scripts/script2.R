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
  

# data viz ----------------------------------------------------------------
# scatterplot
ggplot(weight_df,
       mapping = aes(x = height, y = weight)
) + geom_point(size = 1.0, alpha = 0.5) 

# scatterplot for each gender
ggplot(weight_df,
       mapping = aes(x = height, y = weight, colour = gender)
) + geom_point(size = 1.0) 

# scatterplot smoother
ggplot(weight_df,
       mapping = aes(x = height, y = weight)
) + geom_point(size = 1.0, alpha = 0.5) + 
  stat_smooth(method = 'lm', se = F, colour = 'red')

# scatterplot for each gender
ggplot(weight_df,
       mapping = aes(x = height, y = weight, colour = gender)
) + geom_point(size = 0.5, alpha = 0.5) + 
  stat_smooth(method = 'lm', se = F, fullrange = T) +
  theme_bw()

# histogram of height
ggplot(weight_df, mapping = aes(x = height)) +
  geom_histogram(binwidth = 2, colour = 'white')

# histogram of height by gender
ggplot(weight_df, mapping = aes(x = height, fill = gender)) +
  geom_histogram(binwidth = 2, colour = 'white') 

# histogram of height by gender
# dodge histogram
ggplot(weight_df, 
       mapping = aes(x = height, fill = gender)) +
  geom_histogram(binwidth = 2, 
                 position = 'dodge',
                 colour = 'white') 

# histogram of height by gender
# identity histogram
ggplot(weight_df, 
       mapping = aes(x = height, fill = gender)) +
  geom_histogram(binwidth = 2, 
                 alpha = 0.75, 
                 position = 'identity',
                 colour = 'white')


# tukey box plot
ggplot(weight_df,
       mapping = aes(y = weight, x = gender)
) + geom_boxplot(width = 0.25, outlier.size = 0.5)


