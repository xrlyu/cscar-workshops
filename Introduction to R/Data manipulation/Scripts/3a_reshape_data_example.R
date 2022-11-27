# 3a_reshape_data_example.R
# Author: Xiru Lyu
# Last modified: Nov 27th, 2022
# Description: This script provides an example of using the dplyr language for 
# reshaping a dataset.
# The sample data in this demonstration is built with the R sample dataset
# "ChickWeight"

## Prerequisites ---------------------------------------------------------------

# Load the tidyverse package
library(tidyverse)

# Read the chick weight data
cw = read.csv("Data/chickweight.csv")

## Reshape the data to a long format -------------------------------------------

# The goal is to make sure the dataset meet tidy data rule #1
cw_long = cw %>% 
  pivot_longer(-c(chick:diet), names_to = "age", values_to = "weight")

# Exercise: We need to further clean the data such that the age column is numeric and 
# truly represent the chick's age
cw_long = cw_long %>% 
  mutate(age = as.numeric(gsub("X", "", age)))
