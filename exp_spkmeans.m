function exp_spkmeans();

% experiment on sun-moon example
load('sun-moon.mat');
dist = distance_matrix(data);
idx = spk_means(data,2,0.3,dist);
plot_scattered(data,idx);
title('The partition of sun-moon example using SPK-means');
clear

% experiment on iris data set
disp(['##########  iris  ##########']);
load('./uci_data_sets/iris.mat','dataset');
num_run = 100;
data = dataset.X;
label = dataset.y;
num_clu = length(unique(label));
dist = distance_matrix(data);
nmi_score = zeros(num_run,1);

for i=1:num_run
    idx = spk_means(data,num_clu,0.5,dist);
    nmi_score(i) = nmi(idx,label);
end
disp(['SPK-Means: average NMI = ',num2str(mean(nmi_score)),',standard deviation of NMI = ',num2str(std(nmi_score))]);