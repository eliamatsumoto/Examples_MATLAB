%% Script: Eigen
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

%% Eigen vectors and Eigen values of A
[ev,el]=eig(A);
evel = ev*el;

%% (A * Eigen vector of A)
A*ev

%% is equal to Eigen vector of A * Eigen value of A
evel = ev*el

%% Vector X: unitary circle
t  = linspace(0,2*pi,100);
nt = length(t);
x  = [cos(t) ; sin(t)];

%% Draw x: unitary circle
plot(x(1,:),x(2,:),'b.');
legend('x: unitary circle')
hold
axis([-2 2 -2 2])

%% Draw Ax:
Ax = A*x;
plot(Ax(1,:),Ax(2,:),'r.');
legend('Ax: ellipse')

%% Draw el*x (eigenvalue)
elx = el*x;
plot(elx(1,:),elx(2,:),'b.');

%% Draw el*evx (eigenvector)
Ax1 = (ev*el/ev)*x;
plot(Ax1(1,:),Ax1(2,:),'r*');
