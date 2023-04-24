# MVIS 5301.01
# Homework for Week 6

install.packages('dplyr','limma', 'ggplot2')

library(dplyr)
library(limma)
library(ggplot2)

x <- 5

y <- 5

x + y

number <- x + y

# Exercises
# What happens when we change 
# the value of x = 5?
# Try changing the value of y to 10.
# How do you update the variable 'number?'

# Data Types
# You don't use 'complex' or 'raw' very much.
# You use the other data types all the time.
# Single quotes or double quotes don't matter for strings.
# Booleans can be shortened to T or F.
# 'double' is a subtype of numeric variable.

# Vectors
glengths <- c(4.6, 3000, 5000)
glengths

species <- c("ecoli", "human", "corn")
species

# Exercises
combined  <- c(glengths,species)
class(combined)

combined2 <- c(glengths, species)
combined
str(combined)
str(combined2)

expression <- c("low", "high", "medium", "high", "low", "medium", "high")
expression <- factor(expression)

# Exercises
samplegroup <- c("CTL", "CTL", "CTL", "KO", "KO", "KO", "OE", "OE", "OE")
samplegroup <- factor(samplegroup)

df <- data.frame(species, glengths, stringsAsFactors = FALSE)
?data.frame
# This is not the only way to keep your characters from becoming factors.
# This seems fairly minor, but just doing this saves frustration.
df
str(df)

names(df)
dim(df)
summary(df)

list1 <- list(species, df, number)

# Exercises
list2 <- list(species, glengths, number)
typeof(list2)
str(list2)

###Homework Assignment starts here

data <- read.csv("Lifts_data.csv")


##re-do summary stats to have a group-by
##summary_stats <- data %>% 
  ##summarise(mean_total_kg = mean(TotalKg, na.rm = TRUE))

##Create data subsets
male_data <- filter(data, Sex == "M")

female_data <- filter(data, Sex == "F")


ggplot(male_data, aes(x = Age)) +
  geom_histogram(binwidth = 5, color = "black", fill = "lightblue") +
  labs(title = "Histogram of Age for Males", x = "Age", y = "Count")

ggplot(female_data, aes(x = Age)) +
  geom_histogram(binwidth = 5, color = "black", fill = "pink") +
  labs(title = "Histogram of Age for Females", x = "Age", y = "Count")

