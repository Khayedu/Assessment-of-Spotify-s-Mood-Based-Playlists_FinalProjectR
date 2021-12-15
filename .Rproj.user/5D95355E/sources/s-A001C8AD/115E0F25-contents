# Normalizing Data ------------------------------------------------------------

# Columns to evaluate
data <- read_csv("Data - Clean/fulllist.csv") #loading data from CSV
col.features <- names(data[c(1,3,4,5,6,7,8,9,10)])

# Normalize data
X <- data[col.features]

X.n <-scaler(X[2:8])

# Kmeans Calculation for normalized data no PCA [Fail] ------------------------------------------------------

# K = number of clusters
K <-4


#Clustering Kmeans
set.seed(1) #Set the seed for reproducibility
km <- kmeans(X.n,K)
km

#visualizing Kmeans
fviz_cluster(km,X.n)
table(km$cluster)

# Analysis method euclidean (distance matrix)
dd <- dist(X.n,method="euclidean")
km_stats <- cluster.stats(dd,km$cluster)


# Silhouette analysis
sil <- silhouette(km$cluster,dd)
fviz_silhouette(sil)
paste("The Dunn Index is ",km_stats$dunn)

# PCA of Variables --------------------------------------------------------

Pca <- prcomp(X.n, #pca of all normalized data starting at column 2
                  center = TRUE, scale. = TRUE)

summary(Pca)
#Ploting PCA 1 and PCA 2
plot(Pca$x[,1], Pca$x[,2], frame = TRUE)

#Showing what PC has the most %
pca.var <- Pca$sdev^2
pca.v.per <- round(pca.var/sum(pca.var)*100, 1)
#plotting Bargraph of PC's %
barplot(pca.v.per, main = "scree Plot", xlab = "Principal Componet", ylab = "Percent Variation")



# Kmeans for PCA ----------------------------------------------------------
set.seed(7) #Set the seed for reproducibility
PC <- Pca$x #turning Principle components (PC) into object
head(PC)

#combing Playlist names with PC's
kinput <- cbind.data.frame(X[,9], PC[,1:4])

#calculating Kmeans of PCs
Km.out <- kmeans(kinput[,2:5], K)


#plotting clusters with original data
fviz_cluster(Km.out, kinput[,2:5])
#Shows how many data points (songs) are in each cluster
table(Km.out$cluster)



# Analysis of accuracy of Kmeans ------------------------------------------

# Analysis method euclidean (distance matrix)
PCK.dd <- dist(kinput[,2:5],method="euclidean")
k_stats <- cluster.stats(PCK.dd,Km.out$cluster)


# Silhouette analysis
sil.kpca <- silhouette(Km.out$cluster,PCK.dd)
#plotting Silhouette analysis to find average with (= 0.42)
fviz_silhouette(sil.kpca)


# Comparing labels and -------------------------------------------------------------------------
#adding the labels back into the Kmeans output

Km_labels <- cbind.data.frame(Km.out$cluster, data[, c(1, 2, )])

# Cross-tab of clustering & known labels
library(gmodels)
CrossTable(kinput$Playlist, Km_labels$`Km.out$cluster`)

Ctable <- data.frame(CrossTable(kinput$Playlist, Km_labels$`Km.out$cluster`))

