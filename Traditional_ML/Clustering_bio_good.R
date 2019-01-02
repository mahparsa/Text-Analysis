library(topicmodels)
library(tm)
library(NLP)
library(tidytext)
library(ggplot2)
library(dplyr)
library(cluster)
library(wordcloud)
library(slam)
cname <- file.path("~", "Desktop", "TEXT_bio")
corpus<-Corpus(DirSource(cname))
dir(cname)
summary(corpus)
 
ndocs <- length(corpus)
minTermFreq <- ndocs * 0.01
maxTermFreq <- ndocs * .5
dtm = DocumentTermMatrix(corpus,
                         control = list(
                           stopwords = TRUE, 
                           wordLengths=c(4, 15),
                           removePunctuation = T,
                           removeNumbers = T,
                           #stemming = T,
                           bounds = list(global = c(minTermFreq, maxTermFreq))
                         ))

inspect(dtm)
write.csv((as.matrix(dtm)), "test.csv")
dtm.matrix = as.matrix(dtm)
m  <- as.matrix(dtm)
distMatrix <- dist(m, method="euclidean")

groups <- hclust(distMatrix,method="ward.D")
plot(groups, cex=0.9, hang=-1)
rect.hclust(groups, k=5)
groups$order
kmeans(distMatrix, 5)

kfit <- kmeans(distMatrix, 5, nstart=100)
library(cluster)
clusplot(m, kfit$cluster, color=T, shade=T, labels=2, lines=0)
plot(kfit$size)
plot(kfit$size,main="Numbers of Cluster Nembers", xlab="Clusters",ylab = "#members",type="o",col="blue" )
#Elbow Method for finding the optimal number of clusters
set.seed(123)
heatmap(as.matrix(distMatrix), symm = TRUE,
        distfun = function(x) as.dist(x))

