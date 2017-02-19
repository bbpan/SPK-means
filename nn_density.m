function [ind, Index, idx, sumd, center] = nn_density(data,num_clu,mix_pro,dist);

% Calculate the KNN density of the data points with different 'nn' and 
% choose the results with minimum reconstruction error

% INPUTS:
% data is an (n x d) matrix
% num_clu is the number of clusters
% mix_pro is the percentage of low density data
% dist is the distance matrix of the data

% OUTPUTS:
% ind is the index of the sorted data density
% Index is the index of the sorted distance matrix
% idx(j) is the index of the cluster for data point j; 
% idx(j)==j indicates data point j is itself a cluster.
% center is the cluster centers
% sumd is the value of objective function for high density data

% AUTHOR: 
% Binbin Pan, College of Mathematics and Statistics, Shenzhen University,
% China, 2017

n = size(data,1);
max_nn = floor(n/(num_clu));
nn = floor([0.1:0.1:1]*max_nn);
len_nn = length(nn);
num_high = floor(n*(1-mix_pro));   % number of high density data

% compute the density using K-NN Density Estimator (KDE)
[D,Index] = sort(dist,'ascend');

sumd = Inf;
for i = 1:len_nn
   Den = 1./(D(nn(i)+1,:)+eps);
    [~,ind0] = sort(Den,'descend');
    high_data = data(ind0(1:num_high),:);
 
    [idx0,cen,sumd0] = k_means(high_data, 'random', num_clu);

    if sumd0 < sumd
        sumd = sumd0;
        idx = idx0;
        ind = ind0;
        center = cen;
    end
end
