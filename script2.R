english <- c(90, 80, 60, 70)
english
math <- c(50, 60, 100, 20)
math
df_midterm <- data.frame(english, math)
df_midterm
class <- c(1, 1, 2, 2)
class

df_midterm <- data.frame(english, math, class)
df_midterm

mean(df_midterm$english)
mean(df_midterm$math)

df_midterm <- data.frame(english = c(90,80,60,70), 
                         math = c(50,60,100,20), 
                         class = c(1,1,2,2))
df_midterm

df_market <- data.frame(product = c("Apple", "Strawberry", "Watermelon"),
                        price = c(1800, 1500, 3000),
                        sellcount = c(24, 38, 13))
df_market
mean(df_market$price)
mean(df_market$sellcount)

install.packages("readxl")
library(readxl)

#read_excel() converts excel file to dataframe
df_exam <- read_excel("excel_exam.xlsx")
df_exam
df_exam <- read_excel("d:/east_r/excel_exam.xlsx")
df_exam

mean(df_exam$english)
mean(df_exam$science)

wrong_df_exam <- read_excel("excel_exam_novar.xlsx")
wrong_df_exam
wrong_df_exam <- read_excel("excel_exam_novar.xlsx", col_names = F)
wrong_df_exam

df_exam_sheet <- read_excel("excel_exam_sheet.xlsx", sheet = 3)
df_exam_sheet

#using csv file
#csv file has smaller file size
df_csv_exam <- read.csv("csv_exam.csv")
df_csv_exam
df_csv_exam <- read.csv("csv_exam.csv", stringsAsFactors = F)
df_csv_exam

df_midterm
write.csv(df_midterm, file = "df_midterm.csv")
#Using only R: RData file/Other case: CSV file
save(df_midterm, file = "df_midterm.rda")
rm(df_midterm)
load("df_midterm.rda")
df_midterm

df_exam <- read_excel("excel_exam.xlsx")
df_csv_exam <- read.csv("csv_exam.csv")
load("df_midterm.rda")
