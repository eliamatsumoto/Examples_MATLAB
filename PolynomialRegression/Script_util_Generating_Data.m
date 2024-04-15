%% Generating_Data.m
%
% Author: Elia Matsumoto
%
% Contact: elia.matsumoto@fgv.br
%
% Date: 2020
%  
%
%% OF_Unknown_Function (code)
% function Y = OF_Unknown_Function(X,NF)
% 
% %% Calculating the unknown function
% a     = -5;
% b     =  5;
% g     =  6;
% pol   = a + (b-a).*rand(g,1);
% N     = size(X,1);
% Y     = polyval(pol,X);
% sigma = std(Y);
% 
% %% Noise factor
% Y     = Y + NF*normrnd(0,sigma,N,1);    
%     

%% Reset
close all
clear
rng('shuffle'); % Random seed
clc

%% Initialization
NObs   = 200;
a      = -5;
b      = 5;
XTotal = a + (b-a).*rand(NObs,1);

%% Noise factor
NF     = 0.5;  
YTotal = OF_Unknown_Function(XTotal,NF);

%% Splitting: Training and Testing Dataset
cv     = cvpartition(NObs,'HoldOut',0.20); 
% Training Dataset (80%)
XTra = XTotal(cv.training,:); 
YTra = YTotal(cv.training);  
% Testing Dataset (20%)
XTes = XTotal(cv.test,:);  
YTes = YTotal(cv.test);

%% Save the datasets
save OF_Data_Total    XTotal YTotal
save OF_Data_Modeling XTra YTra XTes YTes

%% Plot data
h=plot(XTotal,YTotal,'.');
set(h,'MarkerSize',10);
   