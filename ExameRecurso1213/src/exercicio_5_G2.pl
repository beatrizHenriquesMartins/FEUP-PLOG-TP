:-use_module(library(clpfd)).
:-use_module(library(lists)).


adj_cores(_, []).
adj_cores(Cores, [H1-H2|T]):-
        nth1(H1, Cores, V1),
        nth1(H2, Cores, V2),
        V1 #\= V2,
        adj_cores(Cores, T).

adj_cores_pares(_, [], []).
adj_cores_pares(Cores, [H1-H2|T], [Par|ParTail]):-
        nth1(H1, Cores, V1),
        nth1(H2, Cores, V2),
        %(V1 mod 2) #= 0 #\/ (V2 mod 2) #= 0 #<=> Par,
        (V1 mod 2) #= 0 #/\ (V2 mod 2) #= 0 #<=> Par,
        adj_cores_pares(Cores, T, ParTail).

custo_cor([],[],_).
custo_cor([Cor|Tail], [Custo|CustoTail], NRegioes):-
        Custo #= NRegioes - Cor + 1,
        custo_cor(Tail, CustoTail, NRegioes).

regioes(NRegioes, Adjacencias, Cores):-
        length(Cores, NRegioes),
        domain(Cores, 1, NRegioes),
        
       % Restricoes
       % regioes adjacentes t�m cores diferentes
        adj_cores(Cores, Adjacencias),
        
       % Exatamente 3 adjac�ncias tenham cores das regi�es 
       %adjacentes com valores pares
        adj_cores_pares(Cores, Adjacencias, Pares),
        sum(Pares, #=, 3),
        
       % O custo total da atribui��o das cores seja o m�nimo
       % poss�vel, sendo que o custo de
       % atribuir uma cor a uma regi�o � igual a N - Cor + 1.
        custo_cor(Cores, Custo_Por_Cor, NRegioes),
        sum(Custo_Por_Cor, #=, CustoTotal),
        
       % fase pesquisa
       % necessario adicionar down e ff por questoes de optimizacao
        labeling([minimize(CustoTotal), down, ff], Cores).