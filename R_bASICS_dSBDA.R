                 ###     Practical_1     ###
                 ### Nuts and bolts in R ###
               
setwd("C:/Users/l/Desktop/DSBDA 2017")  # Setting Working Directory
x <- 1                                  # Nothing Printed
x=1                                     # Nothing Printed
print(x)                                # Explicit Printing
x                                       # Auto Printing
msg <- "hello"
msg                                     # Auto Printing
x <-                                    # Incomplete expression
x <- 10:30
x
                  #Creating Vectors#

# The c() function can be used to create vectors of objects 
# by concatenating things together.

x <- c(0.5, 0.6)                         # numeric
x <- c(TRUE, FALSE)                      # logical
x <- c(T, F)                             # logical

# T and F are short-hand ways to specify TRUE and FALSE

x <- c("a", "b", "c")                    # character
x <- 9:29                                # integer
x <- c(1+0i, 2+4i)                       # complex

#You can also use the vector() function to initialize vectors.

x <- vector("numeric", length = 10)
x
                ### Mixing Objects ###
y <- c(1.7, "a")                         # character
y <- c(TRUE, 2)                          # numeric
y <- c("a", TRUE)                        # character

               ###Explicit Coercion###

#Objects can be explicitly coerced from one class to another 
#using the as.* functions, if available.

x <- 0:6
class(x)
as.numeric(x)
as.logical(x)
as.character(x)
#Sometimes, R can't figure out how to coerce an object 
#and this can result in NAs being produced.
x <- c("a", "b", "c")
as.numeric(x)
as.logical(x)
as.complex(x)
##Matrices
#Matrices are vectors with a dimension attribute. 
#The dimension attribute is itself an integer vector
#of length 2 (number of rows, number of columns)
m<-matrix(nrow = 2, ncol = 3)
m
dim(m)
attributes(m)
#Matrices are constructed column-wise, 
#so entries can be thought of starting in the "upper left" corner
#and running down the columns.
m <- matrix(1:6, nrow = 2, ncol = 3)
m
#Matrices can also be created directly from vectors by 
#adding a dimension attribute.
m <- 1:10
m
dim(m) <- c(2, 5)
m
#Matrices can be created by column-binding or row-binding with the 
#cbind() and rbind() functions.
x <- 1:3
x
y <- 10:12
y
cbind(x, y)   # First column of x and 2nd of y
rbind(x, y)   # First row of x and 2nd of y
#######Lists
#Lists are a special type of vector that can contain elements of 
#different classes. Lists are a very important data type in R

x <- list(1, "a", TRUE, 1 + 4i)
x
#We can also create an empty list of a prespecified length 
#with the vector() function
x <- vector("list", length = 5)
x
#Factors
#Factors are used to represent categorical data
#and can be unordered or ordered.
x <- factor(c("yes", "yes", "no", "yes", "no"))
x
table(x)
#See the underlying representation of factor
unclass(x)

x <- factor(c("yes", "yes", "no", "yes", "no"))
x
x <- factor(c("yes", "yes", "no", "yes", "no"),levels=c("yes", "no"))
x
x<-rep(4,5)              # Repeats f five times
x
x<-rep(c(0,1),20)        # Repeats 0,1 twenty times
x
x<-rep(c(0,1),c(5,5))    # repeats 0 five times and 1 five times
x
class(x)
y<-as.factor(x)          # converting x to factor
y
class(y)
#Missing Values
#Missing values are denoted by NA or NaN for 
#undefined mathematical operations.
#. is.na() is used to test objects if they are NA
#. is.nan() is used to test for NaN
#. NA values have a class also, so there are integer NA, character NA, etc.
#. A NaN value is also NA but the converse is not true
## Create a vector with NAs in it
x <- c(1, 2, NA, 10, 3)
## Return a logical vector indicating which elements are NA
is.na(x)
#Return a logical vector indicating which elements are NaN
is.nan(x)
## Now create a vector with both NA and NaN values
x <- c(1, 2, NaN, NA, 4)
is.na(x)
is.nan(x)
# Make up a randomly ordered vector
v <- sample(101:110)
# Sort the vector
sort(v)
# Reverse sort
sort(v, decreasing=TRUE)
#############Data Frames############
# Data frames are used to store tabular data in R. 
# They are an important type of object in R and are
# used in a variety of statistical modeling applications.
# Hadley Wickham's package dplyr has an optimized set of functions 
# designed to work efficiently with data frames.
# data frames have a special attribute called row.names 
# which indicate information about each row of the data frame.
# Data frames are usually created by reading in a dataset using 
# the read.table() or read.csv().However, data frames can also be 
# created explicitly with the data.frame() function or they can be
# coerced from other types of objects like lists.
# Data frames can be converted to a matrix by calling data.matrix().
# While it might seem that the as.matrix() function should be used
# to coerce a data frame to a matrix, almost always, what you
# want is the result of data.matrix().
x <- data.frame(foo = 1:4, bar = c(T, T, F, F)) # creating data frame
x
dim(x)
str(x)
class(x)
names(x)                        # Name of each Variable
row.names(x)                    # Name of Rows
row.names(x)<-c(LETTERS[1:4])   # Convert Row names to A,B,C,D
as.matrix(x)
x
x[,1]       # x[row,column] All rows first column
x[1,]       # First row all columns
x[-1,]      # Exclude First row
x[-c(1,2),] # Exclude First two rows
x[,-2]      # exclude 2 column

