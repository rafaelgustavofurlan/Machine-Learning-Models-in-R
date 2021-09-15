# importando os dados
dataset <- read.csv('Mall_Customers.csv')
X <- dataset[4:5]

# criando o dendograma
dendogram <- hclust(dist(X, method = 'euclidean'), method = 'ward.D')

plot(dendogram,
     main = paste('Dendogram'),
     xlab = 'Customers',
     ylab = 'Euclidean Distances')

# fit do modelo
hc <- hclust(dist(X, method = 'euclidean'), method = 'ward.D')
y_hc <- cutree(hc, 5)
y_hc

# plot dos clusters
library(cluster)
clusplot(X,
         y_hc,
         lines = 0, 
         shade = TRUE,
         color = TRUE,
         labels = 2,
         plotchar = FALSE,
         span = TRUE,
         main = paste('Clusters of Customers'),
         xlab = 'Annual income',
         ylab = 'Spending Score')
