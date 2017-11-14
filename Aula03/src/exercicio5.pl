/* a */
member1(X,[X|Xs]).

member1(X,[Y|Ys]):-
        member1(X,Ys).

/* b */
member1(X,L):-
        append(_,[X|L],L).