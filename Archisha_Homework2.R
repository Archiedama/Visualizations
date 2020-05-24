#install packages-------------------------------
library(tidyverse)

#Question1---------------------------------------
#Boston Crime events-----------------------------
boston_crime <- read_csv("C:/Users/archi/OneDrive/Documents/R/Boston_crime.csv")
answer <- boston_crime %>% group_by(DISTRICT,MONTH) %>%
                       summarise(count=n()) %>%  
                       drop_na(DISTRICT) %>% 
                       filter(DISTRICT != 'External')
tail(answer)

answer <- answer %>% pivot_wider(names_from = DISTRICT, values_from = count)
write.csv(answer, "crime_events_by_district.csv", row.names = FALSE)

#question 2------------------------------------------------------
#global_mobility_change------------------------------------------
mobility <- read_csv("C:/Users/archi/OneDrive/Documents/R/Global_Mobility_Report.csv")
answer1 <- mobility %>% filter(country_region=="United States") %>%
                
                select(country_region,date,retail_and_recreation_percent_change_from_baseline,
                grocery_and_pharmacy_percent_change_from_baseline,parks_percent_change_from_baseline,
                transit_stations_percent_change_from_baseline,workplaces_percent_change_from_baseline,
                residential_percent_change_from_baseline) %>% 
        
                group_by(country_region,date) %>% 
  
  
                summarise_if(is.numeric, mean, na.rm = TRUE)
  
  
write.csv(answer1, "global_mobility_change.csv", row.names = FALSE)


#Question3-------------------------------------------------------------
#percentage of female employment in agriculture------------------------ 
female_employ <- read_csv("C:/Users/archi/OneDrive/Documents/R/percentage_of_fe_employ.csv",skip=3)
answer3 <- female_employ %>% select(-c(2:4)) 

write.csv(answer3, "female_employment.csv", row.names = FALSE)
