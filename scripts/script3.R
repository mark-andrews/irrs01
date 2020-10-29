library(tidyverse)
weight_df <- read_csv("https://tinyurl.com/irss01weight")

M <- lm(weight ~ height, data = weight_df)
summary(M)

summary(M)$coefficients

M1 <- lm(weight ~ height + age, data = weight_df)
summary(M1)

confint(M1, level = 0.99)

sigma(M1)

# what would we predict for people who are 180cm and aged 25
hypo_df <- data.frame(height = 180, age = 25)

predict(M1, newdata = hypo_df)
library(modelr)

add_predictions(hypo_df, M1)

data.frame(height = 180, age = 20:50) %>% 
  add_predictions(M1) %>% 
  ggplot(aes(x = age, y = pred)) + geom_point()

anova(M, M1)

# logistic regression
weight_df_1 <- mutate(weight_df, tall = height > 180)

M2 <- glm(tall ~ weight, 
          data = weight_df_1, 
          family = binomial(link = 'logit'))

data.frame(weight = 30:150) %>% 
  add_predictions(M2, type = 'response') %>% 
  ggplot(aes(x = weight, y = pred)) + geom_line()

library(lme4)

M3 <- lmer(Reaction ~ Days + (Days|Subject), data = sleepstudy)
