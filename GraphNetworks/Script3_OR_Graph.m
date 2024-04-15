%% Script: Synthetic Graph
%
% Autor: Elia Matsumoto (EESP-FGV)
% 
% Contato: elia.matsumoto@fgv.bru
% 
% Data: 2022
%
%% Reseting environment
rng("shuffle"); % Random seed
close all       % Close all windows
clear           % Clear workspace
clc             % Clear command window

%% Reading data
Name     = 'OR_2010';
MatName  = [Name '.mat'];
OR       = load(MatName);

%% Filling the Adjacency Matrix
NP = 30;
[Iind,Jind,Val,Nodes,Products] = genAdjMatrixCountries(OR, NP);

%% Adjacency Matrix
AMatrix = sparse(Iind,Jind,Val);
NodeTable = table(Nodes,'VariableNames',{'Name'});

%% Create the Graph
G          = graph(AMatrix,NodeTable);
MeanDegree = mean(G.degree);

%% Show adjacency matrix
figure;
spy(AMatrix);
title("Adjacent Matrix")

%% Show Graph
figure;
plot(G,'NodeLabel',G.Nodes.Name);
title("Graph")
xlabel("Mean degree: "+num2str(MeanDegree,2));

%% H = subgraph
C = 'Brazil';
N = neighbors(G,C);
H = subgraph(G, [C; N]);
LWidths = 5*H.Edges.Weight/max(H.Edges.Weight);
figure;
plot(H,'NodeLabel',H.Nodes.Name,'EdgeLabel',H.Edges.Weight,'LineWidth',LWidths)
title(['Sub-Graph: ' C]);
m = mean(H.degree);
xlabel("Sub graph mean degree: "+num2str(m,2));
disp(H.Edges);

%% 
figure;
subplot(1,3,1)
spy(AMatrix);
title("Adjacent Matrix")
subplot(1,3,2)
plot(G,'NodeLabel',G.Nodes.Name);
title("Graph")
xlabel("Mean degree: "+num2str(MeanDegree,2));
subplot(1,3,3)
plot(H,'NodeLabel',H.Nodes.Name,'EdgeLabel',H.Edges.Weight)
title(['Sub-Graph: ' C]);

%% 
figure
plot(H,'NodeLabel',H.Nodes.Name,'EdgeLabel',H.Edges.Weight,'Layout','subspace3','LineWidth',LWidths)
