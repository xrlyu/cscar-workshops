# 2c_merge_data_exercise.R
# Author: Xiru Lyu
# Last modified: Nov 27th, 2022
# Description: This script is an exercise of using the dplyr language for 
# merging two datasets.
# The sample data in this demonstration is the Boston Airbnb Open Data, 
# built with the dataset from Kaggle: https://www.kaggle.com/datasets/airbnb/boston

## Prerequisites ---------------------------------------------------------------

# Load the tidyverse package
library(tidyverse)

# Read Boston Airbnb listings data into a data frame named listings. 
# Only keep two columns: id, host_id
# The data file is stored in the "boston_airbnb" folder in the "Data" folder.
listings = read.csv("Data/boston_airbnb/listings.csv") %>% 
  select(id, host_id)

# Read daily price and availability data into a data frame named calendar
calendar = read.csv("Data/boston_airbnb/calendar.csv")

# simple data exploration for the calendar data
# 1. What are names of columns in the dataset?
# 2. What's the dimension of the dataset?

## Merging two datasets --------------------------------------------------------

# 1. Which columns should be used as identifiers for merging two datasets?

# 2. Merge two datasets, such that the resulting dataset include daily price and
# availability information for all properties on the listings. How many rows are
# there for this dataset?

left_join(listings, calendar, by = c("id" = "listing_id")) %>% 
  rnow()

# 3. Merge two datasets, such that the resulting dataset include properties
# with both host id and daily price/availability information. How many unique
# properties are included in the resulting dataset?

inner_join(listings, calendar, by = c("id" = "listing_id")) %>% 
  distinct(id) %>% 
  nrow()