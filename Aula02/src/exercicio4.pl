/* -*- alinea a -*- */
/* -*- condi��o de paragem -*- */
factorial(0,1).

factorial(N, F) :- N > 0, /* -*- condi��o de continuidade -*- */
        N1 is N-1,
        factorial(N1, F1),
        F is N*F1.
        
/* -*- alinea b -*- */
mostra([X|Xs]) :-
        write(X), nl,
        mostra(Xs).

mostra([]).