%% Random Forest training
%
function Model = Training_RF(XTra,YTra,NTree)

%% Initialization
MTH   = 'AdaboostM1';%'Logitboost'; %
ttree = templateTree();

%% Training
rf_model = fitcensemble(XTra,YTra, ...
    'Learners',ttree, ...
    'Method',MTH, ... 
    'NumLearningCycles',NTree);

%% Create the result struct with predict function
Model.RF = rf_model;
Model.predictFcn = @(x)predict(Model.RF,x);
