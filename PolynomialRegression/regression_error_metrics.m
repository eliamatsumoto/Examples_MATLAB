%% Regression Error Metrics.m
%
% Inputs: 
%      Y: observed values
%      Yh: predicted values
% Output:  RMSE, R2
%
% Author: Elia Matsumoto
% Contact: elia.matsumoto@fgv.br
% Date: 2020
%  
%% Regression Error Metrics: RMSE, R2
function [RM,R2] = regression_error_metrics(Y,Yh)
%% Column format
nY   = length(Y);
Y    = reshape(Y,nY,1);
Yh    = reshape(Yh,nY,1);
%% Error
Err  = Y - Yh;
LinE = LinearModel.fit(Y,Yh);
%% Error metrics
RM   = sqrt((Err'*Err)/length(Err)); % RMSE
R2   = LinE.Rsquared.Adjusted;    