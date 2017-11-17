/*
        Esta não é melhor forma de programar em prolog porque repete muitas vezes
o mesmo predicado.

traduza(Codigo, Significado):-
        Codigo = 1,
        Significado = integer_overflow.

traduza(Codigo, Significado):-
        Codigo = 2,   
        Significado = divisao_por_zero.   

traduza(Codigo, Significado):-
        Codigo = 3,   
        Significado = id_desconhecido.

        Enquanto, que o exemplo a abaixo é mais efeciente porque no mesmo 
predicado permite ter as mesmas soluções.
*/

traduza(Codigo, Significado):-
        Codigo = 1,
        Significado = integer_overflow;
        Codigo = 2,   
        Significado = divisao_por_zero;   
        Codigo = 3,   
        Significado = id_desconhecido.