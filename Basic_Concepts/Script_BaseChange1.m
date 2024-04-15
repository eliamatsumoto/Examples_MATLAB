%% Script: NonLinear1
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

%% Synthetic data: cartesian cordinates
t   = linspace(-2*pi,2*pi,20);
xc1 = [cos(t)'; 2*cos(t)'];
xc2 = [sin(t)'; 2*sin(t)'];

%% Class
nt  = length(t);
y   = [ones(nt,1);2*ones(nt,1)];
c   = [repmat([1 0 0],nt,1) ; repmat([0 0 1],nt,1)];

%% Plotting
subplot(1,2,1)
scatter(xc1,xc2,20,c,'filled')
title('Cartesian');
xlabel('cos(t)');
ylabel('sin(t)');

%% Polar coordinates
xp1 = y;
xp2 = [t'; t'];
subplot(1,2,2)
scatter(xp1,xp2,20,c,'filled')
title('Polar');
xlabel('Radius');
ylabel('Angle');
h = gca;
h.XLim = [0 3];