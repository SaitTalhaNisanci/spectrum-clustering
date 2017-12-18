function plotClusters(clusters, A, dataset, approach)
    colors = ['g','b','r','y','m','c','k'];
    figure;
    hold on;
    title(['Dataset:' dataset ' - Approach: ' approach]);
    for i=1:size(clusters)
        plot(A(i,1),A(i,2),'*','Color',colors(clusters(i)));
    end    
end