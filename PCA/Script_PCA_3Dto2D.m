%% Script: PCA 3D to 2D
%
% Author: Elia Matsumoto
%
% Contact: elia.matsumoto@fgv.br
% 
%% Reset Environemnt
rng('shuffle'); % Random seed
close all       % Close all figure
clear           % Clear workspace
clc             % Clear command window

%% Load Data
load Data_3D

%% Plot data
figure
scatter3(DATA(:,1),DATA(:,2),DATA(:,3));
xlabel('Var 1');
ylabel('Var 2');
zlabel('Var 3');
axis equal

%% Principal Components: PC1, PC2
[coeff, score, latent, tsquared, explained] = pca(DATA);

%% Percent variability explained by principal components
disp('Percent variability explained by principal components');
disp(explained);
disp('PC1 + PC2');
disp(explained(1)+explained(2));

%% Plot principal components
figure
scatter3(score(:,1),score(:,2),score(:,3))
axis equal
xlabel('1st Principal Component')
ylabel('2nd Principal Component')
zlabel('3rd Principal Component')
axis equal

%% Visualize both the orthonormal principal component coefficients for each variable and the principal component scores for each observation in a single plot.
figure
biplot(coeff(:,1:2),'scores',score(:,1:2),'varlabels',{'Var 1','Var 2','Var 3'});