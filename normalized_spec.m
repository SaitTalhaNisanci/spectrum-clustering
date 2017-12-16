function clusters = normalized_spec(A,k)
    % construct similarity matrix
    similarityMatrix = constructSimilarityMatrix(A);
    % construct the weighted adjacency graph
    W = similarityGraph(similarityMatrix,k);
    % construct the Degree Matrix
    D = degree(W);
    % construct the unnormalized laplacian matrix
    L = normalizedLaplacian(D,W);
    % calculate the first k eigenvectors of L
    U = firstKEigenVectors(L,k);
    % normalize rows of matrix U
    T = normalizeRows(U);
    % index of clusters
    clusters = kmeans(U,k);
    plotClusters(clusters,A,k);
end
function plotClusters(clusters,A,k)
    colors = ['g','b','r','y','m','c','k'];
    figure;
    hold on;
    for i=1:size(clusters)
        plot(A(i,1),A(i,2),'*','Color',colors(clusters(i)));
    end    
end
function W = similarityGraph(similarityMatrix,k)
    % k nearest neighbors
    W = zeros(size(similarityMatrix,1),size(similarityMatrix,1));
    for i= 1:size(similarityMatrix)
        % sort in descending order and choose the first k elements
        [~,indexes] = sort(similarityMatrix(i,:),'descend');
        for j=1:k
            W(i,indexes(j)) = similarityMatrix(i,indexes(j));
            W(indexes(j),i) = similarityMatrix(i,indexes(j));  
        end    
    end    
    
end

function D = degree(M)
  D = diag(sum(M));
end

function L = normalizedLaplacian(D,W)
    L =eye(size(D,1)) -D\W;
end

function eigenVectors = firstKEigenVectors(A,k)
    [eigenVectors,~] = eigs(A,k,'smallestabs');
end

function similarityMatrix = constructSimilarityMatrix(A)
    similarityMatrix = zeros(size(A,1),size(A,1));
    for i=1:size(A,1)
        for j=i+1:size(A,1)
            similarityMatrix(i,j) = similarityValue(A(i,:),A(j,:));
            similarityMatrix(j,i) = similarityValue(A(i,:),A(j,:));
        end    
    end    
end

function similarityValue = similarityValue(x,y)
    % gaussian kernel 
    similarityValue = exp(-2.71*sqrt(sum((x - y) .^ 2)));
end

function T = normalizeRows(A)
    T = bsxfun(@rdivide,A,sqrt(sum(A.^2,2)));
    T(~isfinite(T)) = 1; % 
end