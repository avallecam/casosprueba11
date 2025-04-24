# Load packages
library(readxl)
library(tidyverse)

# Read raw data
dat <- rio::import("https://github.com/reconhub/learn/raw/master/static/data/linelist_20140701.xlsx")

# Clean raw data
dat_clean <- dat %>% 
  as_tibble() %>% 
  select(case_id,date_of_onset,date_of_outcome,outcome) %>% 
  mutate(across(.cols = c(date_of_onset,date_of_outcome),
                .fns = as.Date)) %>% 
  mutate(outcome = fct(outcome,level = c("Death","Recover"),na = "NA"))

# Write clean data
dat_clean %>% 
  write_rds("outputs/linelist_clean.rds")