#Names
x <- 1:3
names(x)  # No names 
names(x) <- c("New York", "Seattle", "Los Angeles")
x
names(x)
#Lists can also have names, which is often very useful.
x <- list("Los Angeles" = 1, Boston = 2, London = 3)
x
names(x)
#Matrices can have both column and row names.
m <- matrix(1:4, nrow = 2, ncol = 2)
dimnames(m) <- list(c("a", "b"), c("c", "d"))
m
#Column names and row names can be set separately 
#using the colnames() and rownames() functions.
colnames(m) <- c("h", "f")
rownames(m) <- c("x", "z")
m

##  Object     Set column names     Set row names
## data frame    names()             row.names()
## matrix       colnames()            rownames()

##########Reading and Writing Data#########
#read.table, read.csv, for reading tabular data
#. readLines, for reading lines of a text file
# Many packages in R to read All kind of datsets
# write.table, for writing tabular data to text files (i.e. CSV) or connections
? read.table()
data <- read.table("foo.txt")  #Reading txt file named foo
initial <- read.table("datatable.txt", nrows = 100)
#############################################
a <- data.frame(x = rnorm(100), y = runif(100))
b <- c(3, 4.4, 1 / 3)
## Save 'a' and 'b' to a file
save(a, b, file = "mydata.rda")
## Load 'a' and 'b' into your workspace
load("mydata.rda")
##############################################
data <- read.csv("foo.txt")
## Open a URL connection for reading
con <- url("http://www.jhsph.edu", "r")
## Read the web page
x <- readLines(con)
## Print out the first few lines
head(x)
######################################################
library(data.table)
mydat <- fread('http://www.stats.ox.ac.uk/pub/datasets/csb/ch11b.dat')
head(mydat)
######################################################
##Subsetting a Vector
x <- c("a", "b", "c", "c", "d", "a")
x[1] ## Extract the first element
x[2] ## Extract the second element
x[1:4]
x[c(1, 3, 4)]
u <- x > "a"
u
x[u]
x[x > "a"]
#Subsetting a Matrix
x <- matrix(1:6, 2, 3)
x
x[1, 2]
x[2, 1]
x[1, ] ## Extract the first row
x[, 2] ## Extract the second column
#Subsetting Lists
x <- list(foo = 1:4, bar = 0.6)
x
x[[1]]
x[1]
x[["bar"]]
x$bar
x[[1]][[3]] ## Get the 3rd element of the 1st element
## 3rd element of the 1st element
x[[c(1, 3)]]
#Removing NA Values
x <- c(1, 2, NA, 4, NA, 5)
bad <- is.na(x)
print(bad)
x[!bad]
#For Multiplr Variables
x <- c(1, 2, NA, 4, NA, 5)
y <- c("a", "b", NA, "d", NA, "f")
good <- complete.cases(x, y)
good
x[good]
y[good]
setwd("C:/Users/l/Desktop/DSBDA 2017")  # Note /
airquality<-read.csv("C:/Users/l/Desktop/DSBDA 2017/AirQualityUCI.csv", header=FALSE, sep=";")
head(airquality)            #  Shows first 6 rows
good <- complete.cases(airquality)
head(airquality[good, ])
#Vector operations
x <- 1:4
y <- 6:9
z <- x + y
z
x > 2
x >= 2
x[x>2]
x - y
x * y
x / y
x %*% y # dot product

x <- matrix(1:4, 2, 2)
y <- matrix(rep(10, 4), 2, 2)

## element-wise multiplication
x * y
## element-wise division
x / y
## true matrix multiplication
x %*% y
#Dates and Times
# Dates are stored internally as the
#number of days since 1970-01-01 while times 
#are stored internally as the number of seconds since 1970-01-01.

## Coerce a 'Date' object from character
x <- as.Date("1970-01-01")
x
#Control Structures
#if-else
if(<condition>) {
  ## do something
}
## Continue with rest of code
#######################################

if(<condition>) {
  ## do something
}
else {
  ## do something else
}
##########################################

if(<condition1>) {
  ## do something
} else if(<condition2>) {
  ## do something different
} else {
  ## do something different
}
########################################

## Generate a uniform random number
x <- runif(1, 0, 10)
if(x > 3) {
  y <- 10
} else {
  y <- 0
}
y
#####################################
y <- if(x > 3) {
  10
} else {
  0
}
#####################################
# For Loops
for(i in 1:10) {
    print(i)
  }
#####################################
x <- c("a", "b", "c", "d")
for(i in 1:4) {
    ## Print out each element of 'x'
      print(x[i])
}
##################################
for(i in seq_along(x)) {
  print(x[i])
}
####################################
for(letter in x) {
  print(letter)
}
##################################
for(i in 1:4) print(x[i])
##################################
#Nested For Loops
x <- matrix(1:6, 2, 3)
for(i in seq_len(nrow(x))) {
  for(j in seq_len(ncol(x))) {
    print(x[i, j])
  }
}
x[1,3]
#######################################
#while Loops
count <- 0
while(count < 10) {
  print(count)
  count <- count + 1
}
#################################
# Functions in R

f <- function() {
  ## This is an empty function
     }
## Functions have their own class
class(f)
#############################
f <- function(a) {
   a^2}
f(2)
##################
f <- function(a,b) {
  a^2+b^2}
f(2,3)
#######################
y <- 10
  f <- function(x) {
     y <- 2
    y^2 + g(x)
  }
  g <- function(x) {
    x*y
  }
  f(3)
######################
#Loop Functions
#lapply(): Loop over a list and evaluate a function on each element
  #. sapply(): Same as lapply but try to simplify the result
  #. apply(): Apply a function over the margins of an array
  #. tapply(): Apply a function over subsets of a vector
  #. mapply(): Multivariate version of lapply
  