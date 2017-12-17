function clusters = directKMeans(X, k)
    clusters = kmeans(X,k);
    plotClusters(clusters, X);
end

function plotClusters(clusters,A)
    colors = ['g','b','r','y','m','c','k'];
    figure;
    hold on;
    for i=1:size(clusters)
        plot(A(i,1),A(i,2),'*','Color',colors(clusters(i)));
    end    
end