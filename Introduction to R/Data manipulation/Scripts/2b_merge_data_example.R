# 2b_merge_data_example.R
# Author: Xiru Lyu
# Last modified: Nov 27th, 2022
# Description: This script provides an example of merging data through binding
# by row or by column.
# The sample data in this demonstration is built with the dataset Students 
# Performance in Exams, obtained from 
# Kaggle: https://www.kaggle.com/datasets/whenamancodes/students-performance-in-exams

## Prerequisites ---------------------------------------------------------------

# Load the tidyverse package
library(tidyverse)

# Read data on exam scores
exam = read.csv("Data/student_exam_scores.csv")

# Read data on test prep
prep = read.csv("Data/student_test_prep.csv")

## Join two datsets ------------------------------------------------------------

# left join: include all rows in LHS, return columns in LHS and RHS
left_join(exam, prep, by = c("ID"))

# right join: include all rows in RHS, return columns in LHS and RHS
right_join(exam, prep, by = c("ID"))

# inner join: include all rows in LHS and RHS, return columns in LHS and RHS

# full join: include all rows in LHS or RHS, ruturn columns in LHS and RHS
full_join(exam, prep, by = c("ID"))

# anti join: include observations in LHS but not in RHS, return columns in LHS
anti_join(exam, prep, by = c("ID"))

## Join two datsets: use the pipe operator ------------------------------------

# The following two lines should return the same result
exam %>% left_join(., prep, by = c("ID"))
prep %>% left_join(exam, ., by = c("ID"))
