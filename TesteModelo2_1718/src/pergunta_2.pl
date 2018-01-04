:- use_module(library(clpfd)).
:- use_module(library(lists)).

p2(L1,L2) :-
    length(L1,N),
    length(L2,N),
    %
    pos(L1,L2,Is), % instanciadas antes da fase de pesquisa
    all_distinct(Is),
    %
    labeling([],Is), % fase de pesquisa
    test(L2). % é uma confirmação e não uma restrição porque não tem os operadores de restrição

pos([],_,[]).
pos([X|Xs],L2,[I|Is]) :-
    nth1(I,L2,X),
    pos(Xs,L2,Is).

% ex2
% R.: D - As variáveis de domínio estão a ser instanciadas antes da fase de pesquisa.