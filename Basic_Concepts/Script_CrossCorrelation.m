%% Script: Cross-correlation
%
% Autor: Elia Matsumoto (Oppencadd, EESP-FGV)
% 
% Contato: elia.matsumoto@gmail.com
% 
% Ref: https://www.youtube.com/watch?v=RO8s1TrElEw
%
%% Reseting environment
rng('shuffle'); % Random seed
close all       % Close all figure
clear           % Clear workspace
clc             % Clear command window
%
%% Synthetic data
a    = [0.1 0.2 -0.1 4.1 -2.0 1.5 -0.1];
b    = [0.1 4.0 -2.2 1.6  0.1 0.1  0.2];
na   = length(a);
x    = 1:na;
vlag = [0 1 2 3 4 5 6 0 -1 -2 -3 -4 -5 -6];
nlag = length(vlag);

%% Plot param
yalim = minmax(a);
yblim = minmax(b);
%% Plot
h = figure;
subplot(3,1,1)
plot(x,a,'b*:')
hp = gca;
hp.XTick = [];
hp.YLim = yalim;
title('Serie(a)')

%% Cross-correlation
for i = 1:nlag
    lag = vlag(i);
    if lag >= 0
        ya = a(1+lag:end);
        yb = b(1:end-lag);
        xb = (1+lag):na;
    else
        ya = a(1:end+lag);
        yb = b(1-lag:end);
        xb = 1:(na+lag);
    end
    cc = ya*yb';
    subplot(3,1,2)
    plot(xb,yb,'r*:');
    hp = gca;
    hp.XLim  = [1 7];
    hp.XTick = [];
    hp.YLim = yblim;
    title('Serie(b)')
    h=xlabel(['Cross Correlation - Lag(' num2str(lag) ') : ' num2str(cc)]);
    h.FontSize = 12;
    pause(5); % key = input('Next');
end

%% Cross-correlation
lags = -6:6;
cc   = xcorr(a,b);
subplot(3,1,3)
ccval = sum(cc);
stem(lags,cc);
title(['CC value: ' num2str(ccval)]);
xlabel('Lags')
ylabel('Correlation measure')