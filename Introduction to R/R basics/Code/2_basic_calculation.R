# basic_calculation.R
# Author: Xiru Lyu
# Last modified: Oct 30th, 2022
# Description: This script provides an example of using R as a calculator.

5+3 
5-3 
5/3 
5*3 

17 %% 5 # remainder
17 %/% 5 # integer division

5 * 2 + 3
5 * (2 + 3) # change the order of operation by parentheses

5^3
sqrt(5)
exp(10)
log(100) # natural log

# Exercise: logarithms with a different base?
log10(100) # log with base 10
log(10, 10)
log(100, base=10)
log(x=100, base=10)

# rounding of numbers
round(exp(1), 3)
round(exp(1), 0)
round(exp(1)) # the default is 0

floor(3.1415926)
ceiling(3.1415926)
