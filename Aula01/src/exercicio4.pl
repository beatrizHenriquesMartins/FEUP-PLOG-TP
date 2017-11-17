% peru, frango, salm�o, solha, cerveja, vinho verde, vinho aduro, 
% Ana, Ant�nio, Barbara, Bruno, gosta, casado, combina
% COMIDA: peru, frango, salm�o, solha
% BEBIDA: cerveja, vinho verde, vinho aduro
% Pessoas: Ana, Ant�nio, Barbara, Bruno

female('Ana').
female('Barbara').

male('Ant�nio').
male('Bruno').

comida('Peru').
comida('Frango').
comida('Salm�o').
comida('Solha').

bebida('Cerveja').
bebida('Vinho Verde').
bebida('Vinho Maduro').

comidaEBebida(Comida, Bebida):-
        comida(Comida),
        bebida(Bebida).

casados(Female, Male):-
        female(Female),
        male(Male).



% a) Ana e Bruno s�o casados e gostam de vinho verde

casadosGostamBebida(Female, Male, Bebida):-
        casados(Female, Male),
        bebida(Bebida).

% | ?- casadosGostamBebida('Ana', 'Bruno', 'Vinho Verde').
%   yes

% b) que bebida combina com salm�o
% c) que comidas combinam com vinho verde

combina(Comida, Bebida):-
        comida(Comida),
        bebida(Bebida).

% b)
% | ?- combina('Salm�o', Bebida).
%   Bebida = 'Cerveja' ? ;
%   Bebida = 'Vinho Verde' ? ;
%   Bebida = 'Vinho Maduro' ? ;
%   no

% c)
% | ?- combina(Comida, 'Vinho Verde').
%   Comida = 'Peru' ? ;
%   Comida = 'Frango' ? ;
%   Comida = 'Salm�o' ? ;
%   Comida = 'Solha' ? ;
%   no
