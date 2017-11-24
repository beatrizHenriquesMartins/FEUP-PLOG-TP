:-use_module(library(clpfd)).

fechadura([A, B, C]):-
        domain([A, B, C], 1, 50),
        A #= A1 * 10 + A2,
        A1 in 1..5,
        A2 in 0..9,
        B #= B1 * 10 + B2,
        B1 in 1..5,
        B2 in 0..9,
        B #= A * 2,
        C #= B+10,
        A + B #> 10,
        (A1 mod 2 #= 0 #/\ A2 mod 2 #\= 0 #\/
         A1 mod 2 #\= 0 #/\ A2 mod 2 #= 0),
        B1 mod 2 #= B2 mod 2,
        labeling([], [A, B, C]). 
        