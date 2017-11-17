/* -*- alinea a -*- */
/* -*- condição de paragem -*- */
factorial(0,1).

factorial(N, F) :- N > 0, /* -*- condição de continuidade -*- */
        N1 is N-1,
        factorial(N1, F1),
        F is N*F1.
        
/* -*- alinea b -*- */
mostra([X|Xs]) :-
        write(X), nl,
        mostra(Xs).

mostra([]).