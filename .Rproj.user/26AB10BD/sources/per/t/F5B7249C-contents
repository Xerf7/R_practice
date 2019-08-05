#Data preprocessing
#Most used package: dplyr
library(dplyr)
exam <- read.csv("csv_exam.csv")
exam

#filter()
exam %>% filter(class == 1)
exam %>% filter(class == 2)
exam %>% filter(class != 1)
exam %>% filter(class != 3)

exam %>% filter(math > 50)
exam %>% filter(math < 50)
exam %>% filter(english >= 80)
exam %>% filter(english <= 80)

#and
exam %>% filter(class == 1 & math >= 50)
exam %>% filter(class == 2 & english >= 80)
#or
exam %>% filter(math >=90 | english >= 90)
exam %>% filter(english <90 | science < 50)
exam %>%filter(class == 1 | class == 3 | class == 5)

#%in%
exam %>% filter(class %in% c(1, 3, 5))
exam %>% filter(id %in% c(1, 4, 8))

class1 <- exam %>% filter(class == 1)
class2 <- exam %>% filter(class == 2)
mean(class1$math)
mean(class2$math)

#Q1
mpg <- as.data.frame(ggplot2::mpg)
mpg
mpglow <- mpg %>% filter(displ <= 4)
mpghigh <- mpg %>% filter(displ >= 5)
mean(mpglow$hwy)
mean(mpghigh$hwy)
#Q2
mpgaudi <- mpg %>% filter(manufacturer == "audi")
mpgtoyota <- mpg %>% filter(manufacturer == "toyota")
mean(mpgaudi$cty)
mean(mpgtoyota$cty)
#Q3
mpgcfh <- mpg %>% filter(manufacturer %in% c("chevrolet", "ford", "honda"))
mean(mpgcfh$hwy)

#select(): bring part of columns/variables
exam %>% select(math)
exam %>% select(english)
exam %>% select(class, math, english)
#-
exam %>% select(-math)
exam %>% select(-math, -english)

exam %>% filter(class == 1) %>% select(english)
exam %>% 
  filter(class == 1) %>% 
  select(english)

exam %>% 
  select(id, math) %>% 
  head

exam %>% 
  select(id, math) %>% 
  head(10)
#Q1
mpgtwo <- mpg %>% select(class, cty)
mpgtwo
#Q2
suv <- mpgtwo %>% filter(class == "suv")
compact <- mpgtwo %>% filter(class == "compact")
mean(suv$cty)
mean(compact$cty)

#arrange()
exam %>% arrange(math) #math 오름차순
exam %>% arrange(desc(math))
exam %>% arrange(class, math)
#Q1
mpg %>% 
  filter(manufacturer == "audi") %>% 
  arrange(desc(hwy)) %>% 
  head(5)

#mutate()
exam %>% 
  mutate(total = math + english + science) %>% 
  head()

exam %>% 
  mutate(total = math + english + science,
         mean = (math + english + science)/3) %>% 
  head

exam %>% 
  mutate(test = ifelse(science >= 60, "pass", "fail")) %>% 
  head

exam %>% 
  mutate(total = math + english + science) %>%
  arrange(total) %>% 
  head

#Q1
cpympg <- mpg
cpympg <- cpympg %>%
  mutate(total = cty + hwy)

#Q2
cpympg <- cpympg %>% 
  mutate(avg = (cty+hwy)/2) 
cpympg

#Q3
cpympg %>% 
  arrange(desc(avg)) %>% 
  head(3)

#Q4
mpg %>% 
  mutate(total = cty + hwy,
         avg = (cty + hwy) / 2) %>% 
  arrange(desc(avg)) %>% 
  head(3)

#summarise(), group_by()
exam %>% summarise(mean_math = mean(math))
exam %>% 
  group_by(class) %>% 
  summarise(mean_math = mean(math))

exam %>% 
  group_by(class) %>% 
  summarise(mean_math = mean(math), 
            sum_math = sum(math),
            median_math = median(math),
            n = n()) #n() counts number of row

mpg %>% 
  group_by(manufacturer, drv) %>% 
  summarise(mean_cty = mean(cty)) %>% 
  head(10)

mpg %>% 
  group_by(manufacturer) %>% 
  filter(class == "suv") %>% 
  mutate(tot = (cty+hwy)/2) %>% 
  summarise(mean_tot = mean(tot)) %>% 
  arrange(desc(mean_tot)) %>% 
  head(5)

#Q1
mpg %>% 
  group_by(class) %>% 
  summarise(mean_cty = mean(cty))
#Q2
mpg %>% 
  group_by(class) %>% 
  summarise(mean_cty = mean(cty)) %>% 
  arrange(desc(mean_cty))
#Q3
mpg %>% 
  group_by(class) %>% 
  summarise(mean_hwy = mean(hwy)) %>% 
  arrange(desc(mean_hwy)) %>% 
  head(3)
#Q4
mpg %>% 
  filter(class == "compact") %>% 
  group_by(manufacturer) %>% 
  summarise(count = n()) %>% 
  arrange(desc(count))

#데이터 합치기
#hotizontally
test1 <- data.frame(id = c(1, 2, 3, 4, 5),
                   midterm = c(60, 80, 70, 90, 85))
test2 <- data.frame(id = c(1, 2, 3, 4, 5),
                    final = c(70, 83, 65, 95, 80))
test1
test2
#left_join(): dplyr package
total <- left_join(test1, test2, by = "id")
total

name <- data.frame(class = c(1, 2, 3, 4, 5),
                   teacher = c("kim", "lee", "park", "choi", "jung"))
name
exam_new <- left_join(exam, name, by = "class")
exam_new

#vertically
group_a <- data.frame(id = c(1, 2, 3, 4, 5),
                      test = c(60, 80, 70, 90, 85))
group_b <- data.frame(id = c(6, 7, 8, 9, 10),
                      test = c(70, 83, 65, 95, 80))
#bind_rows()
group_all <- bind_rows(group_a, group_b)
group_all

fuel <- data.frame(fl = c("c", "d", "e", "p", "r"),
                   price_fl = c(2.35, 2.38, 2.11, 2.76, 2.22),
                   stringsAsFactors = F)
fuel
#Q1
mpg
mpg <- left_join(mpg, fuel, by = "fl")
mpg %>% 
  select(model, fl, price_fl) %>% 
  head(5)

df_west <- as.data.frame(ggplot2::midwest)
str(df_west)
df_west <- df_west %>% 
  mutate(teensperc = 1 - popadults/poptotal,
         level = ifelse(teensperc >= 0.4, "larger",
                        ifelse(teensperc >= 0.3, "middle", "small"))) 
df_west %>% arrange(desc(teensperc)) %>% 
  head(5)

table(df_west$level)

df_west %>% 
  mutate(asianperc = 100*popasian/poptotal) %>% 
  arrange(popasian) %>% 
  select(state, county, asianperc) %>% 
  head(10)
