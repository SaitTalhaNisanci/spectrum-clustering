load('realdata.mat');

K = 10;
A = X';

norm_clusters = normalized_spec(A, K);
unnorm_clusters = unnormalized_spec(A, K);
kmeans_clusters = kmeans(A, K);
