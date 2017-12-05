/*
Dados do problema:
        > 12 automoveis
     -- SUPOSTAMENTE OS FACEIS
     |  > 1º e ultimo são iguais
     |  > 2º e penultimo são iguais
     |  > 5º é azul
     |  > cada trio tem 3 carros dierentes
     --
        A DECISAO FINAL
        > sequencia amamrela - verde - vermelho - azul 
*/
:-use_module(library(clpfd)).

trios([A, B, C|R]):-
        all_different([A, B, C]),
        trios([B, C|R]).
trios([_,_]).

func(Carros):-
       length(Carros, 12),
       domain(Carros, 1, 4),
       global_cardinality(Carros, [1 - 4, 2 - 2, 3 - 3, 4 - 3]).

quadros([X1, X2, X3, X4|R],[B|Bs]):-
       X1 #= 1 #/\ X2 #= 2 #/\ X3 #= 3 #/\ X4 #= 4 #<=> B,
       quadros([X2, X3, X4|R], Bs).
quadros([_,_,_],[]).