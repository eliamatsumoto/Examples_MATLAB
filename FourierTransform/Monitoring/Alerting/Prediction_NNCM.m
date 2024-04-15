%% Neural Network Committe Machines prediction
%
% function CT = NNCM_Prediction(NNCM,XTra)
%
function CT = NNCM_Prediction(NNCM,XTra)
%% Initialization
NModel = length(NNCM);
all_y  = zeros(size(XTra,1),NModel);
%% Each model predtion
for i=1:NModel
    model = NNCM{i};
    all_y(:,i) = model(XTra')';
end
y = mean(all_y,2);
CT = double(y > 0.5);
