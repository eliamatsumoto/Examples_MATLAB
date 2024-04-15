%% Script: Eigen - Identity Correlation
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
n     = 3;
k     = 10000;
X = normrnd(mu,sigma,k,n);

%% Scatter plot
scatter3(X(:,1),X(:,2),X(:,3));
ga = gca;
d  = 5;
set(ga,'XLim',[-d d]);
set(ga,'YLim',[-d d]);
set(ga,'ZLim',[-d d]);


