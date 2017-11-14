dados(um).
dados(dois).
dados(tres).

/* a */
cut_teste_a(X) :-
        dados(X).

cut_teste_a('ultima_clausula').

/* b */
cut_teste_b(X) :-
        dados(X), !.

cut_teste_b('ultima_clausula').

/* c */
cut_teste_c(X,Y) :-
        dados(X),
        !,
        dados(Y).

cut_teste_c('ultima_clausula').

/* 
*************
* RESPOSTAS *
*************
3. a) | ?- cut_teste_a(X), write(X), nl, fail. 
      um
      dois
      tres
      ultima_clausula
      no

   b) | ?- cut_teste_b(X), write(X), nl, fail.
        um
        no

   c) | ?- cut_teste_c(X,Y), write(X-Y), nl, fail. 
      um - um,
      um - dois,
      um - tres
      no
*/