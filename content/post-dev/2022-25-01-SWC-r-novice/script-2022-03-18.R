# Review

# Reading data into R
read.csv(file = "data/inflammation-01.csv")
read.csv(file = "data/inflammation-02.csv")

# Assigning variables/objects
my_data1 <- read.csv(file = "data/inflammation-01.csv")
my_data2 <- read.csv(file = "data/inflammation-02.csv")

patient1 <- 1
new_patients <- 30:40
new_patients <- seq(30, 40)
my_patients <- seq(30, 40, 2)
healthy_patients <- c(1, 15, 33)

class(new_patients) #mode(), typeof()
length(new_patients)
str(new_patients)
dim(new_patients)

# Structure of a data.frame
class(my_data)
length(my_data)
nrow(my_data)
ncol(my_data)
dim(my_data)

# Subsetting a data.frame

## Square brackets and numbers
my_data[5, 3]

## Square brackets and column/row names
my_data["5", "X0"]

## Dollar sign

my_data$X0

## Dollar sign and square brackets

my_data$X3[10]

# Exercise 2.1, create an object with name day15 
# with inflammation values from all patients from day 15.
# Extra: Use at least three different subsetting modes

# Calculating summary statistics on my data

## Summary of a day
mean(day15)
min(day15)
max(day15)
sd(day15)
median(day15)

summary(day15)

## Summary of all days

xx <- summary(my_data)
class(xx)
dim(xx)
xx[1,1]

## Get summary per patient: introducing the apply() and help() functions

apply(my_data, 1, summary)

## Get summary stats per day: 
## the scope of the mean() function and
## practicing apply()


mean(my_data)
average_day_inflammation <- apply(my_data, 2, mean)

# Exercise 2.2: get min and max inflammation per day, and mean, 
# min and max inflammation per patient
min_day_inflammation <- apply(my_data, 2, min)
max_day_inflammation <- apply(my_data, 2, max)

average_patient_inflammation <- apply(my_data, 1, mean)
min_patient_inflammation <- apply(my_data, 1, min)
max_patient_inflammation <- apply(my_data, 1, max)

# Plotting average inflammation per day: introducing plot()
plot(average_day_inflammation)

# Plot min and max inflammation per day: showing more plot()
plot(min_day_inflammation)
plot(max_day_inflammation)

# Exercise. Plot mean, min and max inflammation per 
# patient: practicing plot()


## Plotting sd inflammation per day: Introducing nesting functions
plot(apply(my_data, 2, sd))

## Introducing the xlab and ylab arguments of plot()
plot(apply(my_data, 2, sd),
     xlab = "Day",
     ylab = "sd of Inflammation")

# Plotting data on the same graph

# Telling R that we are adding data to the
# existing plot with the function par(): 
# introducing the graphical parameters defined in par
help(par)

par()

# Using par(new = TRUE)
plot(average_day_inflammation)
par(new = T)
plot(min_day_inflammation)

# Assigning empty axis labels:

plot(average_day_inflammation, 
     xlab = "Day", 
     ylab = "Inflammation")
par(new = T)
plot(min_day_inflammation, 
     xlab = "", 
     ylab = "")

# Assigning a limit for the y axis: the ylim argument
y_axis_limit <- c(0, 30)
plot(average_day_inflammation, 
     xlab = "Day", 
     ylab = "Inflammation",
     ylim = y_axis_limit)
par(new = T)
plot(min_day_inflammation, 
     xlab = "", 
     ylab = "",
     ylim = y_axis_limit)

# Adding colors: the col argument
plot(average_day_inflammation, 
     xlab = "Day", 
     ylab = "Inflammation",
     ylim = y_axis_limit,
     col = "red")
par(new = T)
plot(min_day_inflammation, 
     xlab = "", 
     ylab = "",
     ylim = y_axis_limit)

# Exercise: Add max inflammation in blue color OR 
# explore r colors with the colors() function:
# practicing par(new = TRUE) and that
# par() resets each time you run plot!
plot(average_day_inflammation, 
     xlab = "Day", 
     ylab = "Inflammation",
     ylim = y_axis_limit,
     col = "red")
par(new = T)
plot(min_day_inflammation, 
     xlab = "", 
     ylab = "",
     ylim = y_axis_limit)
par(new = T)
plot(max_day_inflammation, 
     xlab = "", 
     ylab = "",
     ylim = y_axis_limit,
     col = "blue")

# Adding point symbols: the pch argument of plot()
# and the help of points()
plot(average_day_inflammation, 
     xlab = "Day", 
     ylab = "Inflammation",
     ylim = y_axis_limit,
     col = "red",
     pch = 1)
par(new = T)
plot(min_day_inflammation, 
     xlab = "", 
     ylab = "",
     ylim = y_axis_limit,
     pch = 5)
par(new = T)
plot(max_day_inflammation, 
     xlab = "", 
     ylab = "",
     ylim = y_axis_limit,
     col = "blue",
     pch = 6)
# Adding a legend: the functions legend() and locator(1)
help(legend)
legend(x = 5, 
       y = 30, 
       legend = c("Min", "Max", "Mean"), 
       col = c("black", "blue", "red"),
       pch = c(5,6,1))
locator(1)

# Reducing the size of the legend: the cex argument()

legend(x = 2.2, 
       y = 28.7, 
       legend = c("Min", "Max", "Mean"), 
       col = c("black", "blue", "red"),
       cex = 0.5,
       pch = 1)

# Saving my plots: intro to dir.create(), pdf() and dev.off()
# everything within pdf() and dev.off() is written to pdf
# until dev.off() is called, the plot is not written!
# i.e., the connection between R and the system is not closed.

dir.create("results")
pdf("results/inflammation-01.pdf")

plot(average_day_inflammation, 
     xlab = "Day", 
     ylab = "Inflammation",
     ylim = y_axis_limit,
     col = "red",
     pch = 1)
par(new = T)
plot(min_day_inflammation, 
     xlab = "", 
     ylab = "",
     ylim = y_axis_limit,
     pch = 5)
par(new = T)
plot(max_day_inflammation, 
     xlab = "", 
     ylab = "",
     ylim = y_axis_limit,
     col = "blue",
     pch = 6)
legend(x = 2.2, 
       y = 28.7, 
       legend = c("Min", "Max", "Mean"), 
       col = c("black", "blue", "red"),
       cex = 0.5,
       pch = 1)

dev.off()


# Making functions with arguments

## Explaining the general form of a function assignment:
# name_of_my_function <- function(...arguments..) {
#   ...body of the function...
#   includes all the operations we want
#   to perform using the arguments
# }

# Create your first function with one argument:

naming <- function(name = "Luna"){
  print(name)
}

naming <- function(name){
  print(name)
}

my_name <- function() {
  print("Luna L. Sanchez Reyes")
}

# Exercise 1.7, review
# Create a function named "analyze", 
# that takes a file name as argument
# and creates a min, max and mean plot of inflammation per day

analyze <- function(my_file) {
  
}

# defining default values for arguments
analyze <- function(my_file, header = FALSE) {
  
}

# Running analyze with different files.
analyze("data/inflammation-03.csv")
analyze("data/inflammation-11.csv")


# Running the analyze function on all my inflammation files
## Creating a vector of file names: the function list.files()

list.files(path = "data", pattern = "inflammation")

## We need the full path: the argument full.names

list.files(path = "data", 
           pattern = "inflammation",
           full.names = TRUE)
# Exercise: create a vector called my_files with the 
# names and path of all csv inflammation files within 
# the data folder. We will use it later!

my_files <- list.files(path = "data", 
                       pattern = "inflammation",
                       full.names = TRUE)

# Running a function several times for different 
# values of an argument: for loops
# Explain at the end why this is different than functions!

# The general form of a loop:

# for (variable in collection) {
#   do things with variable
# }

# run print function on my_files: showcase for loops

for (a_file in my_files) {
  print(a_file)
}

# run naming function on my_files: showcase for loops

for (a_file in my_files) {
  naming(a_file)
}

# Exercise: create a for loop that uses each file 
# name within the my_files collection, and prints the file name
# and then runs the analyze function using the file name.
for (f in my_files) {
  print(f)
  analyze(f)
}

# the final goal is to analyze all my files with the 
# least lines of code possible.
# Exercise: Write a function that uses the for loop to run analyze
# on a set of files that match a pattern

analyze_all <- function(folder = "data", pattern) {
  # Runs the function analyze for each file in the given folder
  # that contains the given pattern.
  filenames <- list.files(path = folder, 
                          pattern = pattern, 
                          full.names = TRUE)
  for (f in filenames) {
    analyze(f)
  }
}

# Problem: analyze_all creates 36 plots, 
# how can we save them automatically if we want to
# but do not make it the default behavior in case we want
# to see them on RStudio?

# We need to learn how to tell R to make choices 
# based on the values of an argument: conditionals 
## introducing logical comparisons
num <- 37
num > 100
num < 100
num == 100
num != 100
num <= 100
num >= 100

# introducing if else statements
## the general form of an if else:
# if (logical comparison is TRUE) {
#   do something
# } else { 
#   do something else
# }

# Example
if (num > 100) {
  print("greater")
} else {
  print("not greater")
}
print("done")

# A single if

num <- 53
if (num > 100) {
  print("num is greater than 100")
}

# Adding else if when there are more than two options:
num <- -28
  if (num > 0) {
    print("positive")
  } else if (num == 0) {
    print(0)
  } else {
    print("negative")
  }

# Exercise: Find the file with the Maximum Inflammation Score
filenames <- list.files(path = "data", pattern = "inflammation-[0-9]{2}.csv", full.names = TRUE)
filename_max <- "" # filename where the maximum average inflammation patient is found
patient_max <- 0 # index (row number) for this patient in this file
average_inf_max <- 0 # value of the average inflammation score for this patient
for (f in filenames) {
  dat <- read.csv(file = f, header = FALSE)
  dat.means <- apply(dat, 1, mean)
  for (patient_index in 1:length(dat.means)){
    patient_average_inf <- dat.means[patient_index]
    # Add your code here ...
    if (patient_average_inf > average_inf_max) {
      average_inf_max <- patient_average_inf
      filename_max <- f
      patient_max <- patient_index
    }
    # ... End of solution
  }
}
print(filename_max)
print(patient_max)
print(average_inf_max)

# Let's update analyze() to save graphs as pdfs
# conditionally on the presence of an argument:
# functions can have alternative behaviors,
# introducing the functions is.missing() and is.null()

analyze <- function(filename, output = NULL) {
  # Plots the average, min, and max inflammation over time.
  # Input:
  #    filename: character string of a csv file
  #    output: character string of pdf file for saving
  if (!is.null(output)) {
    pdf(output)
  }
  dat <- read.csv(file = filename, header = FALSE)
  avg_day_inflammation <- apply(dat, 2, mean)
  plot(avg_day_inflammation)
  max_day_inflammation <- apply(dat, 2, max)
  plot(max_day_inflammation)
  min_day_inflammation <- apply(dat, 2, min)
  plot(min_day_inflammation)
  if (!is.null(output)) {
    dev.off()
  }
}

# Finally, let's update analyze_all() to save the graphs as pdf.
# the function sub()

pdf_file <- sub("csv", "pdf", "inflammation-01.csv")

# the function file.path() to save a file to a path

pdf_path_file <- file.path("results", pdf_file)

# update:
analyze_all <- function(pattern) {
  # Directory name containing the data
  data_dir <- "data"
  # Directory name for results
  results_dir <- "results"
  # Runs the function analyze for each file in the current working directory
  # that contains the given pattern.
  filenames <- list.files(path = data_dir, 
                          pattern = pattern)
  for (f in filenames) {
    pdf_file <- sub("csv", "pdf", f)
    pdf_name <- file.path(results_dir, pdf_file)
    analyze(file.path(data_dir, f), output = pdf_name)
  }
}
