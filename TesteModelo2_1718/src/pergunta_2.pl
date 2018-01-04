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
    test(L2). % � uma confirma��o e n�o uma restri��o porque n�o tem os operadores de restri��o

pos([],_,[]).
pos([X|Xs],L2,[I|Is]) :-
    nth1(I,L2,X),
    pos(Xs,L2,Is).

% ex2
% R.: D - As vari�veis de dom�nio est�o a ser instanciadas antes da fase de pesquisa.