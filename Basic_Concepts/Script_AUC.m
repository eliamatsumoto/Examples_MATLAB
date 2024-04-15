%% Script: AUC
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

%% Synthetic data
ny = 10;
Y  = double(rand(ny,1)>0.5);
Yh = double(rand(ny,1)>0.5);

%% Confusion mat
[cm, order] = confusionmat(Y,Yh);

%% Metric
if numel(cm) == 1
    TPR = order;
    FPR = 1 - order;
else
    den = cm(2,1)+cm(2,2);
    if den < eps
        FPR = 0;
    else
        FPR = cm(2,1) / den;
    end
    den = cm(1,1)+cm(1,2);
    if den < eps
        TPR = 0;
    else
        TPR = cm(1,1) / den;
    end
end
disp(cm);
disp([FPR TPR]);

%% Curve
xc = [0 FPR 1 1 0];
yc = [0 TPR 1 0 0];
sc = polyshape(xc,yc);
ac = area(sc);
plot(sc)
title(['AUC: ' num2str(ac)]);
[x,y,t,a] = perfcurve(Y,Yh,1);
disp(a);

    
