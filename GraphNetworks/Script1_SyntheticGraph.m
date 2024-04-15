%% Script: Synthetic Graph
%
% Autor: Elia Matsumoto (EESP-FGV)
% 
% Contato: elia.matsumoto@fgv.br
% 
% Data: 2022
%
%% Reseting environment
rng('shuffle'); % Random seed
clear           % Clear workspace
clc             % Clear command window

%% Initialization
NNodes  = 5;
PEdges  = 0.1;
AMDim   = NNodes^2;
NEdges  = fix(AMDim*PEdges*2);
AMatrix = sparse(NNodes,NNodes);

%% Filling the Adjacent Matrix
Edges = randi(AMDim,NEdges,1);
AMatrix(Edges) = 1;
AMatrix = triu(AMatrix);
AMatrix = AMatrix + AMatrix';

%% Create the Graph
G          = graph(AMatrix);
MeanDegree = mean(G.degree);

%% Show graph
subplot(1,2,1)
spy(AMatrix);
title("Adjacent Matrix")
subplot(1,2,2)
plot(G)
title("Graph")
xlabel("Mean degree: "+num2str(MeanDegree,2));