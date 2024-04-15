%% Script: Genetic Algorithm Optimization
%
% Author: Elia Matsumoto
% Fonte: SPTech School
%
% Contact: elia.matsumoto@fgv.br
%
%% Reseting environment
rng('shuffle'); % Random seed
close all       % Close all figure
clear           % Clear workspace
clc             % Clear command window

%% Initialization
episode  = 'IV';
Name     = 'LUKE';
filename = ['SW_Episode' episode '_ptBR.txt'];

%% Read file
tbl = readtable(filename,"TextType","string");

%% Character
idx  = tbl.Var2 == Name;

%% Bag of Words
BagName1 = tokenizedDocument(lower(tbl.Var3(idx)));

%% Word Cloud 1
wordcloud(BagName1);

%% Ponctuation
BagName2 = erasePunctuation(BagName1);
wordcloud(BagName2);
        
%% Less than 2 letters
BagName3 = removeShortWords(BagName2,2);
wordcloud(BagName3);

%% Remove "stop words"
BagName4 = removeStopWords(BagName3);
wordcloud(BagName4);

%% Remove "words"
words = ["que" "ele" "você" "está" "isso"];
BagName5 = removeWords(BagName4,words);
wordcloud(BagName5);
