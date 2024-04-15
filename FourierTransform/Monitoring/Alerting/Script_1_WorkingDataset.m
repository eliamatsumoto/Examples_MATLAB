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
load('CambioUSD_Data.mat')

%% Working dataset: YWD = 0 / 1
Threshold = 0.025;
YWD = double(abs(YTotal) > Threshold);

%% Working dataset: XWD = fft
NWD = length(YWD);
n   = 0.5*size(XTotal,2);
XWD = zeros(NWD,n); 
for i = 1:NWD
    sg = XTotal(i,:);
    f = fft(sg);
    Pff = f.*conj(f); % Amplitude
    XWD(i,:) = Pff(1:n);
end

%% Save
save('WorkingDataset','XWD','YWD');