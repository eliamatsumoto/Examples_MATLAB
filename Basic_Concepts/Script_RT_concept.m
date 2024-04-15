%% Script: REGRESSION TREE
%
% Autor: Elia Matsumoto (Oppencadd, EESP-FGV)
% 
% Contato: elia.matsumoto@gmail.com
% 

%% Reseting environment
rng('shuffle'); % Random seed
close all       % Close all figure
clear           % Clear workspace
clc             % Clear command window

%% Synthetic data
centroids = [ ...
    1 3 ; ...
    3 1 ; ...
    5 5 ];
rays   = [0.2 0.3 0.4];
np     = [10 15 15];
ntotal = sum(np);
pts    = zeros(ntotal,2);
base   = 1;
for i = 1:length(centroids)
    spreads = normrnd(0,rays(i),np(i),2);
    repmat(centroids(i,:),np(i),1) + spreads;
    inicio = base;
    final  = inicio+np(i)-1;
    base   = final+1;
    pts(inicio:final,:) = repmat(centroids(i,:),np(i),1) + spreads;
end
plot(pts(:,1),pts(:,2),'o');

%% Regression Tree
X  = pts(:,1);
Y  = pts(:,2);
model = fitrtree(X,Y);
% model = prune(model,'Level',5);
Yh = predict(model,X);
hold
plot(X,Yh,'rs')
h = legend('Observed','Predicted');
h.Location = "best";
mdl = fitlm(Y,Yh);
title(['R^2: ' num2str(mdl.Rsquared.Ordinary) ' / RMSE: ' num2str(mdl.RMSE)]);
xlabel('X');
ylabel('Y');

%% View
view(model,"Mode","graph");
