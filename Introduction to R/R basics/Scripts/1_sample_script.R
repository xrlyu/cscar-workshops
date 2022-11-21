# 1_sample_script.R
# Author: Xiru Lyu
# Last modified: Oct 30th, 2022
# Description: This script provides sample codes to introduce R data types and 
# data structures.

## get working directory -------------------------------------------------------
getwd()

## Data Types -----------------------------------------------------------------

# double
1.3415926
1

# integer
1L

# character
"abc"
"1"

# logical
TRUE
FALSE

5 == 6
5 != 6
5 < 6
5 > 6
5 <= 6
5 >= 6
5 < Inf
5 < -Inf
!TRUE

# missing values tend to be infectious
NA > 5

10 * NA

!NA

# but there are some exceptions..
NA ^ 0
NA | TRUE
NA & FALSE



## Data Structures ------------------------------------------------------------

# Atomic vector
c(1, 2, 3)
c(1, NA, 3)
c("abc", "1")

# list
list(1, "a", 1L, TRUE)
list(c(1, 2, 3), c("a", "b", "c"))

# Exercise: what if we mix data types in an atomic vector?
c(1, "2", TRUE, 1L, 4.5, NA)
c(1, TRUE, FALSE)

# matrix
matrix(1:12, ncol = 4, nrow = 3)
matrix(1:12, nrow = 3)
matrix(1:12, ncol = 4)
matrix(1:12, nrow = 5) # warning!

# Exercise: How to create a matrix with values filled by row instead? 
# Hint: Check the documentation for `matrix()`

# array
array(1:12, dim=c(2,3,2))
array(1:12, dim=c(2,3,3))

# data frame
data.frame(id = c(1, 2, 3), 
           name = c("James", "Kim", "Lisa"), 
           student = c(TRUE, FALSE, TRUE))