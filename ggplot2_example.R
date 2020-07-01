
#titanic database analysis

library(ggplot2)
getwd()
setwd("/Users/secretary/Desktop")

#loadinng data set

titanic<- read.csv("titanic.csv", stringsAsFactors = FALSE)
View(titanic)

#Set up factors

titanic$Pclass <- as.factor(titanic$Pclass)
titanic$Survived <- as.factor(titanic$Survived)
titanic$Sex <- as.factor(titanic$Sex)
titanic$Embarked <- as.factor(titanic$Embarked)

#checking survival using bar chart as it is categorical data

ggplot(titanic, aes(x = Survived)) + 
geom_bar()

#for percentages

prop.table(table(titanic$Survived))

#Adding some customization for labels and theme.
ggplot(titanic, aes(x = Survived)) + 
  theme_light()+
  geom_bar() +
  labs(y = "Passenger Count",
       title = "Titanic Survival Rates")

#What was the survival rate by gender? 
# We can use color to look at two aspects (i.e., dimensions)
# of the data simultaneously.

ggplot(titanic, aes(x = Sex, fill = Survived)) + 
  theme_bw() +
  geom_bar() +
  labs(y = "Passenger Count",
       title = "Titanic Survival Rates by Sex")


#What was the survival rate by class of ticket? 

ggplot(titanic, aes(x = Pclass, fill = Survived)) + 
  theme_bw() +
  geom_bar() +
  labs(y = "Passenger Count",
       title = "Titanic Survival Rates by Pclass")

# What was the survival rate by class of ticket and gender?

# We can leverage facets to further segment the data and enable
# "visual drill-down" into the data.

ggplot(titanic, aes(x = Sex, fill = Survived)) + 
  theme_bw() +
  facet_wrap(~ Pclass) +
  geom_bar() +
  labs(y = "Passenger Count",
       title = "Titanic Survival Rates by Pclass and Sex")


# Next, we'll move on to visualizing continuous (i.e., numeric)
# data using ggplot2. We'll explore visualizations of single 
# numeric variables (i.e., columns) and also illustrate how
# ggplot2 enables visual drill-down on numeric data.
#


#What is the distribution of passenger ages?

# The histogram is a staple of visualizing numeric data as it very 
# powerfully communicates the distrubtion of a variable (i.e., column).

ggplot(titanic, aes(x = Age)) +
  theme_bw() +
  geom_histogram(binwidth = 5) +
  labs(y = "Passenger Count",
       x = "Age (binwidth = 5)",
       title = "Titanic Age Distribtion")



# What are the survival rates by age?

ggplot(titanic, aes(x = Age, fill = Survived)) +
  theme_bw() +
  geom_histogram(binwidth = 5) +
  labs(y = "Passenger Count",
       x = "Age (binwidth = 5)",
       title = "Titanic Survival Rates by Age")

# Another great visualization for this question is the box-and-whisker 

ggplot(titanic, aes(x = Survived, y = Age)) +
  theme_bw() +
  geom_boxplot() +
  labs(y = "Age",
       x = "Survived",
       title = "Titanic Survival Rates by Age")


# hat is the survival rates by age when segmented by gender and class of ticket?

# A related visualization to the histogram is a density plot. Using ggplot2
# we can use facets to allow for visual drill-down via density plots.

ggplot(titanic, aes(x = Age, fill = Survived)) +
  theme_bw() +
  facet_wrap(Sex ~ Pclass) +
  geom_density(alpha = 0.5) +
  labs(y = "Age",
       x = "Survived",
       title = "Titanic Survival Rates by Age, Pclass and Sex")

# Again using histogram
ggplot(titanic, aes(x = Age, fill = Survived)) +
  theme_bw() +
  facet_wrap(Sex ~ Pclass) +
  geom_histogram(binwidth = 5) +
  labs(y = "Age",
       x = "Survived",
       title = "Titanic Survival Rates by Age, Pclass and Sex")











