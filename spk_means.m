function [idx, center, sumd] = spk_means(data,num_clu,mix_pro,dist);

% Semi-Parametric K-Means (SPK-means) algorithm
% Frst estimate the data density using k nearest neighbors;
% Then group the high density data using K-Means;
% Finally cluster the low density data using nearest neighbors clustering.

% INPUTS:
% data is an (n x d) matrix
% num_clu is the number of cluster
% mix_pro is the percentage of low density data
% dist is the distance matrix of the data

% OUTPUTS:
% idx(j) is the index of the cluster for data point j; 
% idx(j)==j indicates data point j is itself a cluster.
% center is the cluster centers
% sumd is the value of objective function for high density data

% AUTHOR: 
% Binbin Pan, College of Mathematics and Statistics, Shenzhen University,
% China, 2017

n = size(data,1);
num_high = floor(n*(1-mix_pro));   % number of high density data
idx = zeros(n,1);  % cluster assignments of the data points

% Calculate the density of the data points
[ind, Index ,idx0, sumd, center] = nn_density(data,num_clu,mix_pro,dist);

% Cluster assignments of high density data
idx(ind(1:num_high)) = idx0;

% Cluster assignments of low density data
for i=(num_high+1):n
    j = 2;
    while idx(Index(j,ind(i)))==0
        j = j+1;
    end
    idx(ind(i)) = idx(Index(j,ind(i)));
end
