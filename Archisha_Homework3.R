#install packages-------------------------------
library(tidyverse)
library(readxl)

#set directory
getwd()
setwd("C:/Users/archi/OneDrive/Documents/R")

#Question1---------------------------------------
#MA County Chropleth Map-----------------------------
data <- read_excel("C:/Users/archi/OneDrive/Documents/R/Health Risks.xlsx")
data$`ID Geography`
Health_risk <- data %>% 
  separate(`ID Geography`, c('Prefix', 'ID_GEO'), sep="US", remove = TRUE) %>% 
  select(-c(`ID Year`,Prefix,`Slug Geography`)) %>%
  pivot_wider(names_from = Year, values_from = `Diabetes Prevalence`)

write.csv(Health_risk, "Health_risk.xlsx", row.names = FALSE)



