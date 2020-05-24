#install packages----------------
library(tidyverse)
install.packages("tidyverse")

#read data from csv-------------------
data <- read.csv("C:/Users/archi/OneDrive/Documents/R/fm.csv",na.strings = "")

#number of farmers markets by state in descending order------
no_fm <- data %>% 
         group_by(State) %>% 
         summarise(Count = n()) %>%
         drop_na() %>%
         arrange(desc(Count)) 
no_fm

#number of farmer markets by top 5 cities in MA--------------
top5_fm_cities <- data%>% 
                  filter(State=='Massachusetts') %>%
                  group_by(city) %>%
                  summarise(Count = n()) %>%
                  drop_na() %>%
                  arrange(desc(Count)) %>%
                  top_n(5)
top5_fm_cities

#column generation using pivot function------------------
#selecting the required columns
data_1 <- data %>%
               select(State,Credit, WIC, WICcash,SNAP) 
  
payment <- data_1 %>%
               pivot_longer(-State ,names_to= "Payment_system",
                      values_to = "Farmers_Market",values_drop_na = TRUE)  %>% 
               filter(Farmers_Market =="Y") %>%
               select(State,Payment_system) %>%
               group_by(State,Payment_system) %>%
               summarise("#Farmers Market"=n())
payment

#Create new columns, split and add data from existing columns to new column----



new_data <- data %>% 
            separate(Season1Date, c('startdate', 'enddate'), sep="to", remove = FALSE)


head(new_data)

                

       
            
