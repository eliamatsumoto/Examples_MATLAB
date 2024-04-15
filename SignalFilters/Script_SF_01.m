%% Script: Signal filtering
%
% Autor: Elia Matsumoto (EESP-FGV)
% 
% Contato: elia.matsumoto@fgv.br
% 
% Data: 2021
% 
% Ref: https://www.youtube.com/watch?v=i76B1pBoN4Y
%
%% Reseting environment
rng('shuffle'); % Random seed
close all       % Close all figure
clear           % Clear workspace
clc             % Clear command window
%
%% Synthetic data
N  = 100;
x1 = linspace(0,pi,N);
x2 = linspace(pi,2*pi,N);
x3 = linspace(2*pi,3*pi,N);
y1 = 1*cos(1*x1);
y3 = 1*cos(1*x3);
y2 = y1+sin(50*x2)+y3;

%% Plot
h = figure;
% Original signal
x = [ x1 x2 x3 ];
y = [ y1 y2 y1 ];
ny = length(y);
subplot(3,1,1);
plot(y)
title('Original signal')

%% Low pass (mean)
WL  = 5;
ny1 = ny - WL + 1;
yL  = zeros(1,ny1);
for i = 1:ny1
    inic  = i;
    fin   = i + WL - 1;
    yL(i) = mean(y(inic:fin));
end
subplot(3,1,2);
plot(yL)
title('Low pass (mean)');

%% High pass (diff)
WH = 2;
yH = diff(y,WH);
subplot(3,1,3);
plot(yH)
title('High pass (diff)');