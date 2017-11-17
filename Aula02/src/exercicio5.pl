temFactor(N, P):-
        (N mod P) =:= 0.
temFactor(N,P):-
        (P * P) < N,
        P2 is (P + 2),
        temFactor(N, P2).

e_primo(2).
e_primo(3).
e_primo(N):-
        integer(N),
        N > 3,
        (N mod 2) =\= 0,
        \+temFactor(N,3). /* factor é um forma de decompor os numeros 
                                primos em factores*/