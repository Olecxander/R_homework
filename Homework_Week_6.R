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

##a little more cleanup.
data$WeightClassKg <- as.numeric(as.character(data$WeightClassKg))


##explore weight class

data_w <- na.omit(data[!is.na(data$WeightClassKg),])

##subset to explore by m and f  
male_data <- filter(data_w, Sex == "M")

female_data <- filter(data_w, Sex == "F")

data %>% 
  group_by(Level) %>% 
  summarise(mean = mean(TotalKg, na.rm = TRUE),
            sd = sd(TotalKg, na.rm = TRUE),
            min = min(TotalKg, na.rm = TRUE),
            q1 = quantile(TotalKg, probs = 0.25, na.rm = TRUE),
            median = median(TotalKg, na.rm = TRUE),
            q3 = quantile(TotalKg, probs = 0.75, na.rm = TRUE),
            max = max(TotalKg, na.rm = TRUE))

ggplot(male_data, aes(x = Age)) +
  geom_histogram(binwidth = 5, color = "black", fill = "#0d6efd") +
  labs(title = "Histogram of Age for Males", x = "Age", y = "Count")

ggplot(female_data, aes(x = Age)) +
  geom_histogram(binwidth = 5, color = "black", fill =  "#d63384") +
  labs(title = "Histogram of Age for Females", x = "Age", y = "Count")

avg_total_by_weight_sex <- data_w %>%
  group_by(WeightClassKg, Sex) %>%
  summarise(avg_totalkg = mean(TotalKg, na.rm = TRUE))

ggplot(avg_total_by_weight_sex , aes(x = WeightClassKg, y = avg_totalkg, color = Sex, group = Sex)) + 
  geom_line(size = 1.5) +
  scale_color_manual(values = c("#0d6efd", "#d63384")) +
  labs(x = "Weight Class (kg)", y = "Average Total (kg)", color = "Sex") +  
  theme_classic() +  
  theme(legend.position = "top")

ggplot(data_w, aes(x = BodyweightKg, y = TotalKg, color = Sex)) + 
  geom_point(alpha = 0.1) +
  scale_color_manual(values = c("#d63384", "#0d6efd")) + 
  labs(x = "Body Weight (kg)", y = "Total Kg", color = "Sex") + 
  theme_classic() 

ggplot(avg_total_by_weight_sex, aes(x = WeightClassKg, y = avg_totalkg, fill = Sex)) +
  geom_col(position = "dodge", width = 3.5) +
  scale_fill_manual(values = c("#0d6efd", "#d63384")) +
  labs(x = "Weight Class (kg)", y = "Average Total (kg)", fill = "Sex") +
  theme_classic() +
  theme(legend.position = "top")



