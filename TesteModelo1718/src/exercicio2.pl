/**************
 * Pergunta 9 *
 **************/

impoe(X,L):-
        length(Mid, X),
           append(L1, [X|_], L),
           append(_, [X|Mid], L1).

/*
R.: O predicado permite saber se a sequência introduzida cumpre a regra de
não ter número iguais seguidos.
*/

/**************
 * Pergunta 10 *
 **************/
cria_Lista(0, List, List).
cria_Lista(N, NewList, ListR):-
        impoe(N, NewList),
        Num is N-1,
        cria_Lista(Num, NewList, ListR).

langford(N,L):-
        Size is 2*N,
        length(NewList, Size),
        cria_Lista(N, NewList, L).