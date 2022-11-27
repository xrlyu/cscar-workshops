# 1a_transform_data_example.R
# Author: Xiru Lyu
# Last modified: Nov 26th, 2022
# Description: This script provides an example of using the dplyr language for
# data transformation. The sample data in this demonstration is the hotel
# booking demand dataset, obtained from 
# Kaggle: https://www.kaggle.com/datasets/jessemostipak/hotel-booking-demand

## Prerequisites ---------------------------------------------------------------

# Load the tidyverse package
library(tidyverse)

# Read the dataset
hotel = read.csv("Data/hotel_bookings.csv")

# Simple data exploration ------------------------------------------------------
dim(hotel)
colnames(hotel)
summary(hotel)
str(hotel)
head(hotel, n = 6)

## Data transformation ---------------------------------------------------------

# Select columns, notice that there are multiple ways to achieve the goal
hotel2 = select(hotel, hotel:lead_time, starts_with("arrival_date"),
                -c(arrival_date_week_number, arrival_date_day_of_month),
                ends_with("nights"), adults:babies, adr)

# Rename a column
hotel3 = hotel2 %>% 
  rename(avg_daily_rate = adr) 

# Create new variables, and only keep variables not used to create new variables
hotel4 = hotel3 %>% 
  mutate(tot_nights = stays_in_weekend_nights + stays_in_week_nights,
         tot_ppl = adults + children + babies,
         .keep = "unused") 

# Create new variables with conditional statements
hotel5 = hotel4 %>% 
  mutate(grp_size = ifelse(tot_ppl <= 2, "small", "large"),
         stay_length = case_when(tot_nights == 1 ~ "overnight",
                                 tot_nights > 1 & tot_nights <= 14 ~ "short-term",
                                 tot_nights > 14 ~ "long-term"))

# Filter rows by value
hotel6 = hotel5 %>% 
  filter(is_canceled == 0, !is.na(stay_length))

# Arrange rows
hotel7 = hotel6 %>% 
  arrange(avg_daily_rate) 

## Exercise: using hotel7, create a data frame named hotel8 that only includes 
## records with positive average daily rate
# hotel8 = hotel7 %>% 
#   filter(avg_daily_rate >= 0)

# Produce grouped summaries
hotel9 = hotel8 %>% 
  group_by(hotel, arrival_date_year, arrival_date_month) %>% 
  summarize(rate_avg = mean(avg_daily_rate),
            tot_traveler = sum(tot_ppl),
            tot_records = n()) 

# A more complex task: 
# 1. For each hotel, calculate the average number of travelers per month, 
# regardless of arrival year.
# 2. For each hotel, what is the difference between the actual number of travelers
# and the expected number of travelers for that month?
# 3. For each hotel, sort the diff computed in step 2, in descending order. 
hotel10 = hotel9 %>% 
  group_by(hotel, arrival_date_month) %>% 
  mutate(avg_traveler_month = mean(tot_traveler),
         traveler_diff = tot_traveler - avg_traveler_month) %>% 
  group_by(hotel) %>% 
  arrange(desc(traveler_diff), .by_group = TRUE)
