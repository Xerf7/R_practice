exam <- read.csv("csv_exam.csv")
head(exam)
head(exam, 10)
tail(exam)
tail(exam, 10)

View(exam)

dim(exam)

str(exam)
#obs == row
summary(exam)

install.packages("ggplot2")
mpg <- as.data.frame(ggplot2::mpg)
head(mpg)
tail(mpg)
View(mpg)
dim(mpg)
str(mpg)
?mpg
summary(mpg)

#변수명 바꾸기
df_raw <- data.frame(var1 = c(1, 2, 1),
                     var2 = c(2, 3, 2))
df_raw

install.packages("dplyr")
library(dplyr)

df_new <- df_raw
df_new
df_new <- rename(df_new, v2 = var2)
df_new

mpg
mpg_cpy <- mpg
mpg_cpy <- rename(mpg_cpy, city = cty, highway = hwy)
mpg_cpy

#Derived variable
df <- data.frame(var1 = c(4, 3, 8),
                 var2 = c(2, 6, 1))
df
df$var_sum <- df$var1 + df$var2
df
df$var_mean <- (df$var1 + df$var2)/2
df

mpg$total <- (mpg$cty + mpg$hwy)/2
head(mpg)
mean(mpg$total)
summary(mpg$total)
#histogram
hist(mpg$total)
#ifelse
mpg$test <- ifelse(mpg$total >= 20, "pass", "fail")
head(mpg, 20)
#table
table(mpg$test)
table(mpg$manufacturer)

library(ggplot2)
qplot(mpg$test)

mpg$grade <- ifelse(mpg$total >=30, "A",
                    ifelse(mpg$total >= 20, "B", "C"))
head(mpg, 20)
table(mpg$grade)
qplot(mpg$grade)

df_midwest <- as.data.frame(ggplot2::midwest)
df_midwest <- rename(df_midwest, total = poptotal, asian = popasian)
head(df_midwest)
df_midwest$percasian <- (df_midwest$asian/df_midwest$total)
head(df_midwest)
hist(df_midwest$percasian)
mean(df_midwest$percasian)
df_midwest$test <- ifelse(df_midwest$percasian > mean(df_midwest$percasian), "large", "small")
table(df_midwest$test)
qplot(df_midwest$test)
