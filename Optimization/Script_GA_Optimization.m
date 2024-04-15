%% Script: Genetic Algorithm Optimization
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
pt = [-1.5 0.07];
z0 = GD_obj_function(pt(1),pt(2));
xv = optimvar("x");
yv = optimvar("y");
prob = optimproblem("Objective",GD_obj_function(xv,yv));
x0.x = pt(1);
x0.y = pt(2);
tic
[GD_XY,GD_fvalf] = solve(prob,x0);
toc
hold;
hp = plot3(pt(1),pt(2),z0,'bs');
hp.MarkerFaceColor = [0 0 1];
hp=plot3(GD_XY.x,GD_XY.y,GD_fvalf,'rs');
hp.MarkerFaceColor = [1 0 0];
% Minimun
disp(['GD: [' num2str(GD_XY.x)  ', ' num2str(GD_XY.y)  ', ' num2str(GD_fvalf) ' ]']);
ha = gca;
view(ha,[-24 61]);
%% Genetic Algorithm
% hybridopts = optimoptions('fmincon');
% options = optimoptions('ga','UseParallel',false);
options = optimoptions('ga','UseParallel',true, ...
    'FunctionTolerance', 1e-1, ...
    'HybridFcn','fmincon');
tic
[GA_XY,GA_fvalf] = ga(@GA_obj_function_plot,2, ...
    [],[],[],[],[-2;-2],[2;2],[],options);
toc
hp = plot3(GA_XY(1),GA_XY(2),GA_fvalf,'go');
hp.MarkerFaceColor = [0 1 0];
% Minimum
disp(['GA: [' num2str(GA_XY(1)) ', ' num2str(GA_XY(2)) ', ' num2str(GA_fvalf) ' ]']);
view(ha,[0 90 0]);