## Download packages
install.packages("arules")
install.packages("arulesViz")

## Import packages
library(arules)
library(arulesViz)

## Import dataset
data <- read.csv("nursery.csv")

## Cek ringkasan dataset
str(data)
summary(data)

## Menerapkan association rules (apriori)
rules <- apriori(data)
rules <- sort(rules, by="lift")
inspect(rules)

## Parameter
params = list(minlen = 5,
              support = 0.003,
              confidence = 0.9)

## Rule baru dengan parameter + appearance
rules <- apriori(data,
                 parameter = params,
                 appearance = list(rhs = c('final.evaluation=priority'),
                                   default = 'lhs'))

## Menampilkan rule baru
rules <- sort(rules, by="lift")
inspect(rules[1:10])


subset_matrix <- is.subset(rules, rules)
subset_matrix[lower.tri(subset_matrix)] <- FALSE

redundant <- colSums(subset_matrix) > 1

rules_redundant <- rules[redundant]
inspect(rules_redundant[1:10])

rules_pruned <- rules[!redundant]
inspect(rules_pruned[1:10])

plot(rules_pruned)
plot(rules_pruned, method='grouped')
plot(rules_pruned, method='graph')
plot(rules_pruned, method='graph', control=list(type='items'))

