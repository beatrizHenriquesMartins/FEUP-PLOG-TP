:-use_module(library(clpfd)).

% a) tabuleiro 4x4
nRainhas4(Vars):-
        Vars = [R1, R2, R3, R4],
        domain(Vars, 1, 4),
        all_distinct(Vars),
        % Restricoes
        % para R1
        R1 #\= R2 + 1,
        R1 #\= R2 - 1,
        R1 #\= R3 + 2,
        R1 #\= R3 - 2,
        R1 #\= R4 + 3,
        R1 #\= R4 - 3, 
        % para R2
        R2 #\= R3 + 1,
        R2 #\= R3 - 1,
        R2 #\= R4 + 2,
        R2 #\= R4 - 2, 
        % para R3
        R3 #\= R4 + 1,
        R3 #\= R4 - 1,
        % para pesquisa
        labeling([], Vars).

% b) tabuleiro NxN
nqueens(N,Cols):- 
        length(Cols,N),
        domain(Cols,1,N),
        jogo(Cols),
        % all_distinct(Cols),
        labeling([],Cols).

jogo([]). 
jogo([H | RCols]) :-
        safe_move(H,RCols,1),
        jogo(RCols).

safe_move(_,[],_).
safe_move(X,[Y | T], K) :-
        noattack(X,Y,K),
        K1 is K + 1, 
        safe_move(X,T,K1).

noattack(X,Y,K) :- 
        X #\= Y,
        X + K #\= Y, 
        X - K #\= Y.