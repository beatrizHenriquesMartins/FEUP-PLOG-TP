/*
________________
|    |    |    |
| A1 | A2 | A3 |
|____|____|____|
|    |    |    |
| A4 | A5 | A6 |
|____|____|____|
|    |    |    |
| A7 | A8 | A9 |
|____|____|____|
*/     
      
:-use_module(library(clpfd)).
:-use_module(library(lists)).

% a) resolva as versões 3x3 e 4x4 do problema
% Versão 3x3 
quadradoMagico3(Vars):-
        Vars=[A1, A2, A3, A4, A5, A6, A7, A8, A9],
        domain(Vars, 1, 9),
        all_distinct(Vars),
        % linhas
        A1 + A2 + A3 #= Soma,
        A4 + A5 + A6 #= Soma,
        A7 + A8 + A9 #= Soma,
        % colunas
        A1 + A4 + A7 #= Soma,
        A2 + A5 + A8 #= Soma,
        A3 + A6 + A9 #= Soma,
        % diagonais
        A1 + A5 + A9 #= Soma,
        A3 + A5 + A7 #= Soma,
        labeling([], Vars).

% Versão 4x4 
quadradoMagico4(Vars):-
        Vars=[A1, A2, A3, A4, A5, A6, A7, A8, A9,
              A10, A11, A12, A13, A14, A15, A16],
        domain(Vars, 1, 16),
        all_distinct(Vars),
        % linhas
        A1 + A2 + A3 + A4 #= Soma,
        A5 + A6 + A7 + A8 #= Soma,
        A9 + A10 + A11 + A12 #= Soma,
        A13 + A14 + A15 + A16 #= Soma,
        % colunas
        A1 + A5 + A9 + A13 #= Soma,
        A2 + A6 + A10 + A14 #= Soma,
        A3 + A7 + A11 + A15 #= Soma,
        A4 + A8 + A12 + A16 #= Soma,
        % diagonais
        A1 + A6 + A11 + A16 #= Soma,
        A4 + A7 + A10 + A13 #= Soma,
        labeling([], Vars).

% b) Generalize para NxN
% Passos:
% 1º construir tabuleiro
% 2º ler as Vars