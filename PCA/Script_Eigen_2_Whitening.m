%% Script: Eigen - Whitening
%
% Author: Elia Matsumoto
%
% Contact: elia.matsumoto@fgv.br
%
%% Reseting environment
rng('shuffle'); % Random seed
close           % Close all figure
clear           % Clear workspace
clc             % Clear command window

%% load data
load Whitening

%% Scatter plot
figure
scatter(X(:,1),X(:,2));
axis equal
title('Original');

%% Covariation matrix
M = cov(X)

%% Correlation matrix
C = corr(X)

%% Eigenvector / Eigenvalue decomposition
[E,V] = eig(M)

%% Decorrelating
X1 = X*E;

%% Plot decorrelated
figure;
scatter(X1(:,1),X1(:,2));
axis equal
title('Decorrelating');

%% Descaling
X2 = X1;
for i=1:2
    X2(:,i) = X1(:,i)./sqrt(V(i,i));
end

%% Plot descaling
figure;
scatter(X2(:,1),X2(:,2));
axis equal
title('Descaling');
