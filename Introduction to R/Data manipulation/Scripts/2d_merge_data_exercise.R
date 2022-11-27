# 2d_merge_data_exercise.R
# Author: Xiru Lyu
# Last modified: Nov 27th, 2022
# Description: This script is an exercise of using the dplyr language for 
# merging two datasets.
# The sample data in this demonstration is the college tuition, diversity,
# and pay dataset, obtained from 
# Kaggle: https://www.kaggle.com/datasets/jessemostipak/college-tuition-diversity-and-pay

## Prerequisites ---------------------------------------------------------------

# Load the tidyverse package
library(tidyverse)

# Read the data on school diversity into a data frame named diversity.
# The data file is stored in the "college_data" folder in the "Data" folder.
diversity = read.csv("Data/college_data/diversity_school.csv")

# Read the college tuition data into a data frame named tuition.
# The data file is stored in the "college_data" folder in the "Data" folder.
tuition = read.csv("Data/college_data/tuition_cost.csv")

# Inspect two datasets. What kind of information each data frame stores?

## Mergingd data ---------------------------------------------------------------

# 1. Which columns should be used as identifiers for merging two datasets?

# 2. Merge two datasets, such that the resulting dataset contains schools
# with either diversity or tuition informtation. How many schools are there
# in the resulting dataset?

full_join(diversity, tuition, by = c("name", "state")) %>% 
  distinct(name, state) %>% 
  nrow()

# 3. How many schools with only tuition but not diversity information?
anti_join(tuition, diversity, by = c("name", "state")) %>% 
  distinct(name, state) %>% 
  nrow()
