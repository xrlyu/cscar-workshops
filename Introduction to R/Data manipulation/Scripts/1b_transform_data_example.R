# 1b_transform_data_example.R
# Author: Xiru Lyu
# Last modified: Nov 26th, 2022
# Description: This script provides an example of using the rowwise function from
# the dplyr package for performing operations one row at a time. 
# The sample data in this demonstration is built with the dataset Students 
# Performance in Exams,obtained from 
# Kaggle: https://www.kaggle.com/datasets/whenamancodes/students-performance-in-exams


## Prerequisites ---------------------------------------------------------------

# Load the tidyverse package
library(tidyverse)

# Read data on exam scores from Section A
exam = read.csv("Data/student_section_A_scores.csv")

## Rowwise operation -----------------------------------------------------------

# For each student, compute the total score, the average score, and the max score
# across three exams

# Option 1
exam %>% 
  mutate(tot_score = math_score + reading_score + writing_score,
         avg_score = tot_score / 3) %>% 
  group_by(ID) %>% 
  mutate(max_score = max(c(math_score, reading_score, writing_score))) %>% 
  ungroup()

# Option 2
exam %>% 
  rowwise() %>% 
  mutate(tot_score = sum(c(math_score, reading_score, writing_score)),
         avg_score = mean(c(math_score, reading_score, writing_score)),
         max_score = max(c(math_score, reading_score, writing_score))) %>% 
  ungroup()

# Option 3
exam %>% 
  rowwise() %>% 
  mutate(tot_score = sum(c_across(ends_with("score"))),
         avg_score = mean(c_across(math_score:writing_score)),
         max_score = max(c_across(ends_with("score")))) %>% 
  ungroup()