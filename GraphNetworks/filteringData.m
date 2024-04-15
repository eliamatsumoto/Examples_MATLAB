%% Filtering Data 
% Autor: Elia Matsumoto (EESP-FGV)
% 
% Contato: elia.matsumoto@fgv.br
% 
% Data: 2022
%

function filteredM = filteringData(M,MinGoods)

%% Initialization
filteredM = M;
Customers = sort(unique(M(:,3)));
NC        = length(Customers);

%% Filtering
for i = 1:NC
    ind = find(Customers(i)==M(:,3));
    if length(ind) < MinGoods
        filteredM(ind,3) = NaN;
    end
end
ind = isnan(filteredM(:,3));
filteredM(ind,:) = [];