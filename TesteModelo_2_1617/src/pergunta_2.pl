:- use_module(library(clpfd)).

p2(L1,L2) :-
      length(L1,N),
      length(L2,N),
      %
      pos(L1,L2,Is),
      all_distinct(Is),
      %
      labeling([],Is),
      test(L2).

pos([],_,[]).
pos([X|Xs],L2,[I|Is]) :-
      nth1(I,L2,X),
      pos(Xs,L2,Is).

/*
Escolha Multipla
R.: C -  Não é possível etiquetar Is, pois estas vairiaveis 
não têm dominio definido.
*/