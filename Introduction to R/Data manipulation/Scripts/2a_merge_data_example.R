# 2a_merge_data_example.R
# Author: Xiru Lyu
# Last modified: Nov 27th, 2022
# Description: This script provides an example of merging data through binding
# by row or by column.
# The sample data in this demonstration is built with the dataset Students 
# Performance in Exams,obtained from 
# Kaggle: https://www.kaggle.com/datasets/whenamancodes/students-performance-in-exams

## Prerequisites ---------------------------------------------------------------

# Load the tidyverse package
library(tidyverse)

# Read data on exams scores from sections A and B, respectively
exam_a = read.csv("Data/student_section_A_scores.csv")
exam_b = read.csv("Data/student_section_B_scores.csv")

# Read data on demographic characteristics from students in sections and A and B
demo = read.csv("Data/student_characteristics.csv")

## Bind two datasets by row ----------------------------------------------------

# Check that both data frames have the same column names (order does not matter)
colnames(exam_a)
colnames(exam_b)

# Bind two datasets by row
exam = bind_rows(exam_a, exam_b) # dplyr solution; faster for large datasets
exam = rbind(exam_a, exam_b)  # base R solution, should give the same result

## Bind two datasets by column -------------------------------------------------
exam_full = bind_cols(exam, demo) # dplyr solution
exam_full = cbind(exam, demo) # base R solution, should give the same result

# Check that observations did match for every row
sum(exam_full$ID...1 == exam_full$ID...6)