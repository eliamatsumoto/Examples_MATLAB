%% Generate Adjacency Matrix Countries
% Autor: Elia Matsumoto (EESP-FGV)
%
% Contato: elia.matsumoto@fgv.br
%
% Data: 2022
%

function [Iind,Jind,Val,Nodes,Products] = genAdjMatrixCountries(OR,NP)

%% Initialization
ProductID = OR.ProductCode;
CountryID = OR.Country;

%% Settings
Country = sort(unique(CountryID));
NC   = length(Country);
Adim = NC^2;
Iind = zeros(Adim,1);
Jind = zeros(Adim,1);
Val  = zeros(Adim,1);
Products = cell(Adim,1);

%% Fill adjacent matrix
aind = 1;
h = waitbar(0,'Please wait ...');
for li = 1:NC
    indL = find(Country(li) == CountryID);  % Country ID in LINE
    ProductL = unique(ProductID(indL));

    for co = (li+1):NC
        indC      = find(Country(co) == CountryID);  % Country ID in COLUMN
        ProductC  = unique(ProductID(indC));
        ProductLC = intersect(ProductL,ProductC);
        Weight = length(ProductLC);
        if Weight >= NP  % At least NP country in common
            % Node
            Iind(aind) = li;
            Jind(aind) = co;
            Val(aind)  = Weight;
            Products{aind} = ProductLC;
            % Tranposed Node
            aind = aind + 1;
            Iind(aind) = co;
            Jind(aind) = li;
            Val(aind)  = Weight;
            Products{aind} = ProductLC;
            aind = aind + 1;
        end
    end
    waitbar(li/NC,h);
end
close(h);

%% Sparse matrix
indz = find(~Val);
Iind(indz) = [];
Jind(indz) = [];
Val(indz)  = [];
nPsel = max(Iind);
c     = categories(Country);
Nodes = c(1:nPsel);