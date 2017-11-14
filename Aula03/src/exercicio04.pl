inverter(Lista, ListaInvertida):-
        rev(Lista,[],ListaInvertida).

rev([H|T], S, R):-
        rev(T, [H|S], R).

rev([], R, R).

/*para testar: | ?- inverter([a,b,c,d,e],LI).*/