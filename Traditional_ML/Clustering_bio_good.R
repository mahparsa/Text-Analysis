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
# ignore extremely rare words i.e. terms that appear in less then 1% of the documents
minTermFreq <- ndocs * 0.01
# ignore overly common words i.e. terms that appear in more than 50% of the documents
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

#dtm <- dtm[, names(head(sort(colSums(as.matrix(dtm))), 400))]
#dtm <- dtm[, names(sort(colSums(as.matrix(dtm))))]
#print(as.matrix(dtm))
write.csv((as.matrix(dtm)), "test.csv")
#head(sort(as.matrix(dtm)[18,], decreasing = TRUE), n=15)
dtm.matrix = as.matrix(dtm)
#wordcloud(colnames(dtm.matrix), dtm.matrix[28, ], max.words = 20)
#dtm <- weightTfIdf(dtm, normalize = TRUE)
dtm.matrix = as.matrix(dtm)
#wordcloud(colnames(dtm.matrix), dtm.matrix[28, ], max.words = 20)
#inspect(dtm)
write.csv((as.matrix(dtm)), "test.csv")

m  <- as.matrix(dtm)
# # # m <- m[1:2, 1:3]
distMatrix <- dist(m, method="euclidean")
#print(distMatrix)
#distMatrix <- dist(m, method="cosine")
#print(distMatrix)
groups <- hclust(distMatrix,method="ward.D")
plot(groups, cex=0.9, hang=-1)
rect.hclust(groups, k=5)
groups$order


kmeans(distMatrix, 5)

kfit <- kmeans(distMatrix, 5, nstart=100)
#plot – need library cluster
library(cluster)
clusplot(m, kfit$cluster, color=T, shade=T, labels=2, lines=0)
plot(kfit$size)

plot(kfit$size,main="Numbers of Cluster Nembers", xlab="Clusters",ylab = "#members",type="o",col="blue" )
#Elbow Method for finding the optimal number of clusters
set.seed(123)
# Compute and plot wss for k = 2 to k = 15.
#k.max <- 4
#data <- as.matrix(dtm)
#wss <- sapply(1:k.max, 
 #             function(k){kmeans(data, k, nstart=50,iter.max = 15 )$tot.withinss})
#wss
#plot(1:k.max, wss,
 #    type="b", pch = 19, frame = FALSE, 
  #   xlab="Number of clusters K",
  #   ylab="Total within-clusters sum of squares")



#Elbow Method for finding the optimal number of clusters

heatmap(as.matrix(distMatrix), symm = TRUE,
        distfun = function(x) as.dist(x))

