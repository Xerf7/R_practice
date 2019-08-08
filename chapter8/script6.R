##08-2
#Scatter plot
library(ggplot2)

#background
ggplot(data = mpg, aes(x = displ, y = hwy))
#graph: geom_point()
ggplot(data = mpg, aes(x = displ, y = hwy)) + geom_point()
#settings: xlim() ylim()
ggplot(data = mpg, aes(x = displ, y = hwy)) + 
  geom_point() + 
  xlim(3,5) +
  ylim(10, 30)

#Q1
ggplot(data = mpg, aes(x = cty, y = hwy)) +
  geom_point()
#Q2
ggplot(data = midwest, aes(x = poptotal, y = popasian)) + 
  geom_point() + 
  xlim(0, 500000) +
  ylim(0, 10000) 

##08-3
#box plot
library(dplyr)

df_mpg <- mpg %>% 
  group_by(drv) %>% 
  summarise(mean_hwy = mean(hwy))
df_mpg

ggplot(data = df_mpg, aes(x = drv, y = mean_hwy)) + geom_col()
#reorder()
ggplot(data = df_mpg, aes(x = reorder(drv, -mean_hwy), y = mean_hwy))  + geom_col()
#frequency graph
ggplot(data = mpg, aes(x = drv)) + geom_bar()
ggplot(data = mpg, aes(x = hwy)) + geom_bar()

#Q1
df_mpg <- mpg %>% 
  filter(class == "suv") %>% 
  group_by(cty) %>% 
  summarise(mean_cty = mean(cty)) %>% 
  arrange(desc(mean_cty)) %>% 
  head(5)
ggplot(data = df_mpg, aes(x = reorder(cty, -mean_cty), y = mean_cty)) + geom_col()
#Q2
mpg
ggplot(data = mpg, aes(x = class)) + geom_bar()

##08-4
#Line chart
ggplot(data = economics, aes(x = date, y = unemploy)) + geom_line()
#Q1
ggplot(data = economics, aes(x = date, y = psavert)) + geom_line()

##08-5
#box plot
ggplot(data = mpg, aes(x = drv, y = hwy)) + geom_boxplot()
