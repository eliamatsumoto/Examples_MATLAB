%% List of products
% Autor: Elia Matsumoto (EESP-FGV)
%
% Contato: elia.matsumoto@fgv.br
%
% Data: 2022
%

function ListProducts = listProductsName(OR,ProductID)

%% Initialization
UniCodes     = unique(OR.ProductCode);
UniNames     = unique(OR.ProductName);
nP           = length(ProductID);
ListProducts = cell(nP,1); 

%% Names
for i=1:nP
    ind = find(ProductID(i) == UniCodes);
    ListProducts{i} = string(UniNames(ind));
end
