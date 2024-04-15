%% Script: Display
%
% Author: Elia Matsumoto
%
% Contact: elia.matsumoto@fgv.br
% 
%% Reset Environemnt
close all       % Close all figure
clear           % Clear workspace
clc             % Clear command window

%% Load data
load('WorkingDataset.mat')

%% Training
Model = Training_NNCM(XWD,YWD,3);

%% Prediction
YWDH = Model.predictFcn(XWD);

%% Confusion Matrix
cm = confusionmat(YWD,YWDH)
prec = cm(2,2) / (cm(1,2)+cm(2,2))

%% Save
save('MODEL_Outcome.mat','Model','XWD','YWD','YWDH');

