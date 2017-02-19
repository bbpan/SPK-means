function dist = distance_matrix(data);

% calculate the distance matrix between the data points
% data is an (n x d) matrix
% dist is an (n x n) matrix

n = size(data,1);
XXh = sum(data.^2,2)*ones(1,n);
gram = data*data';
dist = XXh+XXh'-2*gram;
dist = sqrt(dist);