/* -*- Mode:Prolog; 
coding:iso-8859-1; 
indent-tabs-mode:nil; 
prolog-indent-width:8;
prolog-paren-indent:3; 
tab-width:8; -*- */

/* -*- alinea a -*- */
factorial(0,1). /* -*- condição de paragem -*- */

factorial(N, F) :- N > 0, /* -*- condição de continuidade -*- */
        N1 is N-1,
        factorial(N1, F1),
        F is N*F1.
        
/* -*- alinea b -*- */
mostra([X|Xs]) :-
        write(X), nl,
        mostra(Xs).

mostra([]).