%% Script_Polynomial_Degree.m: 
%
% Author: Elia Matsumoto
%
% Contact: elia.matsumoto@fgv.br
%
% Date: 2020
%  
%% Reset
close all
clear
rng('shuffle'); % Random seed
clc

%% Load data
FileName = 'OF_Data_Modeling.mat';
load(FileName);

%% Degree G polynomium regression model
G     = 2:10;
NG    = length(G);
rmTra = zeros(NG,1);
r2Tra = zeros(NG,1);
rmTes = zeros(NG,1);
r2Tes = zeros(NG,1);

%% Parameter sweep
for i = 1:NG
    PolCoeff = polyfit(XTra,YTra,G(i));
    YTraH = polyval(PolCoeff,XTra);
    [rmTra(i),r2Tra(i)] = regression_error_metrics(YTra,YTraH);
    YTesH = polyval(PolCoeff,XTes);
    [rmTes(i),r2Tes(i)] = regression_error_metrics(YTes,YTesH);
end

%% 'Best' parameter
[~,id] = max(r2Tes);
PolCoeff = polyfit(XTra,YTra,G(id));
YTraH = polyval(PolCoeff,XTra);
YTesH = polyval(PolCoeff,XTes);

%% Plottint training output
subplot(2,2,1)
plot(XTra,YTra,'o',XTra,YTraH,'o');
legend('Observed', 'Predicted','location','best');
title(['TRAINING SAMPLE : degree(' num2str(G(id)) ')'])
subplot(2,2,2)
scatter(YTra,YTraH);
xlabel('Observed values');
ylabel('Predicted values');
title(['RMSE = ' num2str(rmTra(id)) ...
       '/ R^2 = ' num2str(r2Tra(id))]);
% Plottint testing output
subplot(2,2,3)
plot(XTes,YTes,'o',XTes,YTesH,'o');
legend('Observed', 'Predicted','location','best');
title(['TEST SAMPLE : degree(' num2str(G(id)) ')'])
subplot(2,2,4)
scatter(YTes,YTesH);
xlabel('Observed values');
ylabel('Predicted values');
title(['RMSE = ' num2str(rmTes(id)) ...
       '/ R^2 = ' num2str(r2Tes(id))]);
