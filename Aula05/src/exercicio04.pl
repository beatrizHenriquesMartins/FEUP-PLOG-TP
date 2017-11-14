max(X, Y, Z, X) :-
        X > Y,
        X > Z,
        !.

max(X, Y, Z, X) :-
        Y > X,
        Y > Z,
        !.

max(_, _, Z, Z).

/* 
*************
* RESPOSTAS *
*************
4. a)  
      

   b) 
        

   c)  
      
*/