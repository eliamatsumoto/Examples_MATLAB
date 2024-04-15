%% Script: BandPass
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
%% Read file
data = imread('fruits.jpg');
ch   = data(:,:,2);

%% Show Image
h = figure;

%% Original Image
subplot(1,3,1);
imagesc(ch);
colormap(bone(100));
title('Original Image');

%% Low pass 
WL = 5;
ML = ones(WL,WL)/(WL*WL);
dc  = size(ch);
idv = 1:WL:dc(1);
idh = 1:WL:dc(2);
LP  = ch(idv,idh);
subplot(1,3,2);
imagesc(LP);
colormap(bone(100));
title('Low Pass');

%% High pass
WS = 1;
chH = diff(ch,WS);
subplot(1,3,3);
imagesc(chH);
colormap(bone(100));
title('High pass');
h = gcf;
h.Position = [15 190 1350 300];