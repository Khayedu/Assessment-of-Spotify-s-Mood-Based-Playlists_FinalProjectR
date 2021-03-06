
# Plotting PCA ------------------------------------------------------------

#plotting Bargraph of PC's %
barplot(pca.v.per, main = "scree Plot", xlab = "Principal Componet", ylab = "Percent Variation")


# Plotting Kmeans for PCA -------------------------------------------------

#plotting clusters with original data
fviz_cluster(Km.out, kinput[,2:5])

#plotting Silhouette analysis to find average with (= 0.42)
fviz_silhouette(sil.kpca)
