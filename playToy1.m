load('toy1.mat')
K = 7;
norm_clusters = normalized_spec(X,K);
unnorm_clusters = unnormalized_spec(X,K);
kmeans_clusters = kmeans(X, K);

plotClusters(norm_clusters, X, 'Toy1', 'Normalized Spec. Clus.');
plotClusters(unnorm_clusters, X, 'Toy1', 'Unnormalized Spec. Clus.');
plotClusters(kmeans_clusters, X, 'Toy1', 'K Means Clustering');