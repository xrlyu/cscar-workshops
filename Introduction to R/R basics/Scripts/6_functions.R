# 6_functions.R
# Author: Xiru Lyu
# Last modified: Nov 20th, 2022
# Description: This script provides sample codes for creating user-defined 
# functions and utilizing the apply() function.

## Writing a function ----------------------------------------------------------
# This function converts Fahrenheit to Celsius

fahrenheit_to_celsius = function(temp_f = 80) {
  temp_c = (temp_f - 32) * 5 / 9
  return(temp_c)
}

fahrenheit_to_celsius()
fahrenheit_to_celsius(temp_f = 20)
fahrenheit_to_celsius(20)

## Exercise --------------------------------------------------------------------
# 1. Write a function celsius_to_kelvin() that converts Celsius to Kelvin, 
# using the formula K = C + 273.15

# 2. What is 100 Fahrenheit equal to in Kelvin?

## Using the apply() function --------------------------------------------------
v1 = c(22, 40, 13, 55, 48, 19, 42)
v2 = c(3, 16, 7, 20, 11, 5, 9)
mat = cbind(v1, v2)

mat

# these commands return the same result
apply(mat, 2, function(x) sum(x))
apply(mat, 2, sum)

## Exercise --------------------------------------------------------------------
# 1. Write a function add_first_last() that computes the sum of a vector's first 
# and last elements.

# 2. Create a matrix named m of the form
#      [,1] [,2] [,3]
# [1,]    9    4    7
# [2,]   14   47   74
# [3,]    5    0    1
# [4,]    6   10   19

# 3. Compute the sum of first and last elements for every row in m.