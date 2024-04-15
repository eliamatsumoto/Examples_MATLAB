%% Script: NonLinear1
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

%% Synthetic data: cartesian cordinates
t    = linspace(-2*pi,2*pi,20);
xc1  = cos(t)';
xc2  = sin(t)';
y    = double(xc1.*xc2 < 0);

%% Class
nt  = length(xc1);
c   = zeros(nt,3);
for i = 1:nt
    if y(i)
        c(i,:) = [1 0 0];
    else
        c(i,:) = [0 0 1];
    end
end

%% Plotting
subplot(2,2,1)
scatter(xc1,xc2,20,c,'filled')
title('Cartesian');
xlabel('cos(t)');
ylabel('sin(t)');

%% Polar coordinates
xp1 = ones(nt,1);
xp2 = t;
subplot(2,2,2)
scatter(xp1,xp2,20,c,'filled')
title('Polar');
xlabel('Radius');
ylabel('Angle');
h = gca;
h.XLim = [0 3];

%% 3D
subplot(2,2,3)
scatter3(xc1,xc2,y,20,c,'filled')
title('Cartesian');
xlabel('cos(t)');
ylabel('sin(t)');
zlabel('x1*x2');

%% 3D
subplot(2,2,4)
scatter3(xc1,xc2,y,20,c,'filled')
title('Cartesian');
xlabel('cos(t)');
ylabel('sin(t)');
zlabel('x1*x2');
h = gca;
h.View = [-32.6053 -0.5381];



