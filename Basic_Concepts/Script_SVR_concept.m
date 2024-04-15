%% Script: SUPPORT VECTOR REGRESSION
%
% Autor: Elia Matsumoto (EESP-FGV)
% 
% Contato: elia.matsumoto@fgv.br
% 

%% Reseting environment
rng('shuffle'); % Random seed
close all       % Close all figure
clear           % Clear workspace
clc             % Clear command window

%% Synthetic data
Xorg = (1:50)';
Yorg = Xorg;
norg = length(Xorg);
nsX  = 0;
nsY  = 5;
X    = Xorg + normrnd(0,nsX,norg,1);
Y    = Yorg + normrnd(0,nsY,norg,1);
plot(X,Y,'o');
axis equal;

%% Linear regression
L_mdl  = fitlm(X,Y);
L_Yh   = predict(L_mdl,X);
aux   = fitlm(Y,L_Yh);
L_RMSE = aux.RMSE;
L_R2   = aux.Rsquared.Ordinary;
hold
plot(X,L_Yh,'ro')

%% SVR
S_mdl = fitrsvm(X,Y,'Standardize',true,'KernelFunction','linear');
S_Yh  = predict(S_mdl,X);
aux   = fitlm(Y,S_Yh);
S_RMSE = aux.RMSE;
S_R2   = aux.Rsquared.Ordinary;
plot(X,S_Yh,'ks')
h = legend('Observed','OLS','SVR');
h.Location = 'Best';
xlabel('X');
ylabel('Y');

%% Metrics
Models = { 'OLS'; 'SVR' };
RMSE   = [L_RMSE; S_RMSE];
R2     = [L_R2; S_R2];
TM     = table(Models,RMSE,R2);
disp(TM);