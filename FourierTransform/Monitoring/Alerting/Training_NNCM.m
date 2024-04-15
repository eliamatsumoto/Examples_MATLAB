%% Neural Network Committe Machines training
%
function Model = Training_NNCM(XTra,YTra,NHidden)

%% Model Parameter
NLearners = 5;

%% Cost value
% cost =  2; % 2 + (0.5 - length(find(YTra))/length(YTra));

%% Initialization
%REG  = 0.1;
%NORM = 'percent';
rng('shuffle'); % Random seed
nhl     = NHidden*size(XTra,2);
Models  = cell(1,NLearners);
inputs  = XTra';
targets = YTra';
% ew      = (targets==0) + (targets==1)*cost; % FP is bad

%% Classifier training
for i=1:NLearners
    net = fitnet(nhl);
    net.trainParam.showWindow  = 0;
%    nett.performParam.regularization = REG;
%    nett.performParam.normalization  = NORM;    
%    net       = train(net,inputs,targets,[],[],ew,'useParallel','yes');
    net       = train(net,inputs,targets);
    Models{i} = net;
end

%% Create the result struct with predict function
Model.NNCM = Models;
Model.predictFcn = @(x)Prediction_NNCM(Model.NNCM,x);
