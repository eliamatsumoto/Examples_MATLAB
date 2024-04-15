%% Script: SVD
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

%% Matrix A
% A = [2 1;1 2]/2
A = [2 1;3 4]/4
% A = [-1 1; 1 -1]; 

%% SVD of A
[U,S,V] = svd(A);

%% Vector X: unitary circle
t  = linspace(0,2*pi,100);
nt = length(t);
x  = [cos(t) ; sin(t)];

%% Draw x: unitary circle
plot(x(1,:),x(2,:),'b.',x(1,1),x(2,1),'ko');
hold
axis([-1.5 1.5 -1.5 1.5])

%% Draw S*x (scaling)
sx = S*x;
plot(sx(1,:),sx(2,:),'b.',sx(1,1),sx(2,1),'ko');

%% Draw Ax:
Ax = A*x;
h=plot(Ax(1,:),Ax(2,:),'r.',Ax(1,1),Ax(2,1),'kd');
set(h(2),'Markersize',10);

%% Rotation U
usx = U*S*x;
plot(usx(1,:),usx(2,:),'b.',usx(1,1),usx(2,1),'ko');

%% Rotation V
usvx = U*S*V*x;
ht=plot(usvx(1,:),usvx(2,:),'r.',usvx(1,1),usvx(2,1),'ks');
set(h(2),'Markersize',10);
