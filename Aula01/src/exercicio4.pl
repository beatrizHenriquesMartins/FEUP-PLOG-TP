% peru, frango, salmão, solha, cerveja, vinho verde, vinho aduro, 
% Ana, António, Barbara, Bruno, gosta, casado, combina
% COMIDA: peru, frango, salmão, solha
% BEBIDA: cerveja, vinho verde, vinho aduro
% Pessoas: Ana, António, Barbara, Bruno

female('Ana').
female('Barbara').

male('António').
male('Bruno').

comida('Peru').
comida('Frango').
comida('Salmão').
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



% a) Ana e Bruno são casados e gostam de vinho verde

casadosGostamBebida(Female, Male, Bebida):-
        casados(Female, Male),
        bebida(Bebida).

% | ?- casadosGostamBebida('Ana', 'Bruno', 'Vinho Verde').
%   yes

% b) que bebida combina com salmão
% c) que comidas combinam com vinho verde

combina(Comida, Bebida):-
        comida(Comida),
        bebida(Bebida).

% b)
% | ?- combina('Salmão', Bebida).
%   Bebida = 'Cerveja' ? ;
%   Bebida = 'Vinho Verde' ? ;
%   Bebida = 'Vinho Maduro' ? ;
%   no

% c)
% | ?- combina(Comida, 'Vinho Verde').
%   Comida = 'Peru' ? ;
%   Comida = 'Frango' ? ;
%   Comida = 'Salmão' ? ;
%   Comida = 'Solha' ? ;
%   no
