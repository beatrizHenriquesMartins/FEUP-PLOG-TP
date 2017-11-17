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

        Funciona mas n�o est� correcto, uma vez que apenas faz unifica��es e
n�o compara��es. Tamb�m n�o � capaz de procurar pelo atom 
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