exec(X,Y) :- p(X,Y).
exec(X,X) :- s(X).
p(X,Y) :- q(X), r(Y).
p(X,Y) :- s(X), r(Y).
q(a).
q(b).
r(c).
r(d).
s(e).

/*
*************
* RESPOSTAS *
*************

| ?- exec(X,Y).
  X = a,
  Y = c ? ;
  X = a,
  Y = d ? ;
  X = b,
  Y = c ? ;
  X = b,
  Y = d ? ;
  X = e,
  Y = c ? ;
  X = e,
  Y = d ? ;
  X = e,
  Y = e ? ;
  no  

*/