#### Preamble ####
# Purpose: For writing STA304 problem set 3. 
# Citation: Tausanovitch, Chris and Lynn Vavreck. 2020. Democracy Fund + UCLA Nationscape, October 10-17, 2019 (version 20200814). Retrieved from https://www.voterstudygroup.org/downloads?key=9ffb9163-8cd2-4d9b-ae75-acd8845e7891.
# Author: Zezhou Han, Yingchen Tan, Xueqi Wang, and Xiwen Ran
# Data: 2 November 2020
# Contact: kami.wang@utoronto.mail.ca
# License: MIT
# Pre-requisites: 
# - Need to have downloaded the ACS data and saved it to inputs/data
# - Don't forget to gitignore it!


#### Workspace setup ####
library(haven)
library(tidyverse)
# setwd("C:/Users/Sammi-Jo/Desktop/PS3")
# Read in the raw data (You might need to change this if you use a different dataset)
raw_data <- read_dta("ns20200625.dta")
# Add the labels
raw_data <- labelled::to_factor(raw_data)
# Just keep some variables
reduced_data <- 
  raw_data %>% 
  select(interest,
         registration,
         vote_2016,
         vote_intention,
         vote_2020,
         ideo5,
         employment,
         foreign_born,
         gender,
         census_region,
         hispanic,
         race_ethnicity,
         household_income,
         education,
         state,
         congress_district,
         age)


#### What else???? ####
# Maybe make some age-groups?
# Maybe check the values?
# Is vote a binary? If not, what are you going to do?

reduced_data<-
  reduced_data %>%
  filter(vote_2020 != "I would not vote" ) %>% 
 # filter(vote_2020 != "I am not sure/don't know") %>% 
  mutate(vote_trump = 
           ifelse(vote_2020=="Donald Trump", 1, 0)) %>% 
  mutate(vote_biden = 
           ifelse(vote_2020=="Joe Biden", 1, 0)) %>% 
  mutate(vote_not_sure = 
           ifelse(vote_2020 == "I am not sure/don't know",1,0))

# Saving the survey/sample data as a csv file in my
# working directory
write_csv(reduced_data, "survey_data.csv")

