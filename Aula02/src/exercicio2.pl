a(a1,1).
a('A',2).
a(a3,'N').
b(1,b1).
b(2,'B').
b('N',b3).

c(X,Y):- 
        a(X,N), 
        b(N,Y).

d(X,Y):-
        a(X,N), 
        b(Y,N).

d(X,Y):-
        a(N,X), 
        b(N,Y).

/*
*************
* RESPOSTAS *
*************

a) |?- a(X,2).
    X = 'A' ? ;
    no

b) |?- b(X,kalamazoo).
    no

c) |?- c(X,b3).
    X = a3 ? ;
    no

d) |?- c(X,Y).
    X = a1,
    Y = b1 ? ;
    X = 'A',
    Y = 'B' ? ;
    X = a3,
    Y = b3 ? ;
    no

e) |?- d(X,Y).
    no
*/