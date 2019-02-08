#Association Rule Mining
### install and load required packages
install.packages("arules")
install.packages("arulesViz")
library(arules)
library(arulesViz)
# read and explore the data
groceries <- read.transactions("groceries.csv", sep = ",")
summary(groceries)
inspect(groceries[1:5])
itemFrequency(groceries[, 1:3])
# visualizing item support = 10%
itemFrequencyPlot(groceries, support = 0.1, col="green")
itemFrequencyPlot(groceries, topN = 20, col="red")
# training a model on the data
# default settings support = 0.1 and confidence = 0.8
apriori(groceries)
# adjusting parameters
groceryrules <- apriori(groceries, parameter = list(support = 0.006, confidence = 0.25, minlen = 2))
# evaluating model performance
summary(groceryrules)
# inspect somre rules
inspect(groceryrules[1:3])
# sorting the set of association rules
inspect(sort(groceryrules, by = "lift")[1:5])
# taking subsets of association rules
berryrules <- subset(groceryrules, items %in% "berries")
inspect(berryrules)
# saving association rules to a file or dataframe
write(groceryrules, file = "groceryrules.csv",
      sep = ",", quote = TRUE, row.names = FALSE)

groceryrules_df <- as(groceryrules, "data.frame")
str(groceryrules_df)
