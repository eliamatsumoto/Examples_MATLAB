%% Script: Gradient Descend Optimization
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

%% Surface
np   = 50;
xlim = [-2 2];
ylim = [-2 2];
x = linspace(xlim(1),xlim(2),np);
y = linspace(ylim(1),ylim(2),np);
[mx,my] = meshgrid(x,y);
mz = GD_obj_function(mx,my);
surf(mx,my,mz,'FaceAlpha',0.5)

%% Gradient Descendent
ha = gca;
view(ha,[0 90]);
disp('Pick the Initial point on the graph: ');
pt = ginput(1);
xv = optimvar("x");
yv = optimvar("y");
prob = optimproblem("Objective",GD_obj_function(xv,yv));
x0.x = pt(1);
x0.y = pt(2);
[solf,fvalf] = solve(prob,x0);
hold;
z0 = GD_obj_function(pt(1),pt(2));
h=plot3(pt(1),pt(2),z0,'ro');
h.MarkerFaceColor=[1 0 0];
h=plot3(solf.x,solf.y,fvalf,'bo');
h.MarkerFaceColor=[0 0 1];
view(ha,[45 -45 -45]);