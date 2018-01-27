:-use_module(library(clpfd)).

% alinea a
lf(L):-
        % L = [A1, A2, A3, A4, A5, A6],
        length(L, 6),
        domain(L, 1, 3),
        
        % Restricoes
        % cada algarismo ocorre 2x
        global_cardinality(L, [1-2,2-2,3-2]),
        
        % 1 algarismo entre os 1's
        element(I1, L, 1),
        I11 #= I1 + 2,
        
        % 2 algarismo entre os 2's
        element(I2, L, 2),
        I22 #= I2 + 3,
        
        % 3 algarismo entre os 3's
        element(I3, L, 3),
        I33 #= I3 + 4,
        
        % fase de pesquisa
        labeling([], L).

% alinea b
langford(N,L):-
        Dimensao is 2 * N,
        length(L, Dimensao),
        domain(L, 1, N),
        % Restricoes
        % cada algarismo ocorre 2x
        ocorreTwice(CG, Dimensao),        
        global_cardinality(L, CG),
       
        % 1 algarismo entre os 1's
        % 2 algarismo entre os 2's        
        % 3 algarismo entre os 3's
        % etc
        restricao2(1, L, N),
        
        % fase de pesquisa
        labeling([], L).
        
% 1º restricao
ocorreTwice(CG, Dimensao):-
      ocorreTwice(0, CG, Dimensao).
ocorreTwice(Dimensao, [], Dimensao):-
        !.
ocorreTwice(N, [N1 - 2 |T], Dimensao):-
        N1 is N + 1,
        ocorreTwice(N1, T, Dimensao).

% 2º restricao
restricao2(Num, _, Num).
restricao2(N, L, Dimensao):-
        N1 is N +  1,
        element(Ind, L, N),
        Ind1 #= Ind + N,
        restricao2(N1, L, Dimensao).