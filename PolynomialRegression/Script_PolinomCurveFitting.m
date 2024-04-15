%% Script_Spline.m: 
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

%% Reset envirornment
rng('shuffle'); % Random seed
close all       % Close all windows
clear           % Clear workspace
clc             % Clear screen

%% Reading file
X = -10:10;
Y = 2*cos(X).^3 - 10*cos(2*X).^2 + X -3;
plot(X,Y,'o')

%% Polinomium
dg  = 7;
pol = polyfit(X,Y,dg)
x  = linspace(-10,10);
y  = polyval(pol,x);
plot(X,Y,'o',x,y)
