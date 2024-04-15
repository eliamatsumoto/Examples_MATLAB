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
data = imread('peach.jpg');
ch   = data(:,:,2);

%% Show Image
h = figure;

%% Original Image
subplot(1,2,1);
imagesc(ch);
colormap(bone(100));
title('Original Image');

%% Low pass 
WL = 8;
YW = 190:220;
nY = length(YW);
XW = 65:90;
nX = length(XW);
LP = ch;
for i = 1:nY
    for j       = 1:nX
        w       = ch(YW(i):(YW(i)+WL),XW(j):(XW(j)+WL));
        LP(YW(i),XW(j)) = fix(mean(w(:)));
    end
end
subplot(1,2,2);
imagesc(LP);
colormap(bone(100));
title('Low Pass');
