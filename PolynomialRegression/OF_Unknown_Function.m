%% Unknown_Function.m
%
% Author: Elia Matsumoto
% Contact: elia.matsumoto@fgv.br
% Date: Oct/2018
%  
function Y = OF_Unknown_Function(X,NF)

%% Polinomium degree
ag = 1;
bg = 21;
g  =  fix(ag + (bg - ag) * rand);

%% Calculating the unknown function
a     = -5;
b     =  5;
pol   = a + (b-a).*rand(g,1);
N     = size(X,1);
Y     = polyval(pol,X);
sigma = std(Y);

%% Noise factor
Y     = Y + NF*normrnd(0,sigma,N,1);    
    
