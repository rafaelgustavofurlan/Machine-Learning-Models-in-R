#install.packages('arules')
library(arules)

# data pre processing
dataset <- read.csv('Market_Basket_Optimisation.csv', header = FALSE)
dataset <- read.transactions('Market_Basket_Optimisation.csv', sep = ',', rm.duplicates = TRUE)

summary(dataset)

itemFrequencyPlot(dataset, topN = 100)
itemFrequencyPlot(dataset, topN = 10)

# treinando o modelo 
rules <- eclat(data = dataset, parameter = list(support = 0.003, minlen = 2))

# visualizando os resultados (regras)
inspect(sort(rules, by = 'support')[1:10])
