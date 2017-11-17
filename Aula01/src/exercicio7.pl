/*
traduza(Codigo, Significado):-
        Codigo = 1,
        Significado = integer_overflow.

traduza(Codigo, Significado):-
        Codigo = 2,   
        Significado = divisao_por_zero.   

traduza(Codigo, Significado):-
        Codigo = 3,   
        Significado = id_desconhecido.

        Funciona mas não está correcto, uma vez que apenas faz unificações e
não comparações. Também não é capaz de procurar pelo atom 
*/

traduza(1, integer_overflow).
traduza(Codigo, Significado):-
        Codigo == 1,
        Significado = integer_overflow.
traduza(2, divisao_por_zero).
traduza(Codigo, Significado):-
        Codigo == 2,   
        Significado = divisao_por_zero.
traduza(3, id_desconhecido).    
traduza(Codigo, Significado):-
        Codigo == 3,   
        Significado = id_desconhecido.