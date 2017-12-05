/*
___ = simbolo do carro

1 - Amarelo, 2 - Verde, 3 - Azul, 4 - Preto
         C1       C2       C3       C4
        ____     ____     ____     ____
         T1       T2       T3       T4
*/

:-use_module(library(clpfd)).

carros(Cores, Tamanhos):-
        length(Cores, 4),
        domain(Cores, 1, 4),
        length(Tamanhos, 4),
        domain(Tamanhos, 1, 4),
        all_different(Cores),
        all_different(Tamanhos),
        element(PosAzul, Cores, 3),
        PosAntesDoAzul #= PosAzul- 1,
        PosDepoisDoAzul #= PosAzul + 1,
        element(PosAntesDoAzul, Tamanhos, TamAntesDoAzul),
        element(PosDepoisDoAzul, Tamanhos, TamDepoisDoAzul),
        TamAntesDoAzul #< TamDepoisDoAzul,
        append(Cores, Tamanhos, Vars),
        labeling([], Vars).