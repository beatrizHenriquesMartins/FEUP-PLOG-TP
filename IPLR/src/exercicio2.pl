:-use_module(library(clpfd)).

puzzle_zebra(Zebra, Agua):-
        % definicao das variaveis
        Res = [Cor, Nacionalidade, Bebida, Cigarros, Animal],
        Cor = [ Vermelho, Amarelo, Azul, Verde, Branca],
        Nacionalidade = [Ingles, Espanhol, Noruegues, Ucraniano, Portugues],
        Bebida = [SumoLaranja, Cha, Cafe, Leite, Agua],
        Cigarros = [Marlboro, Chesterfield, Winston, LuckyStrike, SGLigths],
        Animal = [Cao, Raposa, Iguana, Cavalo, Zebra],
        List = [Vermelho, Amarelo, Azul, Verde, Branca, 
                Ingles, Espanhol, Noruegues, Ucraniano, 
                Portugues, SumoLaranja, Cha, Cafe, Leite, Agua, 
                Marlboro, Chesterfield, Winston, LuckyStrike, SGLigths,
                Cao, Raposa, Iguana, Cavalo, Zebra],
        domain(List, 1, 5),
        % restricoes
        all_distinct(Cor),
        all_distinct(Nacionalidade),
        all_distinct(Bebida),
        all_distinct(Cigarros),
        all_distinct(Animal),
        % O Ingles vive na casa vermelha
        Ingles #= Vermelho,
        % O Espanhol tem um cao
        Espanhol #= Cao,
        % O Noruegues vive na primeira casa a contar da esquerda
        Noruegues #= 1,
        % Na casa amarela, o dono gosta de Marlboro
        Amarelo #= Marlboro,
        % O homem que fuma Chesterfields vive na casa ao lado do homem que tem uma raposa
        Chesterfield #= Raposa + 1 #\/ Chesterfield #= Raposa - 1,
        % O Noruegues vive ao lado da casa Azul
        Noruegues #= Azul + 1 #\/ Noruegues #= Azul -1, 
        % O homem que fuma Winston tem uma iguana
        Winston #= Iguana,
        % O fumador de Luky Strike bebe sumo de laranja
        LuckyStrike #= SumoLaranja,
        % O Ucraniano bebe cha
        Ucraniano #= Cha,
        % O Portugues fuma SG Lights
        Portugues #= SGLigths,
        % Fuma-se Marlboro na casa ao lado da casa onde ha um cavalo
        Marlboro #= Cavalo + 1 #\/ Marlboro #= Cavalo - 1, 
        % Na casa verde, a bebida preferida e o cafe
        Verde #= Cafe,
        % A casa verde e imediatamente a direita (a sua direita) da casa branca
        Verde #= Branca + 1,
        % Bebe-se leite na casa do meio  
        Leite #= 3,
        %pesquisa pela resposta
        labeling([],List),
        write(Res), nl.