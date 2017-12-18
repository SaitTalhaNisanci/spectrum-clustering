load('realdata.mat');
K = 10;
A = [mean(X,1)' var(X,0,1)'];
A = A(1:10,:);
norm_clusters = normalized_spec(A, K);
unnorm_clusters = unnormalized_spec(A, K);
kmeans_clusters = kmeans(A, K);
