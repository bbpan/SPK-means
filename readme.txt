This is a Matlab program that implements the Semi-Parametric K-Means (SPK-means) algorithm. 
SPK-means combines parametric and non-parametric clustering methods to group the data that
are modeled with a semi-parametric density.
SPK-means is flexible in exploring the different geometric structures of the high and low
density data.

List of the files
exp_spkmeans.m    : two examples showing the performance of SPK-means
spkmeans.m        : SPK-means algorithm
k_means.m         : K-means algorithm
nn_density.m      : computation of the KNN density of the data
distance_matrix.m : computation of the distance matrix between the data
plot_scattered.m  : plot of 2D scattered data
nmi.m             : computation of NMI 
sun-moon.mat      : a sun-moon example used in the paper
original_name.txt : original name of the UCI data sets
   