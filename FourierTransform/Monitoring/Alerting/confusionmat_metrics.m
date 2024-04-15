%% Confusion matrix metrics:Accuracy, Sensitivity, Specificity
function [Acc,Sens,Spec] = confusionmat_metrics(CM)
%% Accuracy
Acc = trace(CM)/sum(CM(:));

%% Sensitivity
tpp = CM(1,2) + CM(2,2); % # Total positive predictions
cpp = CM(2,2);           % # Correct positive predictions
if tpp
    Sens = cpp / tpp;
else
    Sens = 0;
end

%% Specificity
tnp = CM(1,1) + CM(2,1); % # Total negative predictions
cnp = CM(1,1);           % # Correct positive predictions
if tnp
    Spec = cnp / tnp;
else
    Spec = 0;
end
