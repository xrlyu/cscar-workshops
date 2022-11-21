# 3_objects.R
# Author: Xiru Lyu
# Last modified: Nov 20th, 2022
# Description: This script provides sample codes to create, manipulate and
# subset R objects.

## Object assignment -----------------------------------------------------------

x <- 5
x = 5 # I prefer this
5 -> x # not recommended

x
print(x)

# can use either . of - as name separators
x.y = 5
x_y = 10

# R is case sensitive
a = 5
A = 7
print(c(a, A))

## Object manipulation ---------------------------------------------------------

x = 5
x + 2

x = x + 2
x

y = 3
x - y 

x == y # test of equality
x = y # assignment
print(c(x, y))

x = c(1, 2, 3)
x

rm(x) # remove an object from the environment
x # error: the object no longer exists

## Exercise: creating some objects ---------------------------------------------

# a vector named vec with values 1, 5, 6, 9, 0

# a matrix named mat with with 3 columns and 4 rows, using integer values 
# from -4 to 7. Values shall be filled by row.

# a list named ls with the above objects vec and mat as its elements

# a data frame named `df` with four named columns --
# city: Ann Arbor, Boston, Atlanta
# state: MI, MA, GA
# lat: 42.278046, 42.361145, 33.753746
# lng: -83.738220, -71.057083, -84.386330

## Exploring data structures ---------------------------------------------------

# type of object (high-level)
class(vec)
class(mat)
class(ls)
class(df)

# type of object (low-level)
typeof(vec)
typeof(mat)
typeof(ls)
typeof(df)

# metadata of the object
attributes(vec)
attributes(ls)
attributes(mat)
attributes(df)

# length of the object
length(vec)
length(ls)
length(mat) # this function may not be very useful for 2-d objects
length(df)

# dimension of a multi-dimensional object
dim(mat)
dim(df)

# number of rows; number of columns
nrow(mat)
ncol(mat)

nrow(df)
ncol(df)

## Subsetting objects ----------------------------------------------------------

# atomic vectors
vec
vec[1] # subset by index

sub_vec = vec[2] # assign the subsetted value to another object
sub_vec

vec[c(1,3)] # subset elements in any order
vec[c(3,1)]

vec[c(3,1,5,3,5)] # elements can be subsetted any number of times

vec[-2] # extract all elements in the vector except the second

# lists

ls
ls[[1]]
ls[[1]][2]

# matrices

mat
mat[2,3]
mat[c(1,2), 3]
mat[1:2, 1:3]
mat[2,]

# Exercise: subsetting the matrix

# Use the minus sign, extract all elements of the matrix mat except the third column

# Reorder rows for mat so the first row becomes the last, and the last row 
# is the first

# data frames
df[,1]
df[2,1]
df$city # subset by column name
df[df$city == "Ann Arbor",]
df$lat[df$city == "Ann Arbor"]

# the which function evaluates the logical statement(s) and returns indices
# for which the logical statement(s) is true
vec
which(vec == 5)

df
which(df$city == "Ann Arbor")

# Index assignment -------------------------------------------------------------
vec
vec[3] == 55
vec

mat
mat[1:2, 3] = 0
mat