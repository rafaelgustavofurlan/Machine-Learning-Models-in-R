# importando o dataset
dataset <- read.csv('Mall_Customers.csv')
x <- dataset[4:5]

# metodo do cotovelo para determinar melhor numero de clusters
set.seed(6)
wcss <- vector()
for (i in 1:10) wcss[i] <- sum(kmeans(x, i)$withinss)
plot(1:10, wcss, type = 'b', 
     main = paste('Cluster de clientes'),
     xlab = 'Numero de Clusters',
     ylab = 'WCSS')

# fit do modelo
set.seed(29)
kmeans <- kmeans(x, 5, iter.max = 300, nstart = 10)

# visualizando os clusters
library(cluster)
clusplot(x,
         kmeans$cluster,
         lines = 0,
         shade = TRUE,
         color = TRUE,
         labels = 2,
         plotchar = FALSE,
         span = TRUE,
         main = paste('Cluster de clientes'),
         xlab = 'Annual income',
         ylab = 'Spending Score')