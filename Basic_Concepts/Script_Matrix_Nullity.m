%% Script: Matrix Nullity
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
M = [1 2 4; 1/2 1 2];

%%
plot3([0 M(1,1)], [0 M(1,2)], [0 M(1,3)],'b:s')
grid
hold
%%
plot3([0 M(2,1)], [0 M(2,2)], [0 M(2,3)],'r:o')
%% Repositionting
ha = gca;
ha.CameraPosition = [-4 -30 30];
ha.XLim = [-4 4];
ha.YLim = [-4 4];
ha.ZLim = [-4 4];

%% Null space
% z = -x/4 - y/2
x = -2:0.2:2;
y = -2:0.2:2;
[mx,my] = meshgrid(x,y);
mz = (-1/4)*mx + (-1/2)*my;
mesh(mx,my,mz)
title('$Null space (x + 2y + 4z = 0) \perp Vector (1, 2, 4)$','Interpreter','latex')

%% Repositioning camera
mesh(mx,my,mz)
title('$Null space (x + 2y + 4z = 0) \perp Vector (1, 2, 4)$','Interpreter','latex')
ha = gca;
ha.CameraPosition = [60 -30 0];