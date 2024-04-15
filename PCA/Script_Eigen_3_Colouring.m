
%% Script: Eigen - Colouring
%
% Author: Elia Matsumoto
%
% Contact: elia.matsumoto@fgv.br
%
%% Reseting environment
rng('shuffle'); % Random seed
close all       % Close all figure
clear           % Clear workspace
clc             % Clear command window

%% "White" data
mu    = 0;
sigma = 1;
n     = 2;
k     = 1000;
X = normrnd(mu,sigma,k,n);

%% Scatter plot
figure
scatter(X(:,1),X(:,2));
axis equal
title('Original');

%% Positive Definite Matrix
M = [ 5.0   -1.5 ;  ...
      -1.5  2.0 ];
  
M = M /max(M(:))

det(M)
     
[E,V] = eig(M)


%% Scaling
X1 = X;
for i=1:2
    X1(:,i) = X(:,i)*sqrt(V(i,i));
end

%% Plot scaled
figure;
scatter(X1(:,1),X1(:,2));
axis equal
title('Scaled');

%% Correlating
X2 = X1*E';

%% Plot correlated
figure;
scatter(X2(:,1),X2(:,2));
axis equal
title('Correlated');