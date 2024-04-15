%% Script: Partial derivative
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

%% f(x,y) = x^2 + y^2
x = linspace(-2,2,20);
y = linspace(-2,2,20);
[mx,my] = meshgrid(x,y);
mz = mx.*mx + my.*my;
surf(mx,my,mz);
alpha(0.5);
title('f(x,y) = x^2 + y^2')
%% PT = (1,1)
XT = -1.5;
YT = -1.5;
ZT = XT^2 + YT^2;
hold
h=plot3(XT,YT,ZT,'ro');
h.MarkerFaceColor=[1 0 0];

%% df / dx (-1.5,1.5)
delta = 0.01:0.01:0.75;
xd = XT + 2*delta;
yd = YT + 2*delta;
zd = xd.^2 + yd.^2;
plot(xd,yd)
plot3(xd,yd,zd)
h=plot3(0,0,0,'bo');
h.MarkerFaceColor=[0 0 1];

%% Comet
comet3(xd,yd,zd,0.9);
ah = gca;
view(ah,[-76.3621928166351 -11.5766037735849]);

