/* corrigir a pergunta anterior */

:- use_module(library(clpfd)).
:- use_module(library(lists)). %EU

p2(L1,L2) :-
      length(L1, N),
      length(L2, N),
      %
      pos(L1, L2, Is),
      all_distinct(Is),
      %
      test(L2),
      labeling([], Is)
      %,test(L2) % EU
      .

pos([], _, []).
pos([X|Xs], L2, [I|Is]) :-
      %nth1(I,L2,X), % EU
      element(I, L2, X),
      pos(Xs,L2,Is).

% EU
test([]).
test([_]).
test([_,_]).
test([X1,X2,X3|Xs]) :-
      (X1 < X2, X2 < X3; X1 > X2, X2 > X3),
      test(Xs).
% EU