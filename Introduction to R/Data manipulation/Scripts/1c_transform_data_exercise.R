# 1c_transform_data_exercise.R
# Author: Xiru Lyu
# Last modified: Nov 26th, 2022
# Description: This script is an exercise of using the dplyr language for
# data transformation. The sample data in this demonstration is the Boston 
# Airbnb Open Data, built from the dataset from 
# Kaggle: https://www.kaggle.com/datasets/airbnb/boston


## Part 1: Prerequisites -------------------------------------------------------

# Load the tidyverse package
library(tidyverse)

# Read Boston Airbnb listings data into a data frame named listings. 
# The data file is stored in the "Data" folder.
listings = read.csv("Data/boston_airbnb_listings.csv")

# simple exploration of the dataset
# 1. What's the dimension of the data?
# 2. What are names of columns in the dataset?

## Part 2: Data transformation -------------------------------------------------

# 1. Create a new data frame named listings2, which only includes the following
# variables: id, neighbourhood_cleansed, host_id, host_response_time,
# host_acceptance_rate, property_type, bed_type, beds
listings2 = listings %>% 
  select(id, neighbourhood_cleansed, host_id, host_name, host_response_time,
         host_acceptance_rate, property_type, bed_type, beds)

# Find distinct property type
listings2 %>% distinct(property_type)
unique(listings2$property_type)

# Find unique pairs of property type and bed type values
listings2 %>% distinct(property_type, bed_type)

# 2. Clean the property_type variable in listings2. Substitute missing values with
# NA. Assign the result back to listings2.
listings2 = listings2 %>%
  mutate(property_type = ifelse(property_type == "", NA, property_type))

# Check the number of observations with missing property type information
sum(is.na(listings2$property_type))

# 3. With the procedure outlined above, clean the variable host_response_time.
# Make sure that missing values are correctly identified in the R environment.
listings2 = listings2 %>% 
  mutate(host_response_time = ifelse(host_response_time == "N/A", NA, host_response_time))

# Check the number of observations with missing host response time information
sum(is.na(listings2$host_response_time))

# 4. Inspect the variable host_acceptance_rate. What type of data does this column
# hold? What type of data this column should hold? 

# 5. Clean the host_acceptance_rate variable. First make sure that missing values
# are correctly labeled.
listings2 = listings2 %>% 
  mutate(host_acceptance_rate = ifelse(host_acceptance_rate == "N/A", NA, host_acceptance_rate))

# Remove the % sign
listings2 = listings2 %>% 
  mutate(host_acceptance_rate = gsub("%", "", host_acceptance_rate))

# 6. Further clean the host_acceptance_rate variable. Make sure that values in
# this column correctly represent proportions.
listings2 = listings2 %>% 
  mutate(host_acceptance_rate = as.numeric(host_acceptance_rate) / 100)

# 7. Change the variable name neighbourhood_cleansed to neighborhood
listings2 = listings2 %>% 
  rename(neighborhood = neighbourhood_cleansed)

## Part 3: More complex questions ----------------------------------------------
# Note: For this section, you do not need to create a separate data frame for
# each task

# 1. For listings in Fenway, what was the average host acceptance rate by 
# property type?
listings2 %>% 
  filter(neighborhood == "Fenway") %>% 
  group_by(property_type) %>% 
  summarise(avg_host_acceptance_rate = mean(host_acceptance_rate, na.rm = TRUE))

# 2. How many listings were there under every host response time level?
listings2 %>% 
  group_by(host_response_time) %>% 
  summarise(listings_count = n())

# 3. For each neighborhood, what was the proportion of listings with hosts 
# responding to messages in a few hours (i.e., within an hour or within a 
# few hours)?
listings2 %>% 
  group_by(neighborhood, host_response_time) %>% 
  summarise(listings_count = n()) %>% 
  ungroup() %>% 
  group_by(neighborhood) %>% 
  mutate(tot_listings = sum(listings_count)) %>% 
  filter(host_response_time == "within an hour" | host_response_time == "within a few hours") %>% 
  group_by(neighborhood) %>% 
  summarise(prop = sum(listings_count)/tot_listings) %>% 
  distinct()

# 4. How many Airbnb hosts were there in the area? What was the expected 
# number of listings for a host? What was the name of the host with the maximum 
# number of listings? 

listings2 %>% 
  group_by(host_id, host_name) %>% 
  summarize(listings_count = n()) %>% 
  ungroup() %>% 
  mutate(tot_hosts = n(),
         tot_listings = sum(listings_count),
         avg_listing = tot_listings / tot_hosts) %>% 
  arrange(desc(listings_count))

