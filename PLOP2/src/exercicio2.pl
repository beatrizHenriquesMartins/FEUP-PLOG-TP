/*
problema de optimização para maximização

Variaveis:
        - casas
        - tempo
        - 
*/
:-use_module(library(clpfd)).

soma_dist([X, Y | R], Dist):-
        Dist #= abs(X-Y)+RDist,
        soma_dist([Y, R],RDist).
soma_dist([_], 0).

carteiro_preguicoso(Visitas, D):-
        length(Visitas, 10),
        domain(Visitas, 1, 10),
        all_distinct(Visitas),
        soma_dist(Visitas, D),
        labeling([maximize(D)], Visitas).