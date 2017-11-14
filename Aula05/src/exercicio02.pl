p(1).
p(2):-!.
p(3).

/* 
*************
* RESPOSTAS *
*************
2. a) | ?- p(X).
        X = 1 ? ;
        X = 2 ? ;
        no

   b) | ?- p(X),p(Y).
        X = 1,
        Y = 1 ? ;
        X = 1,
        Y = 2 ? ;
        X = 2,
        Y = 1 ? ;
        X = 2,
        Y = 2 ? ;
        no
        NOTA: ver árvore no caderno

   c) | ?- p(X), !, p(Y). 
      X = 1,
      Y = 1 ? yes
*/