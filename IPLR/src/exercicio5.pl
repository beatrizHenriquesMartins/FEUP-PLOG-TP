% guarda no forte
:-use_module(library(clpfd)).

/*
________________________
|     |     |     |     | 
|  S1 |  S2 |  S3 |  S4 |
|_____|_____|_____|_____|
|     |           |     | 
| S12 |           | S5  |
|_____|           |_____|
|     |           |     | 
| S11 |           | S6  |
|_____|___________|_____|
|     |     |     |     | 
| S10 |  S9 |  S8 | S7  |
|_____|_____|_____|_____|

*/

guardas1(L):-
        length(L, 12),
        domain(L, 1, 12),
        count(1, L, #=, S1),
        count(2, L, #=, S2),
        count(3, L, #=, S3),
        count(4, L, #=, S4),
        count(5, L, #=, S5),
        count(6, L, #=, S6),
        count(7, L, #=, S7),
        count(8, L, #=, S8),
        count(9, L, #=, S9),
        count(10, L, #=, S10),
        count(11, L, #=, S11),
        count(12, L, #=, S12),
        sum([S1, S2, S3, S4], #=, 5),
        sum([S4, S5, S6, S7], #=, 5),
        sum([S7, S8, S9, S10], #=, 5),
        sum([S10, S11, S12, S1], #=, 5),
        labeling([], [S1, S2, S3, S4, S5, S6, S7, S8, S9, S10, S11, S12]).