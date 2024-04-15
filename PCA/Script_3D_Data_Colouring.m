%% Script: 3D Colouring
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

%% "White" data
mu    = 0;
sigma = 1;
n     = 3;
k     = 2000;
X = normrnd(mu,sigma,k,n);

%% Positive Definite Matrix
M = [ 3.0   0.5  -2.0 ;  ...
      0.5   2.0   0.5 ;  ...
     -2.0   0.5   2.5 ];
     
[E,V] = eig(M)


%% Scaling
X1 = X;
for i=1:n
    X1(:,i) = X(:,i)*sqrt(V(i,i));
end

%% Correlating
X2 = X1*E';

%% Plot
subplot(1,3,1)
scatter3(X(:,1),X(:,2),X(:,3));
axis equal
title('Original');
subplot(1,3,2)
scatter3(X1(:,1),X1(:,2),X1(:,3));
axis equal
title('Scaling');
subplot(1,3,3)
scatter3(X2(:,1),X2(:,2),X2(:,3));
axis equal
title('Correlating');

DATA = X2;
save Data_3D DATA
