%% Script: Preprocessing data
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
close all       % Close all figures
clc             % Clear command window

%% Reading/Saving data
YearID    = '2011';
TableName = ['OR_' YearID '.xlsx'];
SheetName = YearID;
TabName   = readtable(TableName,"Sheet",SheetName);

%% Working Data
Country     = categorical(TabName.Country);
ProductCode = double(TabName.StockCode);
ProductName = categorical(TabName.Description);
Quantity    = double(TabName.Quantity);

%% Save Working Data
MatName = ['OR_' YearID '.mat'];
save(MatName,"Country","ProductCode","ProductName","Quantity");
