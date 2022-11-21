# 5_for_while_loops.R
# Author: Xiru Lyu
# Last modified: Nov 20th, 2022
# Description: This script provides sample codes for writing for and while loops
# in R.

## For loop --------------------------------------------------------------------
vec = 1:10

# the following two for loops should provide the same answer

# iterating based on the index
for (i in 1:length(vec)) {
  print(vec[i] +  1)
}

# iterating based on the actual value
for (i in vec) {
  print(i + 1)
}

## While loop ------------------------------------------------------------------
a = 100

while (a > 95) {
  print(a)
  a = a - 1
}
