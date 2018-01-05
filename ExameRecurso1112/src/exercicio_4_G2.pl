:-use_module(library(clpfd)).
:-use_module(library(lists)).

% alinea a
seq(Vars):-
        % sequencias com 5 numeros 
        Vars = [A1, A2, A3, A4, A5],
        % numeros gerados de 1 a 9
        domain(Vars, 1, 9),
        % Restricoes
        % nao pode haver numeros repetidos
        all_distinct(Vars),
        % o numero no centro da sequencia tem de ser 1 ou 2
        A3 #= 1 #\/ A3 #= 2,
        % nao pode haver numeros impares/pares consecutivos
        R1 #= A1 mod 2, 
        R2 #= A2 mod 2,
        R3 #= A3 mod 2,
        R4 #= A4 mod 2,
        R5 #= A5 mod 2,
        R1 #\= R2,
        R2 #\= R3,
        R3 #\= R4,
        R4 #\= R5, 
        % fase de pesquisa
        labeling([], Vars).

%
seqn(Vars, N):-
        % N tem de ter um numero impar e multiplo de 3
        1 is N mod 2,
        0 is N mod 3, 
        
        % cada numero pode tomar os valores de 1 a 9
        length(Vars, N),
        domain(Vars, 1, 9),
        
        % Um numero pode aparecer no max 3x
        make_gc_list(GC),
        global_cardinality(Vars, GC),
        
        % Não pode haver numeros pares/impares consecutivos
        imparesPares(Vars),
        
        % O numero no centro da sequencia tem de ser maior do que o 1º e ultimo
        % elemento da sequencia
        IndexC is (N div 2) + 1,
        head(Vars, B),
        element(N,Vars,L),
        element(IndexC, Vars, Centro),
        write(Centro),
        Centro #> B,
        Centro #> L,
        
        % fase pesquisa
        labeling([], Vars).

make_gc_list(CG):-
      make_gc_list(1, CG).
make_gc_list(10, []):-
        !.
make_gc_list(N, [N - Counter|T]):-
        Counter in 0 .. 3,
        N1 is N + 1,
        make_gc_list(N1, T).

imparesPares([_]).
imparesPares([H1,H2|T]):-
        (H1 mod 2) #\= (H2 mod 2),
        imparesPares([H2|T]).