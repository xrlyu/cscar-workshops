# 4_ifelse.R
# Author: Xiru Lyu
# Last modified: Nov 20th, 2022
# Description: This script provides sample codes for writing conditional if/else 
# statements in R.

## if statement ----------------------------------------------------------------

x = 5
if (x > 0) {
  print("positive number")
}

## if...else statement ---------------------------------------------------------

x = -5
if (x > 0) {
  print("positive number")
} else {
  print("non-positive number")
}

## if...else if...else statement -----------------------------------------------

# Exercise: follow the syntax for writing an if...else if... else statement
# that performs the following opperation --
#
# if x > 0, print "positive number"
# if x = 0, print "zero",
# if x < 0, print "negative number"
