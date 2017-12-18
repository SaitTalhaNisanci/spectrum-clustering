load('toy2.mat')
K = 3;
norm_clusters = normalized_spec(X,K);
unnorm_clusters = unnormalized_spec(X,K);
kmeans_clusters = kmeans(X, K);

plotClusters(norm_clusters, X, 'Toy2', 'Normalized Spec. Clus.');
plotClusters(unnorm_clusters, X, 'Toy2', 'Unnormalized Spec. Clus.');
plotClusters(kmeans_clusters, X, 'Toy2', 'K Means Clustering